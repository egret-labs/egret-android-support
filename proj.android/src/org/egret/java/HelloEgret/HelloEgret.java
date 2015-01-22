package org.egret.java.HelloEgret;

import java.io.File;

import org.egret.egretframeworknative.engine.EgretGameEngine;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;

public class HelloEgret extends Activity {

	// egret publish之后，修改以下常量为生成的game_code名
	private static final String EGRET_PUBLISH_ZIP = "game_code_0123456789.zip";
	
	private EgretGameEngine gameEngine;
	private String egretRoot;
	private String gameId;
	private String loaderUrl;


	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		egretRoot = new File(getFilesDir(), "egret").getAbsolutePath();
		gameId = "local";
		
		// DEBUG 使用 2
		setLoaderUrl(2);
		
		gameEngine = new EgretGameEngine();
		gameEngine.game_engine_init(this, egretRoot, gameId, loaderUrl);
		View gameEngineView = gameEngine.game_engine_get_view();
		setContentView(gameEngineView);
	}
	
	
	private void setLoaderUrl(int mode) {
		switch (mode) {
		case 2:
			// local DEBUG mode
			// 本地DEBUG模式，发布请使用0本地zip，或者1网络获取zip
			loaderUrl = "";
			break;
		case 1:
			// http request zip RELEASE mode, use permission INTERNET
			// 请求网络zip包发布模式，需要权限 INTERNET
			loaderUrl = "http://www.example.com/" + EGRET_PUBLISH_ZIP;
			break;

		default:
			// local zip RELEASE mode, default mode, `egret publish -compile --runtime native`
			// 私有空间zip包发布模式, 默认模式, `egret publish -compile --runtime native`
			loaderUrl = EGRET_PUBLISH_ZIP;
			break;
		}
	}

		
	@Override
	public void onPause() {
		super.onPause();
		gameEngine.game_engine_onPause();
	}
	
	@Override
	public void onResume() {
		super.onResume();
		gameEngine.game_engine_onResume();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		switch (keyCode) {
		case KeyEvent.KEYCODE_BACK:
			gameEngine.game_engine_onStop();
			finish();
			return true;
		default:
			return super.onKeyDown(keyCode, event);	
		}
	}
	
}
