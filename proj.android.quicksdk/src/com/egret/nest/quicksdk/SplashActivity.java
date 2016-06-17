package com.egret.nest.quicksdk;

import android.content.Intent;
import android.graphics.Color;

import com.egret.androidsupport.quicksdk.MainActivity;
import com.quicksdk.QuickSdkSplashActivity;

public class SplashActivity extends QuickSdkSplashActivity {
	@Override
	public int getBackgroundColor() {
		// TODO Auto-generated method stub
		return Color.WHITE;
	}
	@Override
	public void onSplashStop() {
		// TODO Auto-generated method stub
		//闪屏结束后，跳转到游戏界面
		Intent intent = new Intent(this, MainActivity.class);
		startActivity(intent);
		this.finish();
	}
}
