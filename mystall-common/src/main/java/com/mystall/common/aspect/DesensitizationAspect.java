package com.mystall.common.aspect;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.mystall.common.annotation.Desensitization;
import com.mystall.common.utils.DesensitizationUtils;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Objects;

/**
 * 脱敏处理
 * @author fc
 */
@Aspect
@Component
@NoArgsConstructor
@AllArgsConstructor
public class DesensitizationAspect extends JsonSerializer<String> implements ContextualSerializer {

    private Desensitization.SensitiveTypeEnum type;

    /**
     * 保留前缀长度
     */
    private int preservePrefixSize;

    /**
     * 保留后缀长度
     */
    private int preserveSuffixSize;

    /**
     * 替换值
     */
    private String replaceChat;

    @Override
    public void serialize(String oldStr, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        String desValue = null;
        switch (type) {
            case PHONE:
                desValue = DesensitizationUtils.desPhone(oldStr,replaceChat);
                break;
            case NAME:
                desValue = DesensitizationUtils.desName(oldStr,replaceChat);
                break;
            case ID_NUMBER:
                desValue = DesensitizationUtils.desIdNum(oldStr,replaceChat);
                break;
            case CUSTOMIZATION:
                desValue = DesensitizationUtils.desValue(oldStr, preservePrefixSize, preserveSuffixSize, replaceChat);
                break;
            case AUTO:
            default:
                desValue = DesensitizationUtils.autoCountingStar(oldStr);
        }
        // 通过此方法覆盖原有值
        jsonGenerator.writeString(desValue);
    }

    @Override
    public JsonSerializer<?> createContextual(SerializerProvider serializerProvider, BeanProperty beanProperty) throws JsonMappingException {
        if (beanProperty != null) {
            // 判断数据类型
            if (Objects.equals(beanProperty.getType().getRawClass(), String.class)) {
                // 获取注解信息
                Desensitization annotation = beanProperty.getAnnotation(Desensitization.class);
                if (annotation == null) {
                    annotation = beanProperty.getContextAnnotation(Desensitization.class);
                }
                if (annotation != null) {
                    return new DesensitizationAspect(annotation.type(), annotation.preservePrefixSize(),
                            annotation.preserveSuffixSize(), annotation.replaceChat());
                }
            }
            return serializerProvider.findValueSerializer(beanProperty.getType(), beanProperty);
        }
        return serializerProvider.findNullValueSerializer(null);
    }
}
