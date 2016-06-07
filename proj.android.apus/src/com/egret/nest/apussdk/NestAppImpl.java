package com.egret.nest.apussdk;

import org.egret.runtime.nest.NestProxy;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;

/**
 * 功能描述:应用内附加功能系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点1:isSupport(final Object proxy)
 * 修改点2:attention(final Object proxy)
 * 修改点3:sendToDesktop(final Object proxy)
 * 修改点4:exitGame(final Object proxy)
 * @author imathliu
 *
 */
public class NestAppImpl {
		
	public NestAppImpl(){
		initNotifiers();
	}
    /**
     * 功能描述:应用内附加功能开关
     * 是否修改:渠道使用自有的SDK实现应用内附加功能.需要修改此类
     * 修改内容1:obj.put("attention", "1");
     * 修改内容2:obj.put("sendToDesktop", "1");
     * @param proxy
     */
    public void isSupport(final NestProxy proxy) {

        JSONObject obj = new JSONObject();
        try {
            obj.put("status", "0");
            /**
             * attention 参数定义
             * 0:不支持 默认
             * 1:支持关注
             */
            obj.put("attention", "0");
            /**
             * sendToDesktop 参数定义
             * 0:不支持 默认
             * 1:支持创建桌面快捷图标
             */
            obj.put("sendToDesktop", "0");
            //必须.将客户端的是否支持附加功能通知Runtime.游戏根据此结果决定是否开放附加功能
            proxy.invokeCallback(obj);
//            EgretReflectUtils.invokeNestProxyCallback(proxy, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 功能描述:关注
     * 是否修改:渠道使用自有的SDK实现关注.需要修改此类
     * 修改内容:重写attention的实现
     * @param proxy
     */
    public void attention(final NestProxy proxy) {
    	
    }
    
    /**
     * 功能描述:创建桌面快捷图标
     * 是否修改:渠道使用自有的SDK实现创建桌面快捷图标.需要修改此类
     * 修改内容:重写sendToDesktop的实现
     * @param proxy
     */
    public void sendToDesktop(final NestProxy proxy) {
    	
    }
    
    /**
     * 功能描述:退出游戏.返回到App界面
     * 是否修改:渠道使用自有的SDK实现退出游戏.需要修改此类
     * 修改内容:重写exitGame的实现
     * @param proxy
     */
    public void exitGame(final NestProxy proxy) {
    	
    }
    
    public void initNotifiers(){
    	
    }
}
