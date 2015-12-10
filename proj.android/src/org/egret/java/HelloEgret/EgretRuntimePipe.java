package org.egret.java.HelloEgret;

import org.egret.egretframeworknative.engine.EgretGameEngine;

import android.util.Log;

public class EgretRuntimePipe {

    private interface IRuntimeInterface {
        public void callBack(String message);
    }

    protected static final String TAG = "EgretRuntimePipe";

    public void setEgretRuntimePipe(final EgretGameEngine gameEngine) {
        // 提供Runtime接口"RuntimeInterfaceA"给Egret
        gameEngine.setRuntimeInterface("RuntimeInterfaceA",
                new IRuntimeInterface() {
                    @Override
                    public void callBack(String message) {
                        Log.d(TAG, "RuntimeInterfaceA receives message from Egret:"
                                + message);
                        // 向Egret的EgretInterfaceA发送消息
                        gameEngine.callEgretInterface("EgretInterfaceA",
                                "A message from Runtime");
                    }
                });
    }
}
