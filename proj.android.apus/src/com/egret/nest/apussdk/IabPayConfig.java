package com.egret.nest.apussdk;

import com.apusplay.sdk.SdkConstants;
import com.apusplay.sdk.pay.PayConfig;
import com.egret.gameofpower.apus.Constants;

/**
 * This GiaPayConfig is a demo for Google In-app Billing.
 *
 */
public class IabPayConfig implements PayConfig{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2744783582674594255L;
	String payType = SdkConstants.PAY_TYPE_DEFAULT;
	/**
	 * The pay type value 
	 * 	SdkConstants.PAY_TYPE_GOOGLE_IAB means Google In-App Billing
	 * 	SdkConstants.PAY_TYPE_GENERAL_GATEWAY means ordinary payment gateway such as PayPal, etc.
	 */
	@Override
	public String getPayType() {
		return payType;
			// SdkConstants.PAY_TYPE_GOOGLE_IAB;
	}

	public void setPayType(String type){
		payType = type;
	}
	/**
	 * The value used to make signature for given app.
	 * 
	 * @return the value to add to string to make a hash value, e.g. MD5
	 */
	@Override
	public String getSecretValue() {
		return Constants.appSecret;
	}

	/**
	 * The value to public key 
	 * Google In-App Billing approach, get this "Services & APIs " 
	 * @return the base64 encoded with public key
	 */
	@Override
	public String getPublicKey() {
		// The based64 encoded public key by Google Play publish
		return 	"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArmWYkvt9+bcfLFpOG1HVrXXw3iYXc6D5FKwLs+CPcwBIMPTU2yOJSlY6shxPgGFUJI4OHHswc7/82vr4nsS6aN5UYaxqZI0+BytoQd558ugn88P5g3DqR3xEtyencQyVOoVQoqka8a/4o02RTKFSOPDggrJipZ0ogNwZg6/jhetbvruY+QTcNiJ9UgwLlGAFrOg/R7sWjv9Q4yS3zzts/d8Hnti0lf2JrY1dn/2jll68mamxzd0oykNHqdef3iHEVQXHKEG7dbZqg79Pu3Cz6Zq9JYSVMU6DN3OlRO9MtXwBkBieOn1C7I/pc3hL0n15gbIac8VmMGrAYbek1BF0xQIDAQAB";
	}

	/**
	 * The App Id is assigned by the Apus open system.
	 * 
	 * @return the app id by assigned by open system or the package for google play hosted app.
	 */
	@Override
	public String getAppId() {
		return Constants.appId;
	}
	
	/**
	 * The app Name.
	 */
	@Override
	public String getAppName() {
		// TODO Auto-generated method stub
		return Constants.appName;
	}

	/**
	 * If the purchased item would be consumed immediately
	 * @return
	 */
	@Override
	public boolean isAutoConsume() {
		// TODO Auto-generated method stub
		return true;
	}
}
