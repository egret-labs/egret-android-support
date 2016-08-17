package org.egret.egretruntimelauncher.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import android.util.Log;

/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class ExecutorLab {
    // android phone's cpu number >= 4, use 3 for worker, 1+ for system
    private static final int THREAD_SIZE = 3;
    private static final String TAG = "ExecutorLab";
    private static ExecutorLab instance = null;
    private ExecutorService pool;
    private volatile boolean running;

    public static ExecutorLab getInstance() {
        if (instance == null) {
            instance = new ExecutorLab();
        }
        return instance;
    }

    public static void releaseInstance() {
        if (instance != null) {
            instance.shutDown();
            instance = null;
        }
    }

    private ExecutorLab() {
        pool = Executors.newFixedThreadPool(THREAD_SIZE);
        running = true;
    }

    public void addTask(Runnable task) {
        if (!running) {
            Log.d(TAG, "ExecutorLab is stop");
            return;
        }
        pool.execute(task);
    }

    private void shutDown() {
        if (!pool.isShutdown()) {
            running = false;
            pool.shutdown();
            while (!pool.isTerminated()) {
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            pool = null;
        }
    }

    public boolean isRunning() {
        return running;
    }

}
