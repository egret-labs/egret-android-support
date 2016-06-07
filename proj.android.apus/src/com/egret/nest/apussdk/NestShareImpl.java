package com.egret.nest.apussdk;

//import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
import java.util.UUID;

import org.egret.runtime.nest.NestProxy;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

/**
 * 功能描述:分享系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点1:isSupport(final Object proxy)
 * 修改点2:share(final Object proxy)
 * @author imathliu
 *
 */
public class NestShareImpl {
    private static final String TAG = "NestShareImpl";
    private Activity mActivity = null;
    
    public NestShareImpl(Activity activity){
    	 mActivity = activity;
    }
	/**
	 * 功能描述:用户分享功能开关
	 * 是否修改:渠道使用自有的SDK实现用户分享.需要修改此类
	 * 修改内容:obj.put("share", "1");
	 * @param proxy
	 */
    public void isSupport(final NestProxy proxy) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("status", "0");
            /**
             * share 参数定义
             * 0:不支持 默认值
             * 1:支持
             */
            obj.put("share", "0");
            //必须.将客户端的是否支持分享通知Runtime.游戏根据此结果决定是否开放分享功能
            proxy.invokeCallback(obj);
//            EgretReflectUtils.invokeNestProxyCallback(proxy, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 功能描述:用户分享
     * 是否修改:渠道使用自有的SDK实现用户分享.需要修改此类
     * 修改内容:重写share的实现
     * @param proxy
     */
    public void share(final NestProxy proxy) {
        /**
         * 渠道使用自有的SDK实现用户支付.请重写share实现 
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将结果回传Runtime
         * json格式说明
         * json.put("result","0");
         * 0:分享成功
         * －1:用户取消
         */
    		Log.d(TAG,"share");
    }
}
