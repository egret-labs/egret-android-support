package org.egret.java;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import org.egret.egretframeworknative.MainActivity;

public class HelloEgret extends MainActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
	}

	 static {
	        System.loadLibrary("HelloEgret");
	    }
}
