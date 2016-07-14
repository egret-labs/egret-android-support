package com.egret.nest.apussdk;

//import org.egret.egretruntimelauncher.nest.manager.EgretSDKManager;
//import org.egret.egretruntimelauncher.nest.manager.OnPayProcessListener;
//import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
//import org.egret.egretruntimelauncher.utils.LogUtil;
import java.util.ArrayList;
import java.util.List;

import org.egret.runtime.nest.NestProxy;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

import com.apusplay.sdk.ApusPlaySdk;
import com.apusplay.sdk.RequestCallBack;
import com.apusplay.sdk.RequestResult;
import com.apusplay.sdk.SdkConstants;
import com.apusplay.sdk.UserProfile;
import com.apusplay.sdk.auth.AuthCallBack;
import com.apusplay.sdk.pay.IabBroadcastReceiver.IabBroadcastListener;
import com.apusplay.sdk.pay.IabInventory;
import com.apusplay.sdk.pay.IabPay;
import com.apusplay.sdk.pay.IabResult;
import com.apusplay.sdk.pay.Inventory;
import com.apusplay.sdk.pay.PayCallBack;
import com.apusplay.sdk.pay.PayConfig;
import com.apusplay.sdk.pay.PayResult;
import com.apusplay.sdk.pay.Purchase;
import com.apusplay.sdk.pay.Sku;
import com.apusplay.sdk.pay.SkuHolder;
import com.egret.androidsupport.apus.Constants;

/**
 * 功能描述:支付系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点:pay(final Object proxy)
 * @author imathliu
 *
 */
public class NestPayImpl{

    private static final String TAG = "NestPayImpl";
    private Activity mActivity = null;
    private NestProxy mProxy = null;
    IabPay iabPay = null;
    IabPay.OnQueryInventoryListener inventoryListener = null;
    IabPay.OnConsumeListener consumeListener = null;
    IabBroadcastListener iabBroadcastListener = null;
    
    SkuHolder mSkuHolder = null;
    JSONObject mOrderParam = null;
    
    public NestPayImpl(Activity activity){
    	mActivity = activity;
    	
    	mSkuHolder = new MySkuHolder();
    	initCallbacks();
    }
    //构造支付参数
    private String getPayingParametersJson(
    		String productId,
    		String transactionId,
    		String privateData,
    		String notifyUrl,
    		int quantity,
    		String payOrigin) throws Exception {
    	JSONObject jObj = new JSONObject();
    	jObj.put(SdkConstants.PRODUCT_ID, productId);
    	jObj.put(SdkConstants.TRANSACTION_ID, transactionId);
    	jObj.put(SdkConstants.PRIVATE_DATA, privateData);
    	jObj.put(SdkConstants.NOTIFY_URL, notifyUrl);
    	jObj.put(SdkConstants.QUANTITY, quantity);
    	jObj.put(SdkConstants.PAY_ORIGIN, payOrigin);
    	return jObj.toString();
    }
    
