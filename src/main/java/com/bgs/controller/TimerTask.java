package com.bgs.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.testng.annotations.Test;

/**
 * @ClassName: TimerTask
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/24 19:00
 * @Version: v1.0
 */
@Controller

public class TimerTask {
    @Test
    @Scheduled(cron = "0/5 * * * * ?")
    public String test01() {
        return "product/productadd";
    }
}
