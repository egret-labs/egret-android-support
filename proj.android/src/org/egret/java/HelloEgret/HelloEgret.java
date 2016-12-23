package org.egret.java.HelloEgret;

import java.io.File;
import java.util.HashMap;

import org.egret.egretframeworknative.EgretRuntime;
import org.egret.egretframeworknative.engine.EgretGameEngine;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

public class HelloEgret extends Activity {
    private interface IRuntimeInterface {
        public void callback(String message);
        // 因为遗留问题 callBack 也是接受的
    }
    
    protected static final String TAG = "HelloEgret";
    
    private EgretGameEngine gameEngine;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
        gameEngine = new EgretGameEngine();
        // 设置游戏的选项  (set game options)
        Bundle bundle = getIntent().getExtras();
        GameOptionDescriptor gameOptionDescriptor = (GameOptionDescriptor) bundle.get("gameOption");
        HashMap<String, Object> options = gameOptionDescriptor.getOptions();
        
        gameEngine.game_engine_set_options(options);
        
        // 创建Egret<->Runtime的通讯 (create pipe between Egret and Runtime)
        setInterfaces();
        // 初始化并获得渲染视图 (initialize game engine and obtain rendering view)
        gameEngine.game_engine_init(this);
        View gameEngineView = gameEngine.game_engine_get_view();

        setContentView(gameEngineView);
    }
    
    private void setInterfaces() {
        // Egret（TypeScript）－Runtime（Java）通讯
        // setRuntimeInterface(String name, IRuntimeInterface interface) 用于设置一个runtime的目标接口
        // callEgretInterface(String name, String message) 用于调用Egret的接口，并传递消息
        gameEngine.setRuntimeInterface("RuntimeInterface", new IRuntimeInterface() {
           @Override
            public void callback(String message) {
                Log.d(TAG, message);
                gameEngine.callEgretInterface("EgretInterface", "A message from runtime");
            }
        });
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
