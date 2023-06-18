package com.mystall;

import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@MapperScan(basePackages = {"com.mystall.*.mapper"})
@ServletComponentScan// 注意要加上@ServletComponentScan注解，否则Servlet无法生效
public class WebApplication {

    public static void main(String[] args) {
        try {
            LogFactory.useCustomLogging(StdOutImpl.class);
            SpringApplication.run(WebApplication.class, args);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
