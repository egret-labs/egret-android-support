package org.egret.java.HelloEgret;

import java.io.File;

import org.egret.egretframeworknative.engine.EgretGameEngine;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

public class HelloEgret extends Activity {

	private EgretGameEngine gameEngine;
	private String egretRoot;
	private String gameId;
	private String loaderUrl;


	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		egretRoot = new File(getFilesDir(), "egret").getAbsolutePath();
		gameId = "local";
		setLoaderUrl(0);
		gameEngine = new EgretGameEngine();
		gameEngine.game_engine_init(this, egretRoot, gameId, loaderUrl);
		View gameEngineView = gameEngine.game_engine_get_view();
		setContentView(gameEngineView);
	}
	
	
	private void setLoaderUrl(int mode) {
		switch (mode) {
		case 2:
			// sd card zip DEBUG mode, use permission WRITE_EXTERNAL_STORAGE
			// 本地sd包调试模式，需要权限 WRITE_EXTERNAL_STORAGE
			loaderUrl = "/sdcard/game_code.zip";
			break;
		case 1:
			// http request zip RELEASE mode, use permission INTERNET
			// 请求网络zip包发布模式，需要权限 INTERNET
			loaderUrl = "http://www.example.com/game_code.zip";
			break;
		default:
			// local zip RELEASE mode, default mode, `egret publish -compile --runtime native`
			// 私有空间zip包发布模式, 默认模式, `egret publish -compile --runtime native`，并修改为game_code_xxxx.zip，可见于assets/egret-game
			loaderUrl = "game_code.zip";
			break;
		}
	}
	
}