    private void initCallbacks(){
	    	inventoryListener = new IabPay.OnQueryInventoryListener(){
			@Override
			public void onCompleted(RequestResult result, Inventory inv) {
				// TODO Auto-generated method stub
				if(result.isFailure()){
					mPayCallBack.onFailure(null,-1,"initNotComplete");
					return ;
				}
				try {
					final String paymentStr = getPayingParametersJson(
						mOrderParam.getString("goodsId"),
						mOrderParam.getString("egretOrderId"),
						mOrderParam.getString("ext"),//透传数据可空
						Constants.notifyUrl,//异步通知地址可空
						1,//个数 
						"game"//游戏内支付
					);
					Log.d(TAG, "pay init completed!ready to pay:"+paymentStr);
					//实际支付
					mActivity.runOnUiThread(new Runnable() {
						@Override
						public void run() {
							// TODO Auto-generated method stub
							try {
								iabPay.pay(mActivity, paymentStr, mPayCallBack);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					});
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		@Override
		public void fulfillInventory(Inventory inv) {
			// TODO Auto-generated method stub
			if(ApusPlaySdk.getInstance().getConfig().isGoogleIab()){
				// GOOGLE IAB mode
				// The inventory retrieved from Google Play
				// No need further handling
				//
			} else {
				// NONE GOOGLE IAB mode
				// Please add your SKUs if not the GOOGLE IAB mode
				// Option 2. if inv is IabInventory instance, can provide your own SkuHolder, which provide method to manipulate Sku items.
				if(mOrderParam!=null){
					try{
						//同步产品信息
						String priceStr = mOrderParam.getString("money");
						double price = Double.parseDouble(priceStr);
						java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
						MySku sku = new MySku(
							mOrderParam.getString("goodsId"),//productId
 							"inapp",//itemType
							df.format(price),//price
							(long)(price*1000000),//priceAmountMicros
							"USD",//currencyCode
							mOrderParam.getString("goodsName"),//productName
							"this is description"//description								
						);
//						mSkuHolder.addSku(sku);
						
						if(inv instanceof IabInventory)
//							((IabInventory)inv).setSkuHolder(mSkuHolder);
							((IabInventory)inv).addSku(sku);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			} 
		}
    	}; 			// OnQueryInventoryListener
		consumeListener = new IabPay.OnConsumeListener() {
			@Override
			public void onConsumeCompleted(IabResult arg0, Purchase arg1) {
				// TODO Auto-generated method stub
				
			}
		};			// OnConsumeListener
		iabBroadcastListener = new IabBroadcastListener(){
			@Override
			public void receivedBroadcast() {
				// TODO Auto-generated method stub
				iabPay.queryInventoryAsync(inventoryListener);
			}
		};
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
        beforePay(param);
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
    private void beforePay(final JSONObject param){
    		ApusPlaySdk.getInstance().refurbishToken(mActivity, new RequestCallBack(){
				@Override
				public void onAbort() {
					// TODO Auto-generated method stub
				}
				@Override
				public void onFailure(Throwable arg0, int arg1, String arg2) {
					// TODO Auto-generated method stub
					//刷新token失败要优先logout确保下次login不会读取缓存数据
					refreshTokenFailedLogout(new AuthCallBack(){
						@Override
						public void onAbort() {
							// TODO Auto-generated method stub
						}
						@Override
						public void onFailure(Throwable arg0, int arg1,
								String arg2) {
							// TODO Auto-generated method stub
							Log.d(TAG,"onRefreshTokenFailedLogoutFailed!");
					    		final JSONObject param = mProxy.getParams();
					    		try {
					    			param.put("result",-3);//需要CP提示token失效并重新唤起登录界面
					    			param.put("egretOrderId", param.getString("egretOrderId"));
					    		} catch (JSONException e) {
					    			// TODO Auto-generated catch block
					    			e.printStackTrace();
					    		}
					    		if(null != mProxy){
					    			mProxy.invokeCallback(param);
					    		}
						}
						@Override
						public void onSuccess(UserProfile arg0) {
							// TODO Auto-generated method stub
						}
						@Override
						public void onLogout() {
							// TODO Auto-generated method stub
							Log.d(TAG,"onRefreshTokenFailedLogoutSuccess!");
					    		final JSONObject param = mProxy.getParams();
					    		try {
					    			param.put("result",-3);//需要CP提示token失效并重新唤起登录界面
					    			param.put("egretOrderId", param.getString("egretOrderId"));
					    		} catch (JSONException e) {
					    			// TODO Auto-generated catch block
					    			e.printStackTrace();
					    		}
					    		if(null != mProxy){
					    			mProxy.invokeCallback(param);
					    		}
						}
	 				});
				}
				@Override
				public void onSuccess(Object arg0) {
					// TODO Auto-generated method stub
			        startPay(param);
				}
    		});
    }
    
    private void refreshTokenFailedLogout(final AuthCallBack acb){
	    	mActivity.runOnUiThread(new Runnable(){
	 			public void run(){
	 				Log.i(TAG,"call logout success");
	 				ApusPlaySdk.getInstance().logout(mActivity,acb);
	 			}
			});
    }
	/**
	 * 与egret的支付信息进行
	 * 支付 备注：goodsDes设置为货币单元； 例如 orderInfo.setGoodsDesc("钻石")
	 */
	private void startPay(JSONObject param) {
		try {
			 //
	        // Obtain IabPay instance
	        //
	        // 1. prepare PayConfig object
//	        PayConfig payConfig = getPayConfig();
	        
	        // 2. obtain the instance in either way
	        //    a. ApusPlaySdk.getInstance().getPayable(payConfig);
	        //    b. PayManager.getPayable(payConfig);
	        iabPay = (IabPay) ApusPlaySdk.getInstance().getPayable();

	        // 3. Initialize the pay instance. 
	        // Prepare SKU id list 
	        saveSku(param);
	        final List<String> skuIds = new ArrayList<String>();
	        skuIds.add(param.getString("goodsId"));
	        // Initialize the pay instance in async way
	        //   The OnQueryInventoryListener inventoryListener will be notified once the inventory is ready
	        //   The OnConsumeListener consumeListener to notify when the consumption is complete .
	        //   The IabBroadcastListener will be notified if message "com.android.vending.billing.PURCHASES_UPDATED" is received
	        Log.d(TAG, "Pay instance initializing...");
	        mActivity.runOnUiThread(new Runnable() {
				@Override
				public void run() {
			        iabPay.initAsync(mActivity, 				// Activity context
			        		skuIds, 					// SKU Id list 
			        		inventoryListener, 			// OnQueryInventoryListener
			        		consumeListener,			// OnConsumeListener
			        		iabBroadcastListener 	// IabBroadcastListener
			        		);
			}});
			
//			final OrderInfo orderInfo = new OrderInfo();
//			
//			final GameRoleInfo roleInfo = QuickSDKActivity.getGameRole(param.getString("userId"),param.getString("userName"));
//			
//			orderInfo.setCpOrderID(param.getString("egretOrderId"));
//			orderInfo.setGoodsName(param.getString("goodsName"));
//			orderInfo.setQuantifier("");//个数统一为1，没有量词
//			orderInfo.setGoodsDesc("month_card");
//			orderInfo.setCount(1);
//			double price = Double.parseDouble(param.getString("money"));
//			orderInfo.setPrice(price);
//			orderInfo.setAmount(price);
//			orderInfo.setGoodsID(param.getString("goodsId"));
//			orderInfo.setCallbackUrl(param.getString("gameUrl"));
//			orderInfo.setExtrasParams("额外参数");
//			
//			mActivity.runOnUiThread(new Runnable() {
//				@Override
//				public void run() {
//					// TODO Auto-generated method stub
//					com.quicksdk.Payment.getInstance().pay(mActivity,orderInfo,roleInfo);
//				}
//			});
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	private void saveSku(JSONObject param){
		mOrderParam = param;
	}
	
	//支付配置 初始化的前提
//	PayConfig payConfig=null;
//    private PayConfig getPayConfig() {
//		if(payConfig==null){
//			// Not prepared yet, construct one
//			// construct pay config according to the APK version
//			// - For Google IAB, the getPayType() returns SdkConstants.PAY_TYPE_GOOGLE_IAB
//			// - For Default pay gateway, the getPayType() returns SdkConstants.PAY_TYPE_GATEWAY
//			payConfig = new IabPayConfig();
//			if(ApusPlaySdk.getInstance().getConfig().isGoogleIab()){
//				((IabPayConfig)payConfig).setPayType(SdkConstants.PAY_TYPE_GOOGLE_IAB);
//			}else{
//				((IabPayConfig)payConfig).setPayType(SdkConstants.PAY_TYPE_GENERAL_GATEWAY);
//			}
//		}
//		return payConfig;
//	}
    PayCallBack mPayCallBack = new PayCallBack(){
	    	@Override
	    	public void onAbort() {
	    		// TODO Auto-generated method stub
	    		Log.d(TAG,"onPayCanceled!");
	    		final JSONObject param = mProxy.getParams();
	    		try {
	    			param.put("result",-1);
	    			param.put("egretOrderId", param.getString("egretOrderId"));
	    		} catch (JSONException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	    		if(null != mProxy){
	    			mProxy.invokeCallback(param);
	    		}
	    	}
	
	    	@Override
	    	public void onFailure(Throwable arg0, int errorcode, String msg) {
	    		// TODO Auto-generated method stub
	    		Log.d(TAG,"onPayFailed! code:"+ errorcode + " msg:" + msg);
	    		final JSONObject param = mProxy.getParams();
	    		try {
	    			param.put("result",-2);
	    			param.put("egretOrderId", param.getString("egretOrderId"));
	    		} catch (JSONException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	    		if(null != mProxy){
	    			mProxy.invokeCallback(param);
	    		}
	    	}
	
	    	@Override
	    	public void onSuccess(PayResult arg0) {
	    		// TODO Auto-generated method stub
	    		Log.d(TAG,"onPaySuccess!");
	    		final JSONObject param = mProxy.getParams();
	    		try {
	    			param.put("result",0);
	    			param.put("egretOrderId", param.getString("egretOrderId"));
	    		} catch (JSONException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	    		if(null != mProxy){
	    			mProxy.invokeCallback(param);
	    		}
	    	}

		@Override
		public void onTopup(PayResult result) {
			// TODO Auto-generated method stub
			if("SUCCESS".equals(result.getResultCode())){
				Log.d(TAG,"onPaySuccess!");
		    		final JSONObject param = mProxy.getParams();
		    		try {
		    			param.put("result",0);
		    			param.put("egretOrderId", param.getString("egretOrderId"));
		    		} catch (JSONException e) {
		    			// TODO Auto-generated catch block
		    			e.printStackTrace();
		    		}
		    		if(null != mProxy){
		    			mProxy.invokeCallback(param);
		    		}
			}else{
				Log.d(TAG,"onPayFailed! code:"+ result.getErrorCode() + " msg:" + result.getMessage());
		    		final JSONObject param = mProxy.getParams();
		    		try {
		    			param.put("result",-2);
		    			param.put("egretOrderId", param.getString("egretOrderId"));
		    		} catch (JSONException e) {
		    			// TODO Auto-generated catch block
		    			e.printStackTrace();
		    		}
		    		if(null != mProxy){
		    			mProxy.invokeCallback(param);
		    		}
			}
		}
    };
}