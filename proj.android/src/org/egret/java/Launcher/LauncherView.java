package org.egret.java.Launcher;

import android.content.Context;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

/**
 * Created by renren on 2016/10/9.
 */

public class LauncherView extends FrameLayout {
    private ProgressBar bar;
    private TextView tv;

    /**
     * 检测到插件配置后启动部署界面并显示部署进度条
     *
     * @param context
     */
    public LauncherView(Context context) {
        super(context);

        tv = new TextView(context);
        tv.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT,
                LayoutParams.WRAP_CONTENT));
        tv.setText("Launching Configurations...");
        this.addView(tv);

        bar = new ProgressBar(context, null,
                android.R.attr.progressBarStyleHorizontal);
        this.addView(bar);
    }

    public void onProgress(int progress) {
        bar.setProgress(progress);
    }

    public void setText(String strContent){
        tv.setText(strContent);
    }

    public void onGameZipUpdateProgress(int percent) {
        bar.setProgress(percent);
    }

    public void onGameZipUpdateError() {

    }

    public void onGameZipUpdateSuccess() {

    }
}
