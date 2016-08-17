package org.egret.egretruntimelauncher.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;

import org.json.JSONObject;

import android.content.Context;
import android.view.View;

/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class EgretReflectUtils {

    private class GameEngineMethod {

        public static final String GAME_ENGINE_ON_RESUME =
                "game_engine_onResume";
        public static final String GAME_ENGINE_ON_PAUSE =
                "game_engine_onPause";
        public static final String GAME_ENGINE_ON_STOP =
                "game_engine_onStop";
        public static final String GAME_ENGINE_SET_OPTIONS =
                "game_engine_set_options";
        public static final String GAME_ENGINE_GET_OPTION =
                "game_engine_get_option";
        public static final String GAME_ENGINE_SET_LOADING_VIEW =
                "game_engine_set_loading_view";
        public static final String GAME_ENGINE_INIT =
                "game_engine_init";
        public static final String GAME_ENGINE_GET_VIEW =
                "game_engine_get_view";
        public static final String CALL_EGRET_INTERFACE =
                "callEgretInterface";
        public static final String SET_RUNTIME_INTERFACE_SET =
                "setRuntimeInterfaceSet";
        public static final String ENABLE_EGRET_RUNTIME_INTERFACE =
                "enableEgretRuntimeInterface";
        public static final String GAME_ENGINE_SET_ENGINE_LISTENER =
                "game_engine_set_engine_listener";
    }

    private static final String TAG = "EgretReflectUtils";
    
    public static void setEngineListener(Object gameEngine, Object listener) {

        Class<?>[] params = {Object.class};
        Object[] args = {listener};
        callMethod(gameEngine, GameEngineMethod.GAME_ENGINE_SET_ENGINE_LISTENER,
                params, args);

    }
    
    public static void onResume(Object gameEngine) {

        callVoidMethod(gameEngine, GameEngineMethod.GAME_ENGINE_ON_RESUME);

    }

    public static void onPause(Object gameEngine) {

        callVoidMethod(gameEngine, GameEngineMethod.GAME_ENGINE_ON_PAUSE);

    }

    public static void onStop(Object gameEngine) {

        callVoidMethod(gameEngine, GameEngineMethod.GAME_ENGINE_ON_STOP);

    }

    public static void enableEgretRuntimeInterface(Object gameEngine) {

        callVoidMethod(gameEngine,
                GameEngineMethod.ENABLE_EGRET_RUNTIME_INTERFACE);

    }

    public interface IRuntimeCallback {

        public void callBack(String data);

    }

    public static void setRuntimeInterfaceSet(Object gameEngine,
            HashMap<String, IRuntimeCallback> interfaces) {

        Class<?>[] params = {HashMap.class};
        Object[] args = {interfaces};
        callMethod(gameEngine, GameEngineMethod.SET_RUNTIME_INTERFACE_SET,
                params, args);

    }

    public static void callEgretInterface(Object gameEngine, String name,
            String message) {

        Class<?>[] params = {String.class, String.class};
        Object[] args = {name, message};
        callMethod(gameEngine, GameEngineMethod.CALL_EGRET_INTERFACE, params,
                args);

    }

    public static void setOptions(Object gameEngine,
            HashMap<String, Object> options) {

        Class<?>[] params = {HashMap.class};
        Object[] args = {options};
        callMethod(gameEngine, GameEngineMethod.GAME_ENGINE_SET_OPTIONS,
                params, args);

    }

    public static Object getOption(Object gameEngine, String key) {

        Class<?>[] params = {String.class};
        Object[] args = {key};
        return callMethod(gameEngine, GameEngineMethod.GAME_ENGINE_GET_OPTION,
                params, args);

    }

    public static void initRuntime(Object gameEngine, Context context) {

        Class<?>[] initParams = {Context.class};
        Object[] initArgs = {context};
        callMethod(gameEngine, GameEngineMethod.GAME_ENGINE_INIT, initParams,
                initArgs);

    }

    public static View getRuntimeView(Object gameEngine) {

        return (View) callVoidMethod(gameEngine,
                GameEngineMethod.GAME_ENGINE_GET_VIEW);

    }

    public static void setLoadingView(Object gameEngine, View view) {

        Class<?>[] loadingParams = {View.class};
        Object[] loadingArgs = {view};
        callMethod(gameEngine, GameEngineMethod.GAME_ENGINE_SET_LOADING_VIEW,
                loadingParams, loadingArgs);

    }

    public static void registerPlugin(Object gameEngine, String name,
            Object plugin) {

        Class<?>[] params = {String.class};
        Object[] args = {""};
        Object nest = callMethod(gameEngine, "getComponent", params, args);

        Class<?>[] paramRegisterPlugin = {String.class, Object.class};
        Object[] argsRegisterPlugin = {name, plugin};
        callMethod(nest, "registerPlugin", paramRegisterPlugin,
                argsRegisterPlugin);

    }

    public static JSONObject getNestProxyParam(Object proxy) {

        return (JSONObject) callMethod(proxy, "getParams", null, null);

    }

    public static JSONObject getAppInfo(Object proxy) {

        return (JSONObject) callMethod(proxy, "getAppInfo", null, null);

    }

    public static void invokeNestProxyCallback(Object proxy, JSONObject data) {

        Class<?>[] paramRegisterPlugin = {JSONObject.class};
        Object[] argsRegisterPlugin = {data};
        callMethod(proxy, "invokeCallback", paramRegisterPlugin,
                argsRegisterPlugin);

    }

    private static Object callVoidMethod(Object object, String name) {

        return callMethod(object, name, null, null);

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