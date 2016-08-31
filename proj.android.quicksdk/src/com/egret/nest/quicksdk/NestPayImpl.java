package com.egret.nest.quicksdk;

//import org.egret.egretruntimelauncher.nest.manager.EgretSDKManager;
//import org.egret.egretruntimelauncher.nest.manager.OnPayProcessListener;
//import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
//import org.egret.egretruntimelauncher.utils.LogUtil;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.egret.runtime.nest.NestProxy;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

import com.egret.androidsupport.quicksdk.Util;
import com.quicksdk.entity.GameRoleInfo;
import com.quicksdk.entity.OrderInfo;
import com.quicksdk.notifier.PayNotifier;

/**
 * 功能描述:支付系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点:pay(final Object proxy)
 * @author imathliu
 *
 */
public class NestPayImpl implements PayNotifier{

    private static final String TAG = "NestPayImpl";
    private Activity mActivity = null;
    private NestProxy mProxy = null;
    
    public NestPayImpl(Activity activity){
    	mActivity = activity;
    }
    /**
     * 功能描述:用户支付
     * 是否修改:渠道使用自有的SDK实现用户支付.需要修改此类
     * 修改内容:重写pay的实现
     * @param proxy
     */
    public void pay(final NestProxy proxy) {
        Log.d(TAG, "pay");
        mProxy = proxy;
        
        //TODO 实现pay功能 
        /**
         * 渠道使用自有的SDK实现用户支付.请重写pay实现 
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将结果回传Runtime
         */
        //获取支付订单参数
        final JSONObject param = proxy.getParams();
        //获取支付订单参数
//        final JSONObject param = EgretReflectUtils.getNestProxyParam(proxy);

        Log.d(TAG, "launcher pay params:" + param.toString());
        startPay(param);
//        EgretSDKManager esm = EgretSDKManager.getInstance();
//        esm.pay(param, new OnPayProcessListener() {
//            @Override
//            public void finishPayProcess(JSONObject json) {
                /**
                 * json格式说明 json.put("result","0");
                 *  0:支付完成
                 * -1:支付取消
                 * -2:支付失败
                 * json.put("errorMessage",errorMessage);
                 * errorMessage:提示信息
                 */
                //必须.将客户端的支付结果通知Runtime.游戏根据此结果进行轮询.进行后续货币发放操作
//            	proxy.invokeCallback(json);
//                EgretReflectUtils.invokeNestProxyCallback(proxy, json);
//            }
//        });
    }

	@Override
	public void onCancel(String cpOrderID) {
		// TODO Auto-generated method stub
		Log.d(TAG,"onPayCanceled!");
		final JSONObject param = mProxy.getParams();
		try {
			param.put("result",-1);
			param.put("egretOrderId", cpOrderID);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(null != mProxy){
			mProxy.invokeCallback(param);
		}
	}

	@Override
	public void onFailed(String sdkOrderID, String cpOrderID, String extrasParams) {
		// TODO Auto-generated method stub
		Log.d(TAG,"onPayFailed! sdkOrderID:"+sdkOrderID+" cpOrderID:"+cpOrderID+" extrasParams:"+extrasParams);
		final JSONObject param = mProxy.getParams();
		try {
			param.put("result",-2);
			param.put("egretOrderId", cpOrderID);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(null != mProxy){
			mProxy.invokeCallback(param);
		}
	}

	@Override
	public void onSuccess(String sdkOrderID, String cpOrderID, String extrasParams) {
		// TODO Auto-generated method stub
		Log.d(TAG,"onPaySuccess! sdkOrderID:"+sdkOrderID+" cpOrderID:"+cpOrderID+" extrasParams:"+extrasParams);
		final JSONObject param = mProxy.getParams();
		try {
			param.put("result", 0);//成功标记
			param.put("egretOrderId", cpOrderID);
//			param.put("serverId", "1");
//			param.put("serverName", "火星服务器");
//			param.put("gameRoleName", "云");
//			param.put("gameRoleId", "1121121");
//			param.put("gameUserLevel", "12");
//			param.put("vipLevel", "Vip4");
//			param.put("gameBalance", "5000");
//			param.put("partyName", "联盟");
//			param.put("cpOrderId", cpOrderID);
//			param.put("sdkOrderId", sdkOrderID);
//			param.put("goodsName", "元宝");
//			param.put("quantifier", "个");
//			param.put("goodsDesc", "month_card");
//			param.put("count", 10);
//			param.put("price", 0.1);
//			param.put("amount", 1);
//			param.put("goodsId", "1");
//			param.put("callbackUrl", "callback url");
//			param.put("extrasParams", extrasParams);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(null != mProxy){
			mProxy.invokeCallback(param);
		}
	}
	
	/**
	 * 与egret的支付信息进行
	 * 支付 备注：goodsDes设置为货币单元； 例如 orderInfo.setGoodsDesc("钻石")
	 */
	private void startPay(JSONObject param) {
		
//		final GameRoleInfo roleInfo = new GameRoleInfo();
//		roleInfo.setServerID("1");// 服务器ID
//		roleInfo.setServerName("火星服务器");// 服务器名称
//		roleInfo.setGameRoleName("云");// 角色名称
//		roleInfo.setGameRoleID("1121121");// 角色ID
//		roleInfo.setGameUserLevel("12");// 等级
//		roleInfo.setVipLevel("Vip4");// VIP等级
//		roleInfo.setGameBalance("5000");// 角色现有金额
//		roleInfo.setPartyName("联盟");

//		orderInfo.setCpOrderID(UUID.randomUUID().toString().replace("-", ""));// 游戏订单号
		try {
			final OrderInfo orderInfo = new OrderInfo();
			
			final GameRoleInfo roleInfo = Util.getGameRole(param.getString("userId"),param.getString("userName"));
			
			orderInfo.setCpOrderID(param.getString("egretOrderId"));
			String goodsName = null;
			try{
				goodsName = URLDecoder.decode(param.getString("goodsName"),"utf-8");
			}catch(UnsupportedEncodingException e){
				e.printStackTrace();
			}
			orderInfo.setGoodsName(goodsName);
			orderInfo.setQuantifier("");//个数统一为1，没有量词
			orderInfo.setGoodsDesc("month_card");
			orderInfo.setCount(1);
			double price = Double.parseDouble(param.getString("money"));
			orderInfo.setPrice(price);
			orderInfo.setAmount(price);
			orderInfo.setGoodsID(param.getString("goodsId"));
			orderInfo.setCallbackUrl(param.getString("gameUrl"));
			orderInfo.setExtrasParams("额外参数");
			
			mActivity.runOnUiThread(new Runnable() {
				@Override
				public void run() {
					// TODO Auto-generated method stub
					com.quicksdk.Payment.getInstance().pay(mActivity,orderInfo,roleInfo);
				}
			});
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}