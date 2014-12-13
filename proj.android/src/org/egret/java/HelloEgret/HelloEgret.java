package org.egret.java.HelloEgret;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.egret.egretframeworknative.EgretRuntimeActivity;

import android.os.Bundle;
import android.util.Log;

public class HelloEgret extends EgretRuntimeActivity {

    private String loaderUrl;
    
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
		// 1 start
		// 直接从本地源文件启动，用于调试
//		super.onCreate(savedInstanceState);
//		loaderUrl = "";
//		runInUIThread();
		// 1 end

		// 2 start
		// 从本地zip的源文件启动，推荐方式
//		 super.onCreate(savedInstanceState);
//		 loaderUrl = "game_code.zip";
//		 runInUIThread();
		// 2 end

		// 3 start
		// 从服务器的zip启动
//		 super.onCreate(savedInstanceState);
//		 loaderUrl = "http://10.0.2.33/launcher.zip";
//		 runInUIThread();
		// 3 end
        
        // 4-1/2 start
        super.onCreate(savedInstanceState);
        loaderUrl = "http://10.0.2.33/request";
        // requestContent = "http://10.0.2.33/launcher.zip"
        new Thread(new Runnable() {
            public void run() {
                loaderUrl = getRequestContent(loaderUrl);
                if (loaderUrl == null) {
                    return;
                }
                Log.d(TAG, loaderUrl);
                
                runInUIThread();
            }
            
        }).start();
        // 4-1/2 end
    }
    
    
    /**
     * Override your egret game loader url (重写该方法，来指定游戏打包启动的方式)
     */
    @Override
    public String getLoaderUrl() {
        return loaderUrl;
    }
    
    // 4-2/2 start
    private String getRequestContent(String url) {
        URL realUrl = null;
        HttpURLConnection conn = null;
        InputStream in = null;
        ByteArrayOutputStream out = null;
        try {
            realUrl = new URL(loaderUrl);
            conn = (HttpURLConnection) realUrl.openConnection();
            if (conn == null) {
                return null;
            }
            conn.setConnectTimeout(30 * 1000);
            if (conn.getResponseCode() == 0 || conn.getResponseCode() >= 400) {
                return null;
            }
            in = conn.getInputStream();
            out = new ByteArrayOutputStream();
            byte[] buffer = new byte[2048];
            int read;
            while ((read = in.read(buffer)) > 0) {
                out.write(buffer, 0, read);
            }
            return new String(out.toByteArray());
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (conn != null) {
                    conn.disconnect();
                }
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    // 4-2/2 end

}


