package com.bgs.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;

/**
 * @ClassName: StringTest
 * @Description: 删除文件
 * @Author: Kang Jianhang
 * @Date: 2020/11/10 18:24
 * @Version: v1.0
 */
@Controller
@Configuration
@RequestMapping("/product")
public class FileDelete {
   @Value("${file.uploadFolder}")
    private String uploadFolder;

    @RequestMapping("/deleteFile")
    public void deleteFile(String pics) {
        String[] picArr = pics.split(",");
        for (int i = 0; i < picArr.length; i++) {
            String filePath = uploadFolder + picArr[i];
            File file = new File(filePath);
            if (file.exists()) {
                file.delete();
            }
        }

    }

}
