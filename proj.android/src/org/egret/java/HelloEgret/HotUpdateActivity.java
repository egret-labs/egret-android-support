package org.egret.java.HelloEgret;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.app.Activity;
import android.util.Log;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.egret.egretframeworknative.EgretRuntime;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import android.os.AsyncTask;
import android.widget.ProgressBar;

public class HotUpdateActivity extends Activity {

    private static final String EGRET_ROOT = "egret";
    //用来测试热更新的地址，可替换为正式的地址
    private static  String TEST_JSON_URL = "http://10.0.4.139/app1/info.json";
    //若bUsingPlugin为true，开启插件
    private boolean bUsingPlugin = false;

    private String egretRoot;
    private String gameId;
    //用来显示更新进度的进度条
    private ProgressBar progressBar = null;

    private GameOptionDescriptor gameOptionDescriptor = new GameOptionDescriptor();
    //热更新的逻辑封装在HotUpdateHelper中，继承AsyncTask类，提供异步后台运行的能力。
    public class HotUpdateTask extends AsyncTask<Integer, Integer, String> {
        private String jsonUrl = "";
        private String saveRootPath = "";
        private String gameRootPath = "";

        public HotUpdateTask(String jsonUrl, String gameId) {
            this.jsonUrl = jsonUrl;
            String filePath = getApplicationContext().getFilesDir().getAbsolutePath();
            saveRootPath = filePath;
            gameRootPath = filePath + "/egret/" + gameId + "/game";
        }
        //后台运行的逻辑写在doInBackground方法中
        @Override
        protected String doInBackground(Integer... params) {
            //先从服务器获取json内容
            String jsonInfo = getGameJson();

            String _codeUrl = "";
            String _updateUrl = "";
            //使用SharedPreferences读取和存储code_url和 update_url
            SharedPreferences sharedPreferences = getSharedPreferences(getString(R.string.game_option), 0);
            SharedPreferences.Editor editor = sharedPreferences.edit();
            boolean needUpdateCode = false;
            try {
                //获得 codeUrl 和 updateUrl这两个字段的信息
                JSONObject jsonObject = new JSONObject(jsonInfo);
                _codeUrl = jsonObject.getString("code_url");
                _updateUrl = jsonObject.getString("update_url");
                //如果之前保存的codeUrl不等于这次从服务器获取的，且这次获取的不为空字符串，那么就需要更新
                String oldCodeUrl = sharedPreferences.getString("code_url","");
                if(!oldCodeUrl.equals(_codeUrl) && !_codeUrl.equals("")){
                    needUpdateCode = true;
                }
            } catch (Exception e) {
                Log.i("", "Exception " + e.toString());
            }
            if(needUpdateCode){
                //下载更新内容并解压缩
                String saveFilePath = getGameZip(_codeUrl);
                unzip(saveFilePath, gameRootPath);
                //如果更新成功就更新本地存储的这两个字段的信息
                if(!saveFilePath.equals("")){
                    //
                    editor.putString("code_url",_codeUrl);
                    editor.putString("update_url",_updateUrl);
                    editor.commit();
                }
            }

            //游戏设置相关的变量已经全部赋值完，接下来执行buildGameOption来构造GameOptionDescriptor实例
            buildGameOption();
            return "";
        }
        //当AsyncTask后台执行完毕，会调用主线程的onPostExecute方法，在这里执行切换Activity的逻辑，切换至游戏界面
        @Override
        protected void onPostExecute(String result) {
            checkoutActivity();
        }
        //AsyncTask提供的更新进度的API，更新进度需要在这里同步至UI线程
        @Override
        protected void onProgressUpdate(Integer... values) {
            super.onProgressUpdate(values);
            if(progressBar != null){
                progressBar.setProgress(values[0]);
            }
        }
        //从url获取json，json提供了code_url和update_url两个字段
        public String getGameJson() {
            String jsonInfo = "";

            try {
                HttpClient getClient = new DefaultHttpClient();
                HttpGet request = new HttpGet(jsonUrl);
                HttpResponse response = getClient.execute(request);
                if(response.getStatusLine().getStatusCode()== HttpStatus.SC_OK){
                    Log.i("", "请求服务器端成功");
                    InputStream inputStream = response.getEntity().getContent();
                    int result = inputStream.read();
                    while (result != -1){
                        jsonInfo += (char)result;
                        result = inputStream.read();
                    }
                    inputStream.close();
                } else {
                    Log.i("", "请求服务器端失败");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                Log.i("", "Exception");
            }

            Log.d("", "[" + jsonInfo + "]");
            return jsonInfo;
        }
        //下载codeUrl下的zip文件
        public String getGameZip(String loaderUrl) {
            HttpURLConnection conn = null;
            FileOutputStream out;
            String saveFilePath = "";
            try {
                URL url = new URL(loaderUrl);
                conn = (HttpURLConnection)url.openConnection();
                conn.setConnectTimeout(30 * 1000);
                conn.setReadTimeout(30 * 1000);

                conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");

                int length = conn.getContentLength();
                int progress = 0;

                InputStream inputStream = conn.getInputStream();
                byte[] buffer = new byte[8 * 1024];
                int read;

                saveFilePath = saveRootPath + "/temp.zip";
                File saveFile = new File(saveFilePath);
                out = new FileOutputStream(saveFile);

                while ((read = inputStream.read(buffer)) > 0) {
                    progress += read;
                    out.write(buffer, 0, read);
                    float percentF = (float)(progress)/(float)(length);
                    int percent = (int)(percentF*50);
                    publishProgress(percent);
                }

                out.close();

            } catch (Exception e) {
                Log.e("", e.toString());
            } finally {
                if (conn != null) {
                    conn.disconnect();
                }
            }

            return saveFilePath;
        }
        //解压缩下载的文件
        public void unzip(String filePath, String gamePath) {
            ZipFile zipFile;
            int length = 0;
            int progress = 0;
            try {
                zipFile = new ZipFile(filePath);
                Enumeration<? extends ZipEntry> enumeration = zipFile.entries();
                while (enumeration.hasMoreElements()) {
                    length += (enumeration.nextElement()).getSize();
                }
                enumeration = zipFile.entries();
                while (enumeration.hasMoreElements()) {
                    ZipEntry zipEntry = enumeration.nextElement();
                    progress += unzipEntry(zipFile, zipEntry, gamePath);
                    float percentF = (float)(progress)/(float)(length);
                    int percent = 50 + (int)(percentF*50);
                    publishProgress(percent);
                    //本地测试时下载和解压过快，sleep方便观察与测试
                    //Thread.sleep(200);
                }
            } catch (Exception e) {
                Log.e("", e.toString());
            }
        }
        //解压缩文件，如果返回0则代表是目录而不是文件
        private int unzipEntry(ZipFile zipFile, ZipEntry zipEntry, String gamePath) {
            InputStream inputStream;
            FileOutputStream out;
            int result = 0;
            try {
                File target = new File(gamePath, androidPath(zipEntry.getName()));
                if (zipEntry.isDirectory()) {
                    makeRoot(target);
                    return 0;
                }
                makeRoot(target.getParentFile());

                inputStream = zipFile.getInputStream(zipEntry);
                out = new FileOutputStream(target);
                byte data[] = new byte[4 * 1024];
                int read;
                while ((read = inputStream.read(data, 0, 4 * 1024)) != -1) {
                    out.write(data, 0, read);
                    result += read;
                }

                inputStream.close();
                out.close();
            } catch (Exception e) {
                Log.e("", e.toString());
            }

            return result;
        }

        private String androidPath(String name) {
            return name.replace('\\', '/');
        }

        private void makeRoot(File root) throws Exception {
            if (!root.exists() && !root.mkdirs()) {
                throw new Exception("");
            }
        }
    }
    //构造GameOptionDescriptor实例，存储游戏配置相关的信息，用以传递到GameViewActivity来初始化游戏
    private void buildGameOption(){
        SharedPreferences sharedPreferences = getSharedPreferences(getString(R.string.game_option), 0);
        HashMap<String, Object> options = new HashMap<String, Object>();
        options.put(EgretRuntime.OPTION_EGRET_GAME_ROOT, egretRoot);
        options.put(EgretRuntime.OPTION_GAME_ID, gameId);
        options.put(EgretRuntime.OPTION_GAME_LOADER_URL, "");
        options.put(EgretRuntime.OPTION_GAME_UPDATE_URL, sharedPreferences.getString("update_url",""));
        if(bUsingPlugin){
            String pluginConf = "{'plugins':[{'name':'androidca','class':'org.egret.egretframeworknative.CameraAudio','types':'jar,so'}]}";
            options.put(EgretRuntime.OPTION_GAME_GLVIEW_TRANSPARENT, "true");
            options.put(EgretRuntime.OPTION_EGRET_PLUGIN_CONF, pluginConf);
        }
        gameOptionDescriptor.setOptions(options);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_loading);
        //获取progressBar的实例
        this.progressBar = (ProgressBar)findViewById(R.id.progressBar);
        //设置egret根目录和gameId
        egretRoot = new File(getFilesDir(), EGRET_ROOT).getAbsolutePath();
        gameId = "local";
        //构造HotUpdateTask类的实例
        HotUpdateTask hotUpdateTask = new HotUpdateTask(TEST_JSON_URL, gameId);
        //开始执行HotUpdateTask
        hotUpdateTask.execute();
    }
    //切换到GameViewActivity并传递gameOptionDescriptor
    public void checkoutActivity(){
        // 修改GameViewActivity为你的Activity名称
        Intent intent = new Intent(this, GameViewActivity.class);
        Bundle bundle = new Bundle();
        bundle.putSerializable("gameOption", gameOptionDescriptor);
        intent.putExtras(bundle);
        startActivityForResult(intent,1);
    }
}
