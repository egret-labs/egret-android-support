package org.egret.java.HelloEgret;

import android.content.Context;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

public class GameLoadingView extends FrameLayout {

    private ProgressBar bar;
    private TextView tv;

    /**
     * 游戏下载进度条 上线前请替换渠道自定制进度条
     * 
     * @param context
     */
    public GameLoadingView(Context context) {
        super(context);

        ////显示当前进度信息的View。可以根据自己的需要来定制。当前只是给了一个简单的DEMO。
        //一个Text View 。
        tv = new TextView(context);
        tv.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT,
                LayoutParams.WRAP_CONTENT));
        tv.setText("Game Loading...");
        this.addView(tv);

        //一个ProgressBar ，用来显示当前进度。
        bar = new ProgressBar(context, null,
                android.R.attr.progressBarStyleHorizontal);
        this.addView(bar);
        /////////////////////////////////////////////////////
    }

  //必须保留一下方法，来接受游戏包加载进度的信息。
    //必须保留
    public void onProgress(float progress) {
    	//接受到进度信息，设置信息显示。
        bar.setProgress((int) progress);
    }

    //必须保留。
    public void onGameZipUpdateProgress(float percent) {
    	//接受到进度信息，设置信息显示。
        bar.setProgress((int) percent);
    }

    //必须保留。
    public void onGameZipUpdateError() {
    	//接受到的错误信息
    }

    //必须保留。
    public void onGameZipUpdateSuccess() {
    	//接受到成功信息
    }
    //////////////////////////////////////////
}
