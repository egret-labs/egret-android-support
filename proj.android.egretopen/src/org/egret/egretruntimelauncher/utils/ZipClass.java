package org.egret.egretruntimelauncher.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import android.util.Log;

/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class ZipClass {

    private static final int BUFFER_SIZE = 1024;
    private static final String TAG = "ZipClass";

    public interface OnZipListener {
        void onSuccess();
        void onError(String message);
        void onProgress(int progress, int length);
        void onFileProgress(int progress, int length);
    }

    public boolean unzip(File src, File dstRoot) {
        return doUnzip(src, dstRoot, null);
    }

    public void unzip(File src, File dstRoot, OnZipListener listener) {
        if (listener == null) {
            Log.e(TAG, "listener is null");
        }
        doUnzip(src, dstRoot, listener);
    }

    @SuppressWarnings("resource")
    private boolean doUnzip(File src, File dstRoot, OnZipListener listener) {
        if (src == null || dstRoot == null) {
            Log.e(TAG, "src or dstRoot may be null");
            return false;
        }

        // if file size > 20K, BufferedXXStream is lower than raw XXStream
        if (!dstRoot.exists() && !dstRoot.mkdirs()) {
            Log.e(TAG, "fail to mkdir " + dstRoot.getAbsolutePath());
            if (listener != null) {
                listener.onError("fail to mkdir " + dstRoot.getAbsolutePath());
            }
            return false;
        }

        ZipFile zipfile = null;
        InputStream in = null;
        FileOutputStream out = null;
        try {
            zipfile = new ZipFile(src);
            int size = zipfile.size();
            int count = 0;
            Enumeration<? extends ZipEntry> e = zipfile.entries();
            ZipEntry entry;
            while (e.hasMoreElements()) {
                if (listener != null && !ExecutorLab.getInstance().isRunning()) {
                    listener.onError("zip thread is cancelled");
                    return false;
                }
                count += 1;
                if (listener != null) {
                    listener.onProgress(count, size);
                }
                entry = (ZipEntry) e.nextElement();
                File target = new File(dstRoot, entry.getName());
                if (entry.isDirectory()) {
                    if (!target.mkdirs()) {
                        Log.e(TAG, "fail to mkdir " + target.getAbsolutePath());
                        if (listener != null) {
                            listener.onError("fail to mkdir "
                                    + target.getAbsolutePath());
                        }
                        return false;
                    }
                    continue;
                }

                int length = (int) entry.getSize();
                int progress = 0;
                in = zipfile.getInputStream(entry);
                out = new FileOutputStream(target);
                byte data[] = new byte[BUFFER_SIZE];
                int read;
                while ((read = in.read(data, 0, BUFFER_SIZE)) != -1) {
                    if (listener != null
                            && !ExecutorLab.getInstance().isRunning()) {
                        listener.onError("zip thread is cancelled");
                        return false;
                    }
                    out.write(data, 0, read);
                    progress += read;
                    if (listener != null) {
                        listener.onFileProgress(progress, length);
                    }
                }
                out.close();
                in.close();
            }
            zipfile.close();
            Log.i(TAG, "success to unzip " + src.getAbsolutePath());
            if (listener != null) {
                listener.onSuccess();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            if (listener != null) {
                listener.onError(e.toString());
            }
            return false;
        } finally {
            try {
                if (zipfile != null) {
                    zipfile.close();
                }
                if (in != null) {
                    in.close();
                }
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
                if (listener != null) {
                    listener.onError(e.toString());
                }
            }
        }
    }
}
