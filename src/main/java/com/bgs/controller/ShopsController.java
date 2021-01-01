package com.bgs.controller;

import com.bgs.pojo.Shops;
import com.bgs.service.ShopsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @ClassName: ShopsController
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/7 12:13
 * @Version: v1.0
 */
@Controller
@RequestMapping(value = "/shops",method = RequestMethod.POST)
public class ShopsController {
    @Autowired
    private ShopsService shopsService;



    /**
     * 退出登录
     * @param session
     * @returno
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String loginOut(HttpSession session) {
        //清空登录数据
        session.removeAttribute("session");
        return "login";

    }
    /**
     * 登录验证
     * @param shopsCode
     * @param shopsPassword
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(String shopsCode, String shopsPassword, Model model, HttpSession session) {
        Shops shops = shopsService.checkShopsCode(shopsCode);
        if (shops == null ) {//验证账号是否存在
            model.addAttribute("msg", "账号不存在");
            return "login";
        } else if (!shopsPassword.equals(shops.getShopsPassword())) {//验证密码是否正确
            model.addAttribute("msg", "密码不正确");
            model.addAttribute("shopsCode", shopsCode);
            return "login";
        }
        session.setAttribute("session",shops);
        return "welcome";
    }

    /**
     * 注册商户时验证商户编码是否已存在
     */
    @RequestMapping("/s/checkShopsCode")
    @ResponseBody
    public String checkShopsCode(String shopsCode) {
        Shops shops = shopsService.checkShopsCode(shopsCode);
        String msg = "1";
        if (shops.getShopsCode() == null) {
            msg = "0";
            return msg;
        }
        return msg;
    }

    /**
     * 添加商户
     * @param shops
     * @return
     */
    @RequestMapping("/s/addShops")
    public String addShops(Shops shops) {
        String ranStr = "abcdefghigklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        String shopsName = "";
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            int index = random.nextInt(ranStr.length());
            char c = ranStr.charAt(index);
            shopsName += c;
        }
        shops.setShopsName(shopsName);
        int i = shopsService.addShops(shops);
        return "login";
    }

    /**
     * 修改商户信息
     * @param shops
     * @param session
     * @return
     */
    @RequestMapping("/s/editShopsInfo")
    @ResponseBody
    public Map<String, String> editShopsInfo(Shops shops,HttpSession session) {
        int i = shopsService.updateShopsInfo(shops);
        String msg = "0";
        if (i == 1) {
            Shops shopsAlteration = shopsService.checkShopsCode(shops.getShopsCode());
            session.setAttribute("session",shopsAlteration);
            msg = "1";
        }
        Map<String, String> map = new HashMap<>();
        map.put("success", msg);
        return map;
    }

    /**
     * 修改商户密码时验证旧密码是否输入正确
     * @param shopsCode
     * @param shopsPassword
     * @return
     */
    @RequestMapping("/s/checkShopsPassword")
    @ResponseBody
    public String checkShopsPassword(String shopsCode,String shopsPassword) {
        Shops shops = shopsService.checkShopsCode(shopsCode);
        String msg = "1";
        if (!shopsPassword.equals(shops.getShopsPassword())) {
            msg = "0";
        }
        return msg;
    }

    /**
     * 修改登录密码
     * @param shopsCode
     * @param newPassword
     * @return
     */
    @RequestMapping("/s/editShopsPassword")
    @ResponseBody
    public Map<String, String> editShopsPassword(String shopsCode, String newPassword) {
        int i = shopsService.updatePassword(newPassword,shopsCode);
        String msg = "0";
        if (i == 1) {
            msg = "1";
        }
        Map<String, String> map = new HashMap<>();
        map.put("success", msg);
        return map;
    }
}
