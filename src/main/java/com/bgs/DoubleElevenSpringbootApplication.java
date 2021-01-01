package com.bgs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@MapperScan(basePackages = "com.bgs.dao")
@SpringBootApplication
@ServletComponentScan
public class DoubleElevenSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(DoubleElevenSpringbootApplication.class, args);
    }

}
