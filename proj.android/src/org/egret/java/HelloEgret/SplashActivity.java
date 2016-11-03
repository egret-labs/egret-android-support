package org.egret.java.HelloEgret;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

/**
 * Splash Activity。
 * 
 * 当前Activity使用了一个特定的Theme。这个Theme有背景色和一张背景图。
 * 
 * 背景色修改： 1.在res/values/colors.xml中添加对应颜色。
 * 2.在res/drawable/splash_layer_list.xml中修改： <item
 * android:drawable="@color/{颜色名}"></item>
 * 
 * 图片修改： 1. 替换 res/drawable , res/drawable_xxx 文件夹下所有splash_img.png图片。
 * 2.如果使用其它名称的图片，请在res/drawable/splash_layer_list.xml中修改：
 * android:src="@drawable/{图片名}"
 * 
 * @author jkd2972
 * 
 */

public class SplashActivity extends Activity {

	private Handler mMainHandler = new Handler() {
		@Override
		public void handleMessage(Message msg) {
			Intent intent = new Intent(Intent.ACTION_MAIN);
			intent.setClass(getApplication(), HelloEgret.class);
			intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
			startActivity(intent);
		}
	};

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		//1秒后切换到游戏Activity。
		mMainHandler.sendEmptyMessageDelayed(0, 1000);
	}
	
	// much easier to handle key events  
    @Override  
    public void onBackPressed() {  
    } 
	
}
