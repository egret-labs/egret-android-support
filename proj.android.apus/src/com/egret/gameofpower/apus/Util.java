package com.egret.gameofpower.apus;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class Util {
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
