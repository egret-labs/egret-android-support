package org.egret.java.Launcher;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import org.egret.egretframeworknative.EgretRuntime;
import org.egret.egretframeworknative.engine.EgretGameEngine;
import org.egret.java.json.*;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;


/**
 * Created by renren on 2016/10/8.
 */

public class GameLauncher {

    private interface IRuntimeInterface {
        public void callback(String message);
        // 因为遗留问题 callBack 也是接受的
    }

    private static final String LOG_TAG = "AndroidSupportLauncher";
    private static final String STR_BLOCK_FLAG	 	= "plugins";
    private static final String STR_ELEMENT_NAME	= "name";
    private static final String STR_ELEMENT_ZIPLIST = "packagelist";
    private static final String STR_PLUGIN_FOLDER   = "EgretPlugin";
    private static final String STR_DESTLIB_PARENTDIR   = "libs/";	//目标库的上级目录

    private Activity _act;
    private HashMap<String, Object> _options;
    private LauncherView _launcherView;
    private EgretGameEngine _gameEngine;

    public GameLauncher(Activity activity, HashMap<String, Object> options){
        _act = activity;
        _options = options;

        _gameEngine = new EgretGameEngine();
        _gameEngine.game_engine_set_options(_options);
        // 设置加载进度条  (set loading progress bar)
        _gameEngine.game_engine_set_loading_view(new LauncherView(_act));
        // 创建Egret<->Runtime的通讯 (create pipe between Egret and Runtime)
        setInterfaces();
        // 初始化并获得渲染视图 (initialize game engine and obtain rendering view)
        _gameEngine.game_engine_init(_act);
    }

    public void run(){
        String strPluginConfig = (String)_options.get(EgretRuntime.OPTION_EGRET_PLUGIN_CONF);
        if(strPluginConfig != null && !strPluginConfig.isEmpty()){
            _launcherView = new LauncherView(_act);
            _act.setContentView(_launcherView);
            placeZipPackages(strPluginConfig);

        }else{
            initGameEngine();
        }
    }

    public EgretGameEngine getEgretGameEngine(){
        return _gameEngine;
    }

    private void placeZipPackages(String strPluginConfig){
       final ArrayList<JSONArray> jsonArrayList = getZipPackageName(strPluginConfig);
        final File destRoot = new File(_act.getFilesDir() + File.separator + STR_DESTLIB_PARENTDIR);
        new AsyncTask<Object, Object, Boolean>() {
            @Override
            protected Boolean doInBackground(Object... params) {
                for(int i = 0; i < jsonArrayList.size(); ++i){
                    unzipPakageList(jsonArrayList.get(i), destRoot);
                }
                return true;
            }

            @Override
            protected void onPostExecute(Boolean inited) {
                if (inited) {
                    initGameEngine();
                }
            }

        }.execute();
    }

    private ArrayList<JSONArray> getZipPackageName(String strPluginConfig){
        JSONObject profileObj = new JSONObject(strPluginConfig);
        if(!profileObj.has(STR_BLOCK_FLAG))
        {
            Log.e(LOG_TAG, "plugin configuration does not have a key:"+STR_BLOCK_FLAG);
            return null;
        }

        JSONArray pluginArray = profileObj.getJSONArray(STR_BLOCK_FLAG);
        ArrayList<JSONArray> jsonArrayList = new ArrayList<JSONArray>();
        for(int i = 0; i < pluginArray.length(); ++i)
        {
            JSONObject pluginInfo = pluginArray.getJSONObject(i);
            if(!pluginInfo.has(STR_ELEMENT_NAME) || !pluginInfo.has(STR_ELEMENT_ZIPLIST))
            {
                Log.e(LOG_TAG, "plugin configuration must have keys: name,packagelist");
                continue;
            }

            try {
                JSONArray zipList = pluginInfo.getJSONArray(STR_ELEMENT_ZIPLIST);
                jsonArrayList.add(zipList);
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                continue;
            }
        }
        return  jsonArrayList;
    }

    /**
     * 将配置表中的zip包解压到app的私有空间中
     * */
    private void unzipPakageList(JSONArray zipPackageList, File unzipRoot){
        for(int i= 0; i < zipPackageList.length(); ++i)
        {
            String zipPackageName = "";
            try {
                zipPackageName = zipPackageList.getString(i);
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                Log.e(LOG_TAG, "get zipPackageName error");
                e.printStackTrace();
                continue;
            }
            File srcPackage = new File(Environment.getExternalStorageDirectory().toString()
                    + File.separator + STR_PLUGIN_FOLDER + File.separator +zipPackageName);

            if(srcPackage.exists()){
                doUnzip(srcPackage.getAbsolutePath(), unzipRoot);
            }
            else {
                Log.e(LOG_TAG, "zipPackage " + srcPackage.getAbsolutePath()+" does not exist!");
//                Toast.makeText(_act, "错误：插件选项指定的zip文件不存在！", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private void doUnzip(final String srcZip, final File destRoot){
        final File srcZipFile = new File(srcZip);

        ZipClass zip = new ZipClass();
        zip.unzip(srcZipFile, destRoot, new ZipClass.OnZipListener() {

            @Override
            public void onSuccess() {
                Log.i(LOG_TAG, "Success to unzip file: " + srcZip);
                if(_launcherView != null){
                    _launcherView.post(new Runnable() {
                        @Override
                        public void run() {
                            _launcherView.setText("Success to unzip file: " + srcZip);
                        }
                    });

                }
            }

            @Override
            public void onProgress(int arg0, int arg1) {
                if(_launcherView != null){
                    final int nProgress = arg0;
                    _launcherView.post(new Runnable() {
                        @Override
                        public void run() {
                            _launcherView.setText("Unzip File: " + srcZip);
                            _launcherView.onProgress(nProgress);
                        }
                    });

                }
            }

            @Override
            public void onFileProgress(int arg0, int arg1) {
            }

            @Override
            public void onError(String arg0) {
            }
        });
    }

    private void initGameEngine(){

        View gameEngineView = _gameEngine.game_engine_get_view();
        _act.setContentView(gameEngineView);
    }

    private void setInterfaces() {
         _gameEngine.setRuntimeInterface("RuntimeInterface", new GameLauncher.IRuntimeInterface() {
            @Override
            public void callback(String message) {
                Log.d(LOG_TAG, message);
                _gameEngine.callEgretInterface("EgretInterface", "A message from runtime");
            }
        });
    }
}
