package com.mystall.common.utils;

import cn.hutool.core.util.StrUtil;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * 脱敏工具类
 * @author fc
 */
public class DesensitizationUtils {

    /**
     * 名字脱敏
     * @param origin
     * @param replaceChat
     * @return
     */
    public static String desName(String origin, String replaceChat){
        if (StrUtil.isEmpty(origin)) {
            return origin;
        }
        int length = origin.trim().length();
        if (length == 1){
            return origin;
        }else if (length == 2){
            return desValue(origin, 1, 0, replaceChat);
        }
        return desValue(origin, 1, 1, replaceChat);
    }

    /**
     * 身份证号脱敏
     * @param origin
     * @param replaceChat
     * @return
     */
    public static String desIdNum(String origin,String replaceChat) {
        return desValue(origin, 4, 2, replaceChat);
    }

    /**
     * 手机号脱敏
     * @param origin
     * @param replaceChat
     * @return
     */
    public static String desPhone(String origin,String replaceChat) {
        return desValue(origin, 3, 4, replaceChat);
    }


    /**
     * 对字符串进行脱敏操作
     * @param origin          原始字符串
     * @param prefixNoMaskLen 左侧需要保留几位明文字段
     * @param suffixNoMaskLen 右侧需要保留几位明文字段
     * @param replaceChat     用于遮罩的字符串, 如'*'
     * @return 脱敏后结果
     */
    public static String desValue(String origin, int prefixNoMaskLen, int suffixNoMaskLen, String replaceChat) {
        if (origin == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0, n = origin.length(); i < n; i++) {
            if (i < prefixNoMaskLen) {
                sb.append(origin.charAt(i));
                continue;
            }
            if (i > (n - suffixNoMaskLen - 1)) {
                sb.append(origin.charAt(i));
                continue;
            }
            sb.append(replaceChat);
        }
        return sb.toString();
    }

    /**
     * 自动脱敏
     * @param str
     * @return
     */
    public static String autoCountingStar(String str) {
        if (StrUtil.isEmpty(str)) {
            return str;
        }
        int i = str.trim().length();
        if (i == 11) {
            return StrUtil.hide(str,
                    BigDecimal.valueOf(i - (i - 3)).setScale(0, RoundingMode.UP).intValue(),
                    BigDecimal.valueOf(i - 4).setScale(0, RoundingMode.UP).intValue());
        } else if (i > 10) {
            return StrUtil.hide(str,
                    BigDecimal.valueOf(i - (i - 4)).setScale(0, RoundingMode.UP).intValue(),
                    BigDecimal.valueOf(i - 3).setScale(0, RoundingMode.UP).intValue());
        }
        int hide = i / 2;
        return StrUtil.hide(str,
                BigDecimal.valueOf(i - hide - ((i-hide) / 2)).setScale(0, RoundingMode.UP).intValue(),
                BigDecimal.valueOf(i - ((i-hide) / 2)).setScale(0, RoundingMode.UP).intValue());
    }
}
