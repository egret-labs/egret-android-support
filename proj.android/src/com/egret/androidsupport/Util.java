package com.egret.androidsupport;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;

public class Util {

	public enum StartupMode {

		RELEASE_LOCAL, RELEASE_WEB, DEBUG_LOCAL

	}

	public class GameConfiguration {
		
		
		private Activity activity;
		
		public GameConfiguration(Activity activity){
			this.activity = activity;
		}

		public String getConfig(String key) {

			String result = "";
			ActivityInfo info;
			try {
				info = activity.getPackageManager().getActivityInfo(
						activity.getComponentName(),
						PackageManager.GET_META_DATA);
				result = info.metaData.getString(key);
			} catch (NameNotFoundException e) {
				e.printStackTrace();
			}
			return result;
		}
	}

	public interface RuntimeListener {
		public void callback(String message);
	}

	public static void registerPlugin(Object gameEngine, String name,
			Object plugin) {

		Class<?>[] params = { String.class };
		Object[] args = { "" };
		Object nest = callMethod(gameEngine, "getComponent", params, args);

		Class<?>[] paramRegisterPlugin = { String.class, Object.class };
		Object[] argsRegisterPlugin = { name, plugin };
		callMethod(nest, "registerPlugin", paramRegisterPlugin,
				argsRegisterPlugin);

	}

	private static Object callMethod(Object obj, String name,
			Class<?>[] params, Object[] args) {

		if (name == null || obj == null) {
			return null;
		}

		try {
			Method method = obj.getClass().getMethod(name, params);
			return method.invoke(obj, args);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;

	}

}
