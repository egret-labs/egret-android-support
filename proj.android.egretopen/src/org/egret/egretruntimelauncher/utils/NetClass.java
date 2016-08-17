package org.egret.egretruntimelauncher.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import android.util.Log;

/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class NetClass {
    private static final int TIME_OUT = 30 * 1000;
    private static final int BUFFER_SIZE = 1024;

    public interface OnNetListener {
        void onSuccess(String content);

        void onError(String message);

        void onProgress(int progress, int length);
    }

    private void doRequest(String url, String data, OutputStream out,
            OnNetListener listener) {
        if (url == null || out == null) {
            Log.e("NetTool", "url, out may be null");
            return;
        }
        URL realUrl;
        try {
            realUrl = new URL(url);
        } catch (MalformedURLException e) {
            e.printStackTrace();
            if (listener != null) {
                listener.onError(e.toString());
            }
            return;
        }

        HttpURLConnection conn = null;
        OutputStream post = null;
        InputStream in = null;
        try {
            conn = (HttpURLConnection) realUrl.openConnection();
            if (conn == null) {
                if (listener != null) {
                    listener.onError("unable to open " + url);
                }
                return;
            }

            conn.setConnectTimeout(TIME_OUT);
            if (data != null) {
                conn.setDoOutput(true);
                post = conn.getOutputStream();
                if (post == null) {
                    if (listener != null) {
                        listener.onError("unable to open post: " + url);
                    }
                    return;
                }
                post.write(data.getBytes());
                post.close();
            }
            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                if (listener != null) {
                    listener.onError("response code is HTTP_OK");
                }
                return;
            }
            int length = conn.getContentLength();
            int progress = 0;
            in = conn.getInputStream();
            byte[] buffer = new byte[BUFFER_SIZE];
            int read;
            while ((read = in.read(buffer)) > 0) {
                if (listener != null && !ExecutorLab.getInstance().isRunning()) {
                    break;
                }
                out.write(buffer, 0, read);
                progress += read;
                if (listener != null) {
                    listener.onProgress(progress, length);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            if (listener != null) {
                listener.onError(e.toString());
            }
        } finally {
            try {
                if (conn != null) {
                    conn.disconnect();
                }
                if (post != null) {
                    post.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
                if (listener != null) {
                    listener.onError("fail to close");
                }
            }
        }
    }

    private void request(String url, String data, File dst,
            OnNetListener listener) {
        try {
            if (dst != null) {
                FileOutputStream out = new FileOutputStream(dst);
                doRequest(url, null, out, listener);
                out.close();
                if (listener != null) {
                    if (!ExecutorLab.getInstance().isRunning()) {
                        listener.onError("net thread is cancelled");
                    } else {
                        listener.onSuccess(null);
                    }
                }
            } else {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                doRequest(url, data, out, listener);
                out.close();
                if (listener != null) {
                    if (!ExecutorLab.getInstance().isRunning()) {
                        listener.onError("net thread is cancelled");
                    } else {
                        listener.onSuccess(new String(out.toByteArray()));
                    }
                }
            }

        } catch (IOException ioe) {
            ioe.printStackTrace();
            if (listener != null) {
                listener.onError(ioe.toString());
            }
        }
    }

    public void writeResponseToFile(String url, File dst, OnNetListener listener) {
        if (url == null || dst == null) {
            return;
        }
        request(url, null, dst, listener);
    }

    public void postRequest(String url, String data, OnNetListener listener) {
        if (url == null) {
            return;
        }
        request(url, data, null, listener);
    }

    public void getRequest(String url, OnNetListener listener) {
        postRequest(url, null, listener);
    }

    public String postRequest(String url, String data) {
        if (url == null) {
            return null;
        }
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            doRequest(url, data, out, null);
            out.close();
            return new String(out.toByteArray());
        } catch (IOException ioe) {
            ioe.printStackTrace();
            return null;
        }
    }

    public String getRequest(String url) {
        return postRequest(url, null);
    }

}
