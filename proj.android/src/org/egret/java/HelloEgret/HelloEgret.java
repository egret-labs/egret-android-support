package org.egret.java.HelloEgret;

import java.io.File;
import java.util.HashMap;

import org.egret.egretframeworknative.EgretRuntime;
import org.egret.egretframeworknative.engine.EgretGameEngine;
import org.egret.java.Launcher.GameLauncher;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Window;
import android.view.WindowManager;

public class HelloEgret extends Activity {

    private static final String EGRET_ROOT = "egret";
    //TODO: egret publish之后，修改以下常量为生成的game_code名
    private static final String EGRET_PUBLISH_ZIP = "game_code_0123456789.zip";
    protected static final String TAG = "HelloEgret";
    
   	//若bUsingPlugin为true，开启插件
    private boolean bUsingPlugin = false;

    private String egretRoot;
    private String gameId;
    private String loaderUrl;
    private String updateUrl;
    private GameLauncher gameLauncher;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
        egretRoot = new File(getFilesDir(), EGRET_ROOT).getAbsolutePath();
        gameId = "local";
        //TODO: DEBUG 使用 2
        setLoaderUrl(2);
        // 设置游戏的选项  (set game options)
        HashMap<String, Object> options = getGameOptions();

        gameLauncher = new GameLauncher(this, options);
        gameLauncher.run();

    }
    

    private HashMap<String, Object> getGameOptions() {
        HashMap<String, Object> options = new HashMap<String, Object>();
        options.put(EgretRuntime.OPTION_EGRET_GAME_ROOT, egretRoot);
        options.put(EgretRuntime.OPTION_GAME_ID, gameId);
        options.put(EgretRuntime.OPTION_GAME_LOADER_URL, loaderUrl);
        options.put(EgretRuntime.OPTION_GAME_UPDATE_URL, updateUrl);
        if(bUsingPlugin){
        	String pluginConf ="{'plugins':[{'name':'liveplugin'," +
                    "'packagelist':['EgretLivePlugin.zip','test.zip']," +
                    "'class':'org.egret.egretframeworknative.PublishAndPlay','types':'jar,so'}]}";
					options.put(EgretRuntime.OPTION_GAME_GLVIEW_TRANSPARENT, "true");
	        options.put(EgretRuntime.OPTION_EGRET_PLUGIN_CONF, pluginConf);
        }
        return options;
    }

    private void setLoaderUrl(int mode) {
        switch (mode) {
        case 2:
            // local DEBUG mode
            // 本地DEBUG模式，发布请使用0本地zip，或者1网络获取zip
            loaderUrl = "";
            updateUrl = "";
            break;
        case 1:
            // http request zip RELEASE mode, use permission INTERNET
            // 请求网络zip包发布模式，需要权限 INTERNET
            loaderUrl = "http://www.example.com/" + EGRET_PUBLISH_ZIP;
            updateUrl = "http://www.example.com/";
            break;
        default:
            // local zip RELEASE mode, default mode, `egret publish -compile --runtime native`
            // 私有空间zip包发布模式, 默认模式, `egret publish -compile --runtime native`
            loaderUrl = EGRET_PUBLISH_ZIP;
            updateUrl = "";
            break;
        }
    }

    @Override
    public void onPause() {
        super.onPause();
        gameLauncher.getEgretGameEngine().game_engine_onPause();
    }

    @Override
    public void onResume() {
        super.onResume();
        gameLauncher.getEgretGameEngine().game_engine_onResume();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
        case KeyEvent.KEYCODE_BACK:
            gameLauncher.getEgretGameEngine().game_engine_onStop();
            finish();
            return true;
        default:
            return super.onKeyDown(keyCode, event);
        }
    }
}
