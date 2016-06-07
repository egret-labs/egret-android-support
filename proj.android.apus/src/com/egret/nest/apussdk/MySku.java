package com.egret.nest.apussdk;

import org.json.JSONException;
import org.json.JSONObject;

import com.apusplay.sdk.pay.IabCode;
import com.apusplay.sdk.pay.Sku;

import android.text.TextUtils;

public class MySku implements Sku{
    private final String productId;
    private final String type;
    private final String price;
    private final long priceAmountMicros;
    private final String currencyCode;
    private final String name;
    private final String description;
    private final float priceValue;
    
    private final String json;

    public MySku(String productId, 
    			String itemType,
    			String price,
    			long   priceAmountMicros,
    			String currencyCode,
    			String productName,
    			String description){
    	this.productId = productId;
    	this.type = itemType;
    	this.priceAmountMicros = priceAmountMicros;
    	this.currencyCode = currencyCode;
    	this.name = productName;
    	this.description = description;
    	String priceStr = price;
    	priceStr = "0.01";
        int start = priceStr.lastIndexOf(currencyCode);
        if(start>=0){
        	start+=currencyCode.length();
        	this.price = priceStr.substring(start);
        } else{
        	this.price = priceStr;
        }
        if(!TextUtils.isEmpty(this.price)){
        	priceValue = Float.valueOf(this.price);
        } else{
        	priceValue = 0.f;
        }

    	json = toJson();
    }

    private String toJson() {
	    	JSONObject o = new JSONObject();
	    	try {
			o.put("productId", productId);
			o.put("type", type);
			o.put("price", price);
			o.put("priceAmountMicros", priceAmountMicros);
			o.put("currencyCode", currencyCode);
			o.put("name", name);
			o.put("description", description);
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		return o.toString();
	}

	public String getProductId() { return productId; }
    
    public String getName() { return name; }
    
    public String getType() { return type; }
    public String getPrice() { return price; }
    
    public long getPriceAmountMicros() { return priceAmountMicros; }
    public String getPriceCurrencyCode() { return currencyCode; }
    public String getTitle() { return getName(); }
    public String getDescription() { return description; }
    /**
     * The price in number value
     * @return
     */
    public float getPriceValue(){
    	return priceValue;
    }

    @Override
    public String toString() {
        return "MySku:" + json;
    }
    
    /**
     * If the item purchased is consumable.
     * @return
     */
    public boolean isConsumable(){
    	if(getType().equalsIgnoreCase(IabCode.ITEM_TYPE_INAPP))
			return true;
    	
		return false;
    }


}
