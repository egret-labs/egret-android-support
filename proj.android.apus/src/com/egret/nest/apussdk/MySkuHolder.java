package com.egret.nest.apussdk;

import java.util.HashMap;

import com.apusplay.sdk.pay.Sku;
import com.apusplay.sdk.pay.SkuHolder;

public class MySkuHolder extends HashMap<String, Sku> implements SkuHolder{	
	public MySkuHolder(){
//		Sku sku = null;
//
//		sku = new MySku("premium","inapp","0.99",990000,"USD","premium (SdkDemo)","premium desc");
//		this.addSku(sku);
//		
//		sku = new MySku("gas","inapp","1.01",1010000,"USD","gas (SdkDemo)","gas");
//		this.addSku(sku);
//		
//		sku = new MySku("battery","inapp","PHP46.16",46160000,"PHP","Recharged Battery (SdkDemo)","Recharged Battery used to start motor and provide energy for electric appliance.");
//		this.addSku(sku);
//		
//		sku = new MySku("infinite_gas_monthly","subs","PHP46.33",46330000,"PHP","infinite_gas_monthly (SdkDemo)","infinite_gas_monthly");
//		this.addSku(sku);
//		
//		sku = new MySku("infinite_gas_yearly","subs","PHP46.33",46330000,"PHP","infinite_gas_yearly (SdkDemo)","infinite_gas_yearly");
//		this.addSku(sku);
	}

	@Override
	public Sku get(String sku) {
		
		return super.get(sku);
	}

	@Override
	public boolean containsKey(String key) {
		// TODO Auto-generated method stub
		return super.containsKey(key);
	}

	@Override
	public void addSku(Sku sku) {
		put(sku.getProductId(),sku);
		
	}

	@Override
	public Sku remove(String sku) {
		return super.remove(sku);
	}

}
