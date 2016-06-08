package com.egret.androidsupport;

import java.io.File;
import java.util.HashMap;

import org.egret.egretframeworknative.EgretRuntime;
import org.egret.egretframeworknative.engine.EgretGameEngine;

import com.egret.androidsupport.Util.StartupMode;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

public class GameActivity extends Activity {

    protected static final String TAG = GameActivity.class.toString();
    private EgretGameEngine mGameEngine = null;
    private String loaderUrl;
    private String updateUrl;
    
    

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        mGameEngine = createGameEngine();
        onCreateEgretGameEngine(mGameEngine);
      
    }
    
    protected void onCreateEgretGameEngine(EgretGameEngine gameEngine) {

    }
	
  	/**
     * 创建游戏引擎
     */
    private EgretGameEngine createGameEngine() {
    	setStartupMode(Util.StartupMode.DEBUG_LOCAL);
    	mGameEngine = new EgretGameEngine();
        HashMap<String, Object> options = getGameOptions();
        mGameEngine.game_engine_set_options(options);
        mGameEngine.game_engine_init(this);
        mGameEngine.game_engine_set_loading_view(new GameLoadingView(this));
        View gameEngineView = mGameEngine.game_engine_get_view();
        setContentView(gameEngineView);
        addEventListener();
        return mGameEngine;
    }
    
    private void addEventListener() {
        // Egret（TypeScript）－Runtime（Java）通讯
        // setRuntimeInterface(String name, IRuntimeInterface interface) 用于设置一个runtime的目标接口
        // callEgretInterface(String name, String message) 用于调用Egret的接口，并传递消息
    	mGameEngine.setRuntimeInterface("RuntimeInterface", new Util.RuntimeListener() {
           @Override
            public void callback(String message) {
                Log.d(TAG, message);
                mGameEngine.callEgretInterface("EgretInterface", "A message from runtime");
            }
        });
    }  
    
    protected HashMap<String, Object> getGameOptions() {
        HashMap<String, Object> options = new HashMap<String, Object>();      
        String gameCachePath = new File(getFilesDir(), "egret").getAbsolutePath();
        String gameId = "88888";
        options.put(EgretRuntime.OPTION_EGRET_GAME_ROOT, gameCachePath);
        options.put(EgretRuntime.OPTION_GAME_ID, gameId);
        options.put(EgretRuntime.OPTION_GAME_LOADER_URL, loaderUrl);
        options.put(EgretRuntime.OPTION_GAME_UPDATE_URL, updateUrl);
        return options;
    }

    private void setStartupMode(StartupMode startupMode) {

    	String EGRET_PUBLISH_ZIP = "game_code_0123456789.zip";
        switch (startupMode) {
        case DEBUG_LOCAL:
            // local DEBUG mode
            // 本地DEBUG模式
            loaderUrl = "";
            updateUrl = "";
            break;
        case RELEASE_WEB:
            // http request zip RELEASE mode, use permission INTERNET
            // 请求网络zip包发布模式，需要权限 INTERNET
            loaderUrl = "http://www.example.com/" + EGRET_PUBLISH_ZIP;
            updateUrl = "http://www.example.com/";
            break;
        case RELEASE_LOCAL:
            loaderUrl = EGRET_PUBLISH_ZIP;
            updateUrl = "";
            break;
        }
    }
    
    

    @Override
    protected void onPause() {
        super.onPause();
        mGameEngine.game_engine_onPause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mGameEngine.game_engine_onResume();
    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
        mGameEngine.game_engine_onStop();
    }
    
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
        case KeyEvent.KEYCODE_BACK:
        	mGameEngine.game_engine_onStop();
            finish();
            return true;
        default:
            return super.onKeyDown(keyCode, event);
        }
    }

 
}
