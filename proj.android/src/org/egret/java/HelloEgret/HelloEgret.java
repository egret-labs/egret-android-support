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
		// 1. DEBUG only
		loaderUrl = "";
		// 2. local zip
		// loaderUrl = "launcher.zip";
		// 3. http request zip
		// loaderUrl = "http://10.0.2.33/launcher.zip";
		gameEngine = new EgretGameEngine();
		gameEngine.game_engine_init(this, egretRoot, gameId, loaderUrl);
		View gameEngineView = gameEngine.game_engine_get_view();
		setContentView(gameEngineView);
	}
	
}
