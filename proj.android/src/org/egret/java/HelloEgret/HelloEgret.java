package org.egret.java.HelloEgret;

import android.os.Bundle;

import org.egret.egretframeworknative.EgretRuntimeActivity;
import org.egret.java.externalInterface.ExternalInterface;

public class HelloEgret extends EgretRuntimeActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		ExternalInterface.run();
	}

}


