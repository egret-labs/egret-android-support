package com.egret.nest.quicksdk;

//import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
import org.egret.runtime.nest.NestProxy;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * 功能描述:社交系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点1:isSupport(final Object proxy)
 * 修改点2:getFriends(final Object proxy)
 * 修改点3:openBBS(final Object proxy)
 * @author imathliu
 *
 */
public class NestSocialImpl {
    
	/**
	 * 功能描述:用户社交功能开关
	 * 是否修改:渠道使用自有的SDK实现用户社交.需要修改此类
	 * 修改内容1:obj.put("getFriends", "1");
	 * 修改内容2:obj.put("openBBS", "1");
	 * @param proxy
	 */
    public void isSupport(final NestProxy proxy) {

        JSONObject obj = new JSONObject();
        try {
            obj.put("status", "0");
            /**
             * getFriends 参数定义
             * 0:不支持 默认值
             * 1:支持获取好友列表
             */
            obj.put("getFriends", "0");
            /**
             * openBBS 参数定义
             * 0:不支持 默认值
             * 1:支持打开BBS
             */
            obj.put("openBBS", "0");
            //必须.将客户端的是否支持社交通知Runtime.游戏根据此结果决定是否开放社交功能
            proxy.invokeCallback(obj);
//            EgretReflectUtils.invokeNestProxyCallback(proxy, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 功能描述:获取用户好友列表
     * 是否修改:渠道使用自有的SDK实现获取用户好友列表.需要修改此类
     * 修改内容:重写getFriends的实现
     * @param proxy
     */
    public void getFriends(final Object proxy) {
    	
    }
    
    /**
     * 功能描述:打开BBS
     * 是否修改:渠道使用自有的SDK实现打开BBS.需要修改此类
     * 修改内容:重写openBBS的实现
     * @param proxy
     */
    public void openBBS(final Object proxy) {
    	
    }
}
