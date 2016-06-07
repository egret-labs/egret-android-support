package com.egret.nest.quicksdk;

//import org.egret.egretruntimelauncher.utils.EgretReflectUtils;
import java.util.UUID;

import org.egret.runtime.nest.NestProxy;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

import com.quicksdk.entity.GameRoleInfo;
import com.quicksdk.entity.OrderInfo;

/**
 * 功能描述:分享系统
 * 是否修改:渠道使用自有的SDK.需要修改此类
 * 修改点1:isSupport(final Object proxy)
 * 修改点2:share(final Object proxy)
 * @author imathliu
 *
 */
public class NestShareImpl {
    private static final String TAG = "NestShareImpl";
    private Activity mActivity = null;
    
    public NestShareImpl(Activity activity){
    	 mActivity = activity;
    }
	/**
	 * 功能描述:用户分享功能开关
	 * 是否修改:渠道使用自有的SDK实现用户分享.需要修改此类
	 * 修改内容:obj.put("share", "1");
	 * @param proxy
	 */
    public void isSupport(final NestProxy proxy) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("status", "0");
            /**
             * share 参数定义
             * 0:不支持 默认值
             * 1:支持
             */
            obj.put("share", "0");
            //必须.将客户端的是否支持分享通知Runtime.游戏根据此结果决定是否开放分享功能
            proxy.invokeCallback(obj);
//            EgretReflectUtils.invokeNestProxyCallback(proxy, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 功能描述:用户分享
     * 是否修改:渠道使用自有的SDK实现用户分享.需要修改此类
     * 修改内容:重写share的实现
     * @param proxy
     */
    public void share(final NestProxy proxy) {
        /**
         * 渠道使用自有的SDK实现用户支付.请重写share实现 
         * 并通过 EgretReflectUtils.invokeNestProxyCallback(proxy, json)
         * 将结果回传Runtime
         * json格式说明
         * json.put("result","0");
         * 0:分享成功
         * －1:用户取消
         */
    	Log.d(TAG,"share");
    	pay();
    }
    
    /**
	 * 支付 备注：goodsDes设置为货币单元； 例如 orderInfo.setGoodsDesc("钻石")
	 */
	private void pay() {
		final GameRoleInfo roleInfo = new GameRoleInfo();
		roleInfo.setServerID("1");// 服务器ID
		roleInfo.setServerName("火星服务器");// 服务器名称
		roleInfo.setGameRoleName("云");// 角色名称
		roleInfo.setGameRoleID("1121121");// 角色ID
		roleInfo.setGameUserLevel("12");// 等级
		roleInfo.setVipLevel("Vip4");// VIP等级
		roleInfo.setGameBalance("5000");// 角色现有金额
		roleInfo.setPartyName("联盟");

		final OrderInfo orderInfo = new OrderInfo();
		orderInfo.setCpOrderID(UUID.randomUUID().toString().replace("-", ""));// 游戏订单号
		orderInfo.setGoodsName("元宝");
		// orderInfo.setGoodsName("月卡");
		orderInfo.setQuantifier("个");
		orderInfo.setGoodsDesc("month_card");
		orderInfo.setCount(10);
		// orderInfo.setCount(1);
		orderInfo.setPrice(0.1);
		orderInfo.setAmount(1);
		orderInfo.setGoodsID("1");
		orderInfo.setCallbackUrl("callback url");
		orderInfo.setExtrasParams("额外参数");
		mActivity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				com.quicksdk.Payment.getInstance().pay(mActivity,orderInfo,roleInfo);
			}
		});
	}
}
