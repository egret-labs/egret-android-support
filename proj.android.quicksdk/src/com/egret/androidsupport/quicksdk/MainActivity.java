package com.egret.androidsupport.quicksdk;

import java.util.HashMap;

import org.egret.egretframeworknative.engine.EgretGameEngine;

import com.egret.nest.quicksdk.NestAppImpl;
import com.egret.nest.quicksdk.NestLoginImpl;
import com.egret.nest.quicksdk.NestPayImpl;
import com.egret.nest.quicksdk.NestShareImpl;
import com.egret.nest.quicksdk.NestSocialImpl;
import com.quicksdk.QuickSDK;
import com.quicksdk.Sdk;
import com.quicksdk.entity.GameRoleInfo;
import com.quicksdk.notifier.InitNotifier;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import android.view.KeyEvent;

public class MainActivity extends com.egret.androidsupport.GameActivity {
	
	@Override
	protected void onCreateEgretGameEngine(EgretGameEngine gameEngine) {
		// TODO Auto-generated method stub
		super.onCreateEgretGameEngine(gameEngine);
		if(null == gameEngine){
			Log.e(TAG,"createQuickSDK mGameEngine is lost");
			return;
		}
        createQuickSDK(gameEngine);    
	}

	@Override
	protected HashMap<String, Object> getGameOptions() {
		HashMap<String,Object> options = super.getGameOptions();
        options.put("egret.runtime.nest", "4");
        options.put("egret.runtime.spid", "20959");
        options.put("egret.runtime.appkey","c9JhkOZGmD8HpdUgOBxR2");
		return options;
	}
	/**
     * 创建并配置quickSDK
     * @param mGameEngine
     */
  	private void createQuickSDK(EgretGameEngine gameEngine){

		NestLoginImpl mLoginImpl = new NestLoginImpl(this,gameEngine);
		NestPayImpl mPayImpl = new NestPayImpl(this);
		NestAppImpl mAppImpl = new NestAppImpl();
		NestShareImpl mShareImpl = new NestShareImpl(this);
    	
	    	Util.registerPlugin(gameEngine, "user", mLoginImpl);
	    	Util.registerPlugin(gameEngine, "iap", mPayImpl);
	    	Util.registerPlugin(gameEngine, "app", mAppImpl);
	    	Util.registerPlugin(gameEngine, "share", mShareImpl);
	    	Util.registerPlugin(gameEngine, "social", new NestSocialImpl());
    	
		QuickSDK.getInstance()
		.setIsLandScape(Constants.isLandscape)
		.setInitNotifier(new InitNotifier(){
			@Override
			public void onFailed(String message, String trace) {
			}
			@Override
			public void onSuccess() {
			}
		})
		// 3.设置登录通知
		.setLoginNotifier(mLoginImpl.loginNotifier)
		// 4.设置注销通知
		.setLogoutNotifier(mLoginImpl.logoutNotifier)
		// 5.设置支付通知
		.setPayNotifier(mPayImpl)
		// 6.设置退出通知
		.setExitNotifier(mAppImpl.exitNotifier);
	
		com.quicksdk.Sdk.getInstance().init(this, Constants.productCode, Constants.productKey);
		com.quicksdk.Sdk.getInstance().onCreate(this);
	}
  	
  	@Override
	protected void onStart() {
		super.onStart();
		com.quicksdk.Sdk.getInstance().onStart(this);
	}

	@Override
	protected void onRestart() {
		super.onRestart();
		com.quicksdk.Sdk.getInstance().onRestart(this);
	}

	@Override
	protected void onNewIntent(Intent intent) {
		super.onNewIntent(intent);
		com.quicksdk.Sdk.getInstance().onNewIntent(intent);
	}

	@Override
	protected void onStop() {
		super.onStop();
		com.quicksdk.Sdk.getInstance().onStop(this);
	}
	
	@Override
	protected void onDestroy() {
		super.onDestroy();
		com.quicksdk.Sdk.getInstance().onDestroy(this);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		com.quicksdk.Sdk.getInstance().onActivityResult(this, requestCode, resultCode, data);
	}

    @Override
    public void onPause() {
        super.onPause();
        com.quicksdk.Sdk.getInstance().onPause(this);
    }

    @Override
    public void onResume() {
        super.onResume();
        com.quicksdk.Sdk.getInstance().onResume(this);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
        case KeyEvent.KEYCODE_BACK:
        	//调用渠道的退出框
        	if(QuickSDK.getInstance().isShowExitDialog()){
        		Sdk.getInstance().exit(this);
        	}  
        default:
            return super.onKeyDown(keyCode, event);
        }
    }
    
    
}
