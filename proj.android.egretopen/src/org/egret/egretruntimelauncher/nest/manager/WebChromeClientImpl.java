package org.egret.egretruntimelauncher.nest.manager;

import org.egret.egretruntimelauncher.nest.manager.EgretWebViewDialog.WebViewListener;
import org.egret.egretruntimelauncher.utils.LogUtil;

import android.content.Context;
import android.os.Message;
import android.webkit.ConsoleMessage;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Toast;
/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class WebChromeClientImpl extends WebChromeClient {

    private static final String TAG = "WebViewChromeClientImpl";

    private Context mContext;

    private WebViewListener mListener;

    public WebChromeClientImpl(Context context, WebViewListener listener) {
        this.mContext = context;
        this.mListener = listener;
    }

    @Override
    public boolean onCreateWindow(WebView view, boolean isDialog,
            boolean isUserGesture, Message resultMsg) {

        final EgretWebViewDialog childView = new EgretWebViewDialog(mContext,
                mListener);
        final WebSettings settings = childView.getSettings();
        settings.setJavaScriptEnabled(true);
        childView.setWebChromeClient(this);

        WebView.WebViewTransport transport =
                (WebView.WebViewTransport) resultMsg.obj;
        transport.setWebView(childView);
        resultMsg.sendToTarget();

        childView.showDialog();

        return true;

    }

    @Override
    public void onCloseWindow(WebView window) {

        EgretWebViewDialog currentWebView = (EgretWebViewDialog) window;
        LogUtil.d(TAG, "onCloseWindow");
        currentWebView.close();

    }

    @Override
    public boolean onConsoleMessage(ConsoleMessage consoleMessage) {

        String message = consoleMessage.sourceId() + "\n"
                + consoleMessage.message() + "\n" + consoleMessage.lineNumber();
        LogUtil.d(TAG, message);
        return true;
    }

    @Override
    public boolean onJsAlert(WebView view, String url, String message,
            JsResult result) {

        Toast.makeText(mContext, message, Toast.LENGTH_SHORT).show();
        result.cancel();
        return true;

    }

}
