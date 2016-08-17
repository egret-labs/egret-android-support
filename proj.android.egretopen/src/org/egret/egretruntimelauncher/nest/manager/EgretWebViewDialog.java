package org.egret.egretruntimelauncher.nest.manager;

import org.egret.egretruntimelauncher.utils.LogUtil;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Handler;
import android.view.Display;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class EgretWebViewDialog extends WebView {

    public interface WebViewListener {
        public void jsCallJava(JSONObject json);
    }

    private static final String TAG = "EgretWebViewDialog";

    boolean layoutChangedOnce = false;

    private AlertDialog alertDialog;
    private FrameLayout layout;
    private Handler mainThreadHandler;
    private String url;
    
    private Button closeBtn;
    
    private WebViewListener mListener;

    public EgretWebViewDialog(Context context, WebViewListener listener) {
        super(context);
        mainThreadHandler = new Handler(context.getMainLooper());
        this.setWebViewClient(new WebViewClientImpl(context, listener));
        this.setWebChromeClient(new WebChromeClientImpl(context, listener));
        getSettings().setDomStorageEnabled(true);
        getSettings().setJavaScriptEnabled(true);

        this.addJavascriptInterface(this, "egret_webview_context");
        
        this.clearCache(true);
        this.clearHistory();
        
        this.mListener = listener;

        this.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN :
                    case MotionEvent.ACTION_UP :

                        v.requestFocus();
                        if (!v.hasFocus()) {
                            v.requestFocus();
                        }
                        break;
                }
                return false;
            }
        });

        SetLayout(context);
        setDialog(context);

    }
    private void setDialog(Context context) {
        AlertDialog.Builder builder = new AlertDialog.Builder(context);

        builder.setCancelable(false);

        builder.setOnCancelListener(new OnCancelListener() {

            @Override
            public void onCancel(DialogInterface arg0) {

                EgretWebViewDialog.this.onDialogClose();

            }

        });

        alertDialog = builder.create();
        // alertDialog.setCancelable(false);
        alertDialog.setView(layout, 0, 0, 0, 0);
    }

    private void SetLayout(Context context) {
        WindowManager manager = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
        Display display = manager.getDefaultDisplay();

        int deviceWidth = display.getWidth();
        int deviceHeight = display.getHeight();

        layout = new FrameLayout(context);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT);

        params.width = deviceWidth;
        params.height = deviceHeight;
        layout.setLayoutParams(params);
        layout.setBackgroundColor(0);

        FrameLayout.LayoutParams webViewParams = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT);

        if (this.getResources().getConfiguration().orientation
                == Configuration.ORIENTATION_LANDSCAPE) {
            webViewParams.width = (int) (deviceWidth * 0.6);
            webViewParams.height = (int) (deviceHeight * 0.9);
        } else {
            webViewParams.width = (int) (deviceWidth * 0.9);
            webViewParams.height = (int) (deviceHeight * 0.9);
        }

        this.setLayoutParams(webViewParams);
        
        closeBtn = new Button(context);
        closeBtn.setText("close");
        
        LinearLayout.LayoutParams btnParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        
        closeBtn.setLayoutParams(btnParams);
        closeBtn.setOnClickListener(new View.OnClickListener() {
            
            @Override
            public void onClick(View arg0) {
                JSONObject json = new JSONObject();
                try {
                    json.put("result", -1);
                    mListener.jsCallJava(json);
                    closeDialog();
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        });
                        
        layout.addView(this);
        
        layout.addView(closeBtn);
        
    }

    public void initWithUrl(String url) {
        this.url = url;
        this.loadUrl(url);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (!layoutChangedOnce) {
            super.onLayout(changed, l, t, r, b);
            layoutChangedOnce = true;
        }
    }

    @Override
    protected void onFocusChanged(boolean focused, int direction,
            Rect previouslyFocusedRect) {
        super.onFocusChanged(true, direction, previouslyFocusedRect);
    }

    @Override
    public boolean onCheckIsTextEditor() {
        return true;
    }

    @JavascriptInterface
    public void showDialog() {

        mainThreadHandler.post(new Runnable() {

            @Override
            public void run() {
                alertDialog.show();
            }

        });

    }

    @JavascriptInterface
    public void closeDialog() {
        this.close();
    }

    private void onDialogClose() {

        String currentUrl = this.getUrl();
        if (!currentUrl.equals(url)) {
            this.loadUrl(url);
        }

    }

    public void close() {
        if (this.alertDialog != null) {
            this.alertDialog.cancel();
            this.alertDialog = null;
        }
    }

    @JavascriptInterface
    public void jsCallJava(String result) {
        try {
            JSONObject data = new JSONObject(result).getJSONObject("data");
            mListener.jsCallJava(data);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        mainThreadHandler.post(new Runnable() {
            @Override
            public void run() {
                close();
            }
        });
    }

    @Override
    public boolean onKeyDown(final int pKeyCode, final KeyEvent pKeyEvent) {
        LogUtil.d(TAG, "onKeyDown");

        if (pKeyCode == KeyEvent.KEYCODE_BACK && this.canGoBack()) {
            this.goBack();
            return true;
        }

        if (pKeyEvent.getAction() == KeyEvent.ACTION_DOWN) {
            if (pKeyCode == KeyEvent.KEYCODE_BACK) {
                LogUtil.d(TAG, "onKeyDown BACK");

                JSONObject json = new JSONObject();
                try {
                    json.put("result", -1);
                    mListener.jsCallJava(json);
                    closeDialog();
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                return true;
            }
        }
        return super.onKeyDown(pKeyCode, pKeyEvent);
    }
}