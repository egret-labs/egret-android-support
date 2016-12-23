package org.egret.java.HelloEgret;

import java.io.Serializable;
import java.util.HashMap;
/**
 * 实现Serializable，为了可以通过intent在activity之间传递
 */
public class GameOptionDescriptor implements Serializable {

    private HashMap<String,Object> options;

    public void setOptions(HashMap<String, Object> map){
        this.options = map;
    }

    public HashMap<String, Object> getOptions(){
        return this.options;
    }
}
