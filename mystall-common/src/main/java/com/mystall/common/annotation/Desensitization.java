package com.mystall.common.annotation;

import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mystall.common.aspect.DesensitizationAspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author lfc
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@JacksonAnnotationsInside
@JsonSerialize(using = DesensitizationAspect.class)
public @interface Desensitization {

    SensitiveTypeEnum type() default SensitiveTypeEnum.AUTO;

    /**
     * 保留前缀长度
     */
    int preservePrefixSize() default 0;

    /**
     * 保留后缀长度
     */
    int preserveSuffixSize() default 0;

    /**
     * 替换值
     */
    String replaceChat() default "*";

    enum SensitiveTypeEnum
    {
        AUTO(0),
        CUSTOMIZATION(1),
        PHONE(2),
        NAME(3),
        ID_NUMBER(4),
        ;
        private final int value;

        SensitiveTypeEnum(int value)
        {
            this.value = value;
        }

        public int value()
        {
            return this.value;
        }
    }
}
