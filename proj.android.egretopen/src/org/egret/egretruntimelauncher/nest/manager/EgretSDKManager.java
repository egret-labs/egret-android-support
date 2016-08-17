package org.egret.egretruntimelauncher.nest.manager;

import org.egret.egretruntimelauncher.utils.LogUtil;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
/**
 * 功能描述:EgretH5SDK管理类
 * 是否修改:渠道使用自有的H5SDK.需要修改此类 
 * 修改点1:login(final JSONObject params, final OnLoginProcessListener listener)
 * 修改点2:pay(final JSONObject params, final OnPayProcessListener listener)
 * @author imathliu
 *
 */
public class EgretSDKManager {

    protected static final String TAG = "EgretSDKManager";

    private EgretWebViewDialog mWebView;

    private Activity mActivity;

    private String gameId;

    private String spId;

    private SharedPreferences pref;

    public static EgretSDKManager instance;

    public static EgretSDKManager getInstance() {
        if (instance == null) {
            instance = new EgretSDKManager();
        }
        return instance;
    }
    
    /**
     * 功能描述:SDK初始化
     * 是否修改:否
     * @param activity
     * @param gameId
     * @param spId
     */
    public void init(Activity activity, String gameId, String spId) {
        this.mActivity = activity;
        this.gameId = gameId;
        this.spId = spId;
        pref = PreferenceManager.getDefaultSharedPreferences(activity);
    }
    
    /**
     * 功能描述:自动登录
     * 是否修改:否
     * @param params
     * @param listener
     */
    public void checkLogin(final JSONObject params,
            final OnLoginProcessListener listener) {

        String data = pref.getString("user", "");

        LogUtil.d(TAG, "launcher checkLogin data:" + data);

        JSONObject json;
        try {
            if (data.equals("")) {
                json = new JSONObject();
                json.put("result", 0);
                listener.finishLoginProcess(json);
            } else {
                json = new JSONObject(data);
                listener.finishLoginProcess(json);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 功能描述:手动登录
     * 是否修改:是
     * 修改内容:loginUrl 指向渠道H5SDK登录Url
     * @param params
     * @param listener
     */
    public void login(final JSONObject params,
            final OnLoginProcessListener listener) {
        this.mActivity.runOnUiThread(new Runnable() {

            @Override
            public void run() {
                //本地登录界面
//                String loginUrl = "file:///android_asset/sdk/login.html?";
                //远端登录界面
                String loginUrl =
                        "http://update.runtime.egret.com/egret-runtime"
                        + "/sdk/v1/login.html?";

                String loginParams = "platInfo=open_";
                loginParams += gameId + "_" + spId;

                loginUrl += loginParams;

                LogUtil.d(TAG, "launcher loginUrl" + loginUrl);

                mWebView = new EgretWebViewDialog(mActivity,
                        new EgretWebViewDialog.WebViewListener() {

                            @Override
                            public void jsCallJava(JSONObject json) {

                                SharedPreferences.Editor editor = pref.edit();

                                editor.putString("user", json.toString());
                                editor.commit();

                                listener.finishLoginProcess(json);

                            }
                        });
                mWebView.initWithUrl(loginUrl);
                mWebView.showDialog();

            }

        });
    }
    
    /**
     * 功能描述:支付
     * 是否修改:是
     * 修改内容:payUrl 指向渠道H5SDK支付Url
     * @param params
     * @param listener
     */
    public void pay(final JSONObject params, final OnPayProcessListener listener) {
        this.mActivity.runOnUiThread(new Runnable() {

            @Override
            public void run() {

                String payUrl;
                try {
                    payUrl = params.getString("url");
                    LogUtil.d(TAG, "launcher pay url:" + payUrl);
                    mWebView = new EgretWebViewDialog(mActivity,
                            new EgretWebViewDialog.WebViewListener() {

                                @Override
                                public void jsCallJava(JSONObject json) {
                                    listener.finishPayProcess(json);
                                }
                            });
                    mWebView.initWithUrl(payUrl);
                    mWebView.showDialog();
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        });
    }
}
