package org.egret.egretruntimelauncher.nest.manager;

import org.egret.egretruntimelauncher.nest.manager.EgretWebViewDialog.WebViewListener;
import org.egret.egretruntimelauncher.utils.LogUtil;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.net.http.SslError;
import android.webkit.SslErrorHandler;
import android.webkit.WebView;
import android.webkit.WebViewClient;
/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class WebViewClientImpl extends WebViewClient {

    private static final String TAG = "WebViewClientImpl";

    private Context mContext;

    private WebViewListener mListener;

    public WebViewClientImpl(Context context, WebViewListener listener) {

        this.mContext = context;
        this.mListener = listener;

    }
    
    @Override
    public void onReceivedSslError(WebView view,
            SslErrorHandler handler, SslError error) {
        //接受所有证书
        handler.proceed();
    }
    
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        // 重写此方法表明点击网页里面的链接还是在当前的webview里跳转，不跳到浏览器那边
        if (url.startsWith("weixin:")) {
            // 网页有微信支付，此时的链接为weixin:开头的，需单独处理
            try {
                Uri uri = Uri.parse(url);
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                mContext.startActivity(intent);
            } catch (Exception e) {
                LogUtil.d(TAG, "未安装微信或者版本过低" + e.toString()) ;
                //提示用户安装更新微信最新版本
                showInstallDialog("微信支付仅支持微信6.0.2 及以上版本，请更新安装最新版本微信.");
            }
        } else if (url.startsWith("mqqapi:")) {
            // 网页有微信支付，此时的链接为weixin:开头的，需单独处理
            try {
                Uri uri = Uri.parse(url);
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                mContext.startActivity(intent);
            } catch (Exception e) {
                LogUtil.d(TAG, "未安装QQ或者版本过低" + e.toString()) ;
                //提示用户安装更新手机QQ最新版本
                showInstallDialog("QQ钱包仅支持手机QQ4.6.1 及以上版本，请更新安装最新版本手机QQ.");
            }
        } else {
            view.loadUrl(url);
        }
        return true;
    }
    
    /**
     * 提示用户安装并更新最新版本客户端
     */
    protected void showInstallDialog(String msg) {
        Builder builder = new Builder(mContext);
        builder.setTitle("支付提示")
                .setCancelable(false)
                .setMessage(msg)
                .setPositiveButton("确定", new OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
                dialog.cancel();

                JSONObject json = new JSONObject();
                try {
                    json.put("result", "-1");
                    json.put("errorMessage", "支付失败");
                    mListener.jsCallJava(json);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            
        }).show();
    }
    
    @Override
    public void onPageFinished(WebView view, String url) {

        super.onPageFinished(view, url);

        LogUtil.d(TAG, "launcher onPageFinished url:" + url);

        String completeUrl = "http://api.egret-labs.org/games/www/game.php/";

        if (url.contains(completeUrl)) {
            JSONObject json = new JSONObject();
            try {
                json.put("result", "0");
                json.put("errorMessage", "返回游戏");
                mListener.jsCallJava(json);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public void onScaleChanged(WebView view, float oldScale, float newScale) {
        // webView发生改变时调用
        LogUtil.d(TAG, "launcher onScaleChanged");
    }

}