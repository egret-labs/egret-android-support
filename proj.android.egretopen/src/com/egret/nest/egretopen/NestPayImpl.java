package com.egret.nest.egretopen;

import org.egret.egretruntimelauncher.nest.manager.EgretSDKManager;
import org.egret.egretruntimelauncher.nest.manager.OnPayProcessListener;
import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
import org.egret.egretruntimelauncher.utils.LogUtil;
import org.json.JSONObject;

/**
 * 功能描述:支付系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点:pay(final Object proxy)
 * @author imathliu
 *
 */
public class NestPayImpl {

    private static final String TAG = "NestPayImpl";
    
    /**
     * 功能描述:用户支付
     * 是否修改:渠道使用自有的SDK实现用户支付.需要修改此类
     * 修改内容:重写pay的实现
     * @param proxy
     */
    public void pay(final Object proxy) {
        LogUtil.d(TAG, "pay");
        
        //TODO 实现pay功能 
        /**
         * 渠道使用自有的SDK实现用户支付.请重写pay实现 
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将结果回传Runtime
         */
        
        //获取支付订单参数
        final JSONObject param = EgretReflectUtils.getNestProxyParam(proxy);

        LogUtil.d(TAG, "launcher pay params:" + param.toString());

        EgretSDKManager esm = EgretSDKManager.getInstance();
        esm.pay(param, new OnPayProcessListener() {

            @Override
            public void finishPayProcess(JSONObject json) {
                /**
                 * json格式说明 json.put("result","0");
                 *  0:支付完成
                 * -1:支付取消
                 * -2:支付失败
                 * json.put("errorMessage",errorMessage);
                 * errorMessage:提示信息
                 */
                //必须.将客户端的支付结果通知Runtime.游戏根据此结果进行轮询.进行后续货币发放操作
                EgretReflectUtils.invokeNestProxyCallback(proxy, json);
            }
        });
    }
}