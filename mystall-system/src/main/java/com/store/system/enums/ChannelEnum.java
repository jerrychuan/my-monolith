package com.store.system.enums;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 渠道枚举
 */
public enum ChannelEnum {
    MT_WM("mtwm","美团外卖"),
    ELM_WM("elmwm","饿了么外卖"),
    ;

    ChannelEnum(String code,String value){
        this.code = code;
        this.value = value;
    }

    private String code;
    private String value;

    public String getValue() {
        return value;
    }

    public String getCode() {
        return code;
    }

    public static List toList() {
        ChannelEnum[] ary = ChannelEnum.values();
        List list = new ArrayList();
        for (int i = 0; i < ary.length; i++) {
            Map<String, String> map = new HashMap<String, String>();
            map.put("value", ary[i].getValue());
            map.put("code", ary[i].getCode());
            list.add(map);
        }
        return list;
    }
}
