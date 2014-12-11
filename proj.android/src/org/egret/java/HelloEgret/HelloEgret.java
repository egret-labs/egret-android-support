package org.egret.java.HelloEgret;

import org.egret.egretframeworknative.EgretRuntimeActivity;

import android.os.Bundle;

public class HelloEgret extends EgretRuntimeActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
	}

	/**
	 * Override your egret game loader url (重写该方法，来指定游戏打包启动的方式)
	 * - return "game_code.zip" (推荐本地包方式)
	 * - return "http://www.example.com/game_code.zip" （服务器方式）
	 * - return "" （调试方式）
	 */
	@Override
	public String getLoaderUrl() {
		return "";
	}

}


