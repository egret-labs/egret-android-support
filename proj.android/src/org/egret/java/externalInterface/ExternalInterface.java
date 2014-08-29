package org.egret.java.externalInterface;

import java.util.HashMap;

import org.egret.egretframeworknative.egretjni.PluginHelper;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import android.util.Log;

public class ExternalInterface implements PluginHelper.PluginListener{
	private static final String LOG_TAG ="Test";
	
	public static void run(){
		PluginHelper.addPluginLlistener(new ExternalInterface());
	}
	
	public static void call(String name, String value){
		
		PluginHelper.postInfoToJS(value);
	}
	
	private static HashMap<String , IExternalInterface> callBackList = new HashMap<String , IExternalInterface>();
	public static void addCallBack(String name, IExternalInterface obj){
		callBackList.put(name , obj);
	}
	
	@Override
	public void recivedInfo(String arg0) {
		Log.i(LOG_TAG, "recivedInfo info = "+arg0);
		try {
			JSONObject obj = new JSONObject(new JSONTokener(arg0));
			String functionName = obj.getString("functionName");
			IExternalInterface callBack = callBackList.get(functionName);
			if(callBack != null) {
				callBack.call(obj.getString("value"));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}
}
