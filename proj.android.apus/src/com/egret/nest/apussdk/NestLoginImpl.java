package com.egret.nest.apussdk;

import org.egret.egretframeworknative.engine.EgretGameEngine;
import org.egret.runtime.nest.NestProxy;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

import com.apusplay.sdk.ApusPlaySdk;
import com.apusplay.sdk.UserProfile;
import com.apusplay.sdk.auth.AuthCallBack;
/**
 * 功能描述:用户系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点1:checkLogin(final NestProxy proxy)
 * 修改点2:login(final NestProxy proxy)
 * 修改点3:logout(final NestProxy proxy)
 * @author imathliu
 *
 */
public class NestLoginImpl{

    private static final String TAG = "NestLoginImpl";

    private Activity mActivity;
    private NestProxy mProxy = null;
    private AuthCallBack mAuthCallback = null;
    
    private  String gameId = null;
    private String spId = null;
    private String appKey = null;
    public NestLoginImpl(Activity activity, EgretGameEngine gameEngine) {

        this.mActivity = activity;
        gameId = (String)gameEngine.game_engine_get_option("egret.runtime.gameId");
        spId = (String)gameEngine.game_engine_get_option("egret.runtime.spid");
        appKey = (String)gameEngine.game_engine_get_option("egret.runtime.appkey");
        Log.d(TAG,"init gameId:"+gameId+" spId:"+spId+" appKey:"+appKey);
//        String gameId = (String) EgretReflectUtils.getOption(gameEngine,
//                "egret.runtime.gameId");
//        String spId = (String) EgretReflectUtils.getOption(gameEngine,
//                "egret.runtime.spid");
//        EgretSDKManager esm = EgretSDKManager.getInstance();
//        esm.init(mActivity, gameId, spId);
        initCallback();
    }
    
    /**
     * 功能描述:支持的登录类型
     * 是否修改:否
     * @param proxy
     */
    public void isSupport(final NestProxy proxy) {

        JSONObject obj = new JSONObject();
        JSONArray arr = new JSONArray();
        
        try {
            obj.put("status", "0");
            obj.put("loginType", arr);
            //必须.将客户端支持的登录类型结果通知Runtime.游戏根据此结果定制登录界面.供用户选择
            proxy.invokeCallback(obj);
//            EgretReflectUtils.invokeNestProxyCallback(proxy, obj);
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
    public void checkLogin(final NestProxy proxy) {

        Log.d(TAG, "launcher checkLogin");
        
        //TODO 实现checkLogin功能 
        /**
         * 渠道使用自有的SDK实现自动登录.请重写checkLogin实现 
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将登录信息回传Runtime
         */
        JSONObject json = new JSONObject();
        try {
			json.put("result", -2);
	        proxy.invokeCallback(json);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    /**
     * 功能描述:手动登录
     * 是否修改:渠道使用自有的SDK实现手动登录.需要修改此类
     * 修改内容:重写login的实现
     * @param proxy
     */
    public void login(final NestProxy proxy) {
    		mProxy = proxy;
        Log.d(TAG, "login");
        mActivity.runOnUiThread(new Runnable(){
			public void run(){
				Log.i(TAG,"call login success");
				ApusPlaySdk.getInstance().login(mActivity, "{}", mAuthCallback); 
			}
		});
//        pay();
        //TODO 实现login功能 
        /**
         * 渠道使用自有的SDK实现自动登录.请重写login实现
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将结果回传Runtime
         */
        
        //获取游戏在Egret开放平台配置的应用参数
//        JSONObject appInfo = proxy.getAppInfo();
//        JSONObject appInfo = EgretReflectUtils.getAppInfo(proxy);
        
//        Log.d(TAG, "launcher appInfo:" + appInfo.toString());
//        EgretSDKManager esm = EgretSDKManager.getInstance();
//        esm.login(null, new OnLoginProcessListener() {

//            @Override
//            public void finishLoginProcess(JSONObject json) {
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
//            	((IProxy)proxy).invokeCallback(json);
//                EgretReflectUtils.invokeNestProxyCallback(proxy, json);
//            }
//        });
    }
    
    /**
     * 功能描述:用户登出
     * 是否修改:渠道使用自有的SDK实现用户登出.需要修改此类
     * 修改内容:重写logout的实现
     * @param proxy
     */
    public void logout(final NestProxy proxy) {
    	 Log.d(TAG, "logout");
    	 mActivity.runOnUiThread(new Runnable(){
 			public void run(){
 				Log.i(TAG,"call login success");
 				ApusPlaySdk.getInstance().logout(mActivity, mAuthCallback);
 			}
 		});
    }
    
    private void initCallback(){
	    	mAuthCallback = new AuthCallBack(){
				@Override
				public void onAbort() {
					// TODO Auto-generated method stub
					Log.d(TAG,"AuthCallBack onAbort");
				}
				@Override
				public void onFailure(Throwable arg0, int arg1, String arg2) {
					// TODO Auto-generated method stub
					Log.d(TAG,"AuthCallBack onFailure errorcode:"+arg1+" msg:"+arg2);
				}
				@Override
				public void onSuccess(UserProfile userInfo) {
					Log.d(TAG,"AuthCallBack onSuccess name:"+userInfo.getName());

					JSONObject param = new JSONObject();
					Log.d(TAG,"raw login param:"+param.toString());
					try {
						//egret数据
						param.put("result", "0"); //完成登录
						param.put("spLogin","1"); //渠道登录标识。默认1
						param.put("userId",userInfo.getId()); //玩家在渠道上的用户id(必须)
						param.put("appKey",appKey); //应用秘钥,RuntimeConfiguration.java中 
						param.put("userImg", userInfo.getAvatar());
						param.put("userName", userInfo.getNickName());
						param.put("userSex", userInfo.getGender());
						param.put("accessToken", userInfo.getToken()); 
						//QuickSDK数据
	//					param.put("userName", userInfo.getUserName());
	//					param.put("uid",userInfo.getUID());
	//					param.put("token", userInfo.getToken());
	//					param.put("channelToken", userInfo.getChannelToken());
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Log.d(TAG,"onLoginSuccess:"+param.toString());
					mProxy.invokeCallback(param);
				}
				@Override
				public void onLogout() {
					// TODO Auto-generated method stub
					
				}
	    		
	    	};
    }
}