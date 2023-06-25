package com.mystall.common.utils;

import cn.hutool.core.lang.Snowflake;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class IdUtils {
    private static Snowflake snowflake;

    /**
     * 描述: IdGenerateConfig中创建这个方法，其他地方请勿使用
     * @program:[snowflake]
     */
    public IdUtils(Snowflake snowflake) {
        IdUtils.snowflake = snowflake;
    }

    /**
     * 描述: 快速创建id   用于主键生成
     * @program:[]
     */
    public static Long getFastId() {
        return snowflake.nextId();
    }

    public static String getFastIdStr() {
        return String.valueOf(snowflake.nextId());
    }

    public static Long getId() {
        //解决同一笔订单票号连续问题
        try {
            Thread.sleep(1);
        } catch (InterruptedException e) {
            log.info("系统异常", e);
        }
        checkApplicationContext();
        return snowflake.nextId();
    }

    public static String getId(String key) {
        try {
            Thread.sleep(1);
        } catch (InterruptedException e) {
            log.info("系统异常", e);
        }
        checkApplicationContext();
        return key + snowflake.nextId();
    }

    private static void checkApplicationContext() {
        if (snowflake == null) {
            throw new IllegalStateException("snowflake未注入");
        }
    }
}
