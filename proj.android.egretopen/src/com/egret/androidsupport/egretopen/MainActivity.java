package com.egret.androidsupport.egretopen;

import java.util.HashMap;
import java.util.Map;

import org.egret.egretframeworknative.engine.EgretGameEngine;
import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
import org.egret.runtime.nest.NestDelegate;

import android.util.Log;

import com.egret.androidsupport.GameActivity;
import com.egret.nest.egretopen.NestAppImpl;
import com.egret.nest.egretopen.NestLoginImpl;
import com.egret.nest.egretopen.NestPayImpl;
import com.egret.nest.egretopen.NestShareImpl;
import com.egret.nest.egretopen.NestSocialImpl;

public class MainActivity extends GameActivity {
    protected static final String TAG = MainActivity.class.toString();
	Map properties;
	EgretGameEngine mGameEngine;
	@Override
	protected void onCreateEgretGameEngine(EgretGameEngine gameEngine) {
		// TODO Auto-generated method stub
		super.onCreateEgretGameEngine(gameEngine);
		if(null == gameEngine){
			Log.e(TAG,"createEgretOpenSDK mGameEngine is lost");
			return;
		}
		mGameEngine = gameEngine;
        createEgretOpenSDK(gameEngine);    
	}
	/**
	 * 开放平台后台配置参数
	 * spid
	 * appkey
	 */
	@Override
	public HashMap<String, Object> getGameOptions() {
		HashMap<String,Object> options = super.getGameOptions();
        options.put("egret.runtime.nest", "4");
        options.put("egret.runtime.spid", "9166");
        options.put("egret.runtime.appkey", "Z2LnKzxk22jNw7UNknpDU");
		return options;
	}
	
	public void createEgretOpenSDK(EgretGameEngine gameEngine){
		EgretReflectUtils.registerPlugin(gameEngine, "user", new NestLoginImpl(
                this, gameEngine));
        EgretReflectUtils.registerPlugin(gameEngine, "iap", new NestPayImpl());
        EgretReflectUtils.registerPlugin(gameEngine, "app", new NestAppImpl());
        EgretReflectUtils.registerPlugin(gameEngine, "share",
                new NestShareImpl());
        EgretReflectUtils.registerPlugin(gameEngine, "social",
                new NestSocialImpl());
	}
}