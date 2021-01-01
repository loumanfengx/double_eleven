
package com.bgs.controller;

import com.bgs.pojo.Bill;
import com.bgs.pojo.PageBean;
import com.bgs.pojo.Product;
import com.bgs.pojo.Shops;
import com.bgs.service.BillService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @ClassName: BillController
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/9 18:40
 * @Version: v1.0
 */

@Controller
@RequestMapping("/bill")
public class BillController {
    @Autowired
    private BillService billService;

    /**
     * 删除订单（逻辑删除）
     * @param ids
     * @return
     */
    @RequestMapping("/delBill")
    @ResponseBody
    public Map<String, String> delBill(Integer[]  ids) {

        int i = billService.delBill(ids);
        String msg = "0";
        if (i >= 1) {
            msg = "1";
        }
        Map<String, String> map = new HashMap<>();
        map.put("success", msg);
        return map;
    }

    /**
     * 查看订单详情
     * @param bid
     * @param model
     * @return
     */
    @RequestMapping("/findBillInfo")
    public String findBillInfo(Integer bid, Model model) {
        List<Product> productList = billService.findBillInfo(bid);
        System.out.println("===============");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaa");
        model.addAttribute("product", productList);
        return "bill/billview";
    }

/**
     * 查询商户订单列表及分页
     *
     * @param limit
     * @return
     */

    @RequestMapping("/findAll")
    @ResponseBody
    public Map<String, Object> findAll(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "8") Integer limit, String userName, Integer isPayment, String startTime, String endTime, Integer flag,
                                       String province, String city, String district, HttpSession session) {
        Shops shops = (Shops) session.getAttribute("session");
        Integer sid = shops.getId();
        PageBean pageBean = new PageBean();
        pageBean.setFromPage(page);
        pageBean.setPageLimit(limit);
        PageInfo<Bill> billPageInfo = billService.findAll(pageBean,userName,isPayment, sid,startTime,endTime,flag,province,city,district);
        Map<String, Object> map = new HashMap<>();
        map.put("bill", billPageInfo);
        map.put("status", 0);
        map.put("message", "");
        return map;
    }


}
