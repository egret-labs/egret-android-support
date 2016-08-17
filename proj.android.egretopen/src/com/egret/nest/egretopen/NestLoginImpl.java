package com.egret.nest.egretopen;

import org.egret.egretruntimelauncher.nest.manager.EgretSDKManager;
import org.egret.egretruntimelauncher.nest.manager.OnLoginProcessListener;
import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
import org.egret.egretruntimelauncher.utils.LogUtil;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;

/**
 * 功能描述:用户系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点1:checkLogin(final Object proxy)
 * 修改点2:login(final Object proxy)
 * 修改点3:logout(final Object proxy)
 * @author imathliu
 *
 */
public class NestLoginImpl {

    private static final String TAG = "NestLoginImpl";

    private Activity mActivity;

    private Object gameEngine;

    public NestLoginImpl(Activity activity, Object gameEngine) {

        this.mActivity = activity;

        this.gameEngine = gameEngine;

        String gameId = (String) EgretReflectUtils.getOption(gameEngine,
                "egret.runtime.gameId");
        String spId = (String) EgretReflectUtils.getOption(gameEngine,
                "egret.runtime.spid");

        EgretSDKManager esm = EgretSDKManager.getInstance();
        esm.init(mActivity, gameId, spId);

    }
    
    /**
     * 功能描述:支持的登录类型
     * 是否修改:否
     * @param proxy
     */
    public void isSupport(final Object proxy) {

        JSONObject obj = new JSONObject();
        JSONArray arr = new JSONArray();
        
        try {
            obj.put("status", "0");
            obj.put("loginType", arr);
            //必须.将客户端支持的登录类型结果通知Runtime.游戏根据此结果定制登录界面.供用户选择
            EgretReflectUtils.invokeNestProxyCallback(proxy, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 功能描述:自动登录
     * 是否修改:渠道使用自有的SDK实现自动登录.需要修改此类
     * 修改内容:重写checkLogin的实现
     * @param proxy
     */
    public void checkLogin(final Object proxy) {

        LogUtil.d(TAG, "launcher checkLogin");
        
        //TODO 实现checkLogin功能 
        /**
         * 渠道使用自有的SDK实现自动登录.请重写checkLogin实现 
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将登录信息回传Runtime
         */
        EgretSDKManager esm = EgretSDKManager.getInstance();

        esm.checkLogin(null, new OnLoginProcessListener() {

            @Override
            public void finishLoginProcess(JSONObject json) {
                /**
                 * json格式说明 
                 * json.put("result","0"); //完成登录
                 * json.put("spLogin","1"); //渠道登录标识。默认1
                 * json.put("userId",userId); //玩家在渠道上的用户id(必须)
                 * json.put("userName", userName); //玩家在渠道上的用户昵称(非必须),没有传""空字符串
                 * json.put("userImg",userImg); //玩家在渠道上的头像(非必须),没有传""空字符串
                 * json.put("userSex",userSex); //玩家的性别(非必须),没有传""空字符串
                 * json.put("appKey",appKey); //应用秘钥,RuntimeConfiguration.java中 
                 */
            	//必须.将客户端的登录结果通知Runtime.游戏根据此结果进行登录.进入游戏
                EgretReflectUtils.invokeNestProxyCallback(proxy, json);
            }
        });

    }
    
    /**
     * 功能描述:手动登录
     * 是否修改:渠道使用自有的SDK实现手动登录.需要修改此类
     * 修改内容:重写login的实现
     * @param proxy
     */
    public void login(final Object proxy) {

        LogUtil.d(TAG, "launcher login");
        
        //TODO 实现login功能 
        /**
         * 渠道使用自有的SDK实现自动登录.请重写login实现
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将结果回传Runtime
         */
        
        //获取游戏在Egret开放平台配置的应用参数
        JSONObject appInfo = EgretReflectUtils.getAppInfo(proxy);
        LogUtil.d(TAG, "launcher appInfo:" + appInfo);

        EgretSDKManager esm = EgretSDKManager.getInstance();
        esm.login(null, new OnLoginProcessListener() {

            @Override
            public void finishLoginProcess(JSONObject json) {
                /**
                 * json格式说明 
                 * json.put("result","0"); //完成登录
                 * json.put("spLogin","1"); //渠道登录标识。默认1
                 * json.put("userId",userId); //玩家在渠道上的用户id(必须)
                 * json.put("userName", userName); //玩家在渠道上的用户昵称(非必须),没有传""空字符串
                 * json.put("userImg",userImg); //玩家在渠道上的头像(非必须),没有传""空字符串
                 * json.put("userSex",userSex); //玩家的性别(非必须),没有传""空字符串
                 * json.put("appKey",appKey); //应用秘钥,RuntimeConfiguration.java中 
                 */
            	//必须.将客户端的登录结果通知Runtime.游戏根据此结果进行登录.进入游戏
                EgretReflectUtils.invokeNestProxyCallback(proxy, json);
            }
        });
    }
    
    /**
     * 功能描述:用户登出
     * 是否修改:渠道使用自有的SDK实现用户登出.需要修改此类
     * 修改内容:重写logout的实现
     * @param proxy
     */
    public void logout(final Object proxy) {
    	
    }
}