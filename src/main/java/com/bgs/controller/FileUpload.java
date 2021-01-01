package com.bgs.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @ClassName: Test
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/10 19:18
 * @Version: v1.0
 */
@Controller
@Configuration
public class FileUpload {
    @Value("${file.uploadFolder}")
    private String uploadFolder;

    @RequestMapping("/test")
    @ResponseBody
    public Map<String, String> test(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = "";
        if (file.getSize() != 0) {
            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
            String prefix = UUID.randomUUID().toString().replace("-", "").toUpperCase();
            //获取上传文件时间（时间显示为：年月日时分秒）
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            String timeStr = sdf.format(new Date());
            fileName =timeStr+ prefix + suffix;
            System.out.println(request.getSession().getServletContext().getRealPath("img"));
            file.transferTo(new File(uploadFolder + fileName));
        }
        Map<String, String> map = new HashMap<>();
        map.put("code", "0");
        map.put("fileName", request.getContextPath() + "/fileImg/" + fileName);
        return map;
    }
}
