package com.bgs.controller;

import com.bgs.pojo.Category;
import com.bgs.pojo.PageBean;
import com.bgs.pojo.Product;
import com.bgs.pojo.Shops;
import com.bgs.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @ClassName: ProductController
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/5 14:57
 * @Version: v1.0
 */
@Controller
@Configuration
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Value("${file.uploadFolder}")
    private String uploadFolder;
    /**
     * 修改商品信息
     *
     * @param product
     * @return
     */
    @RequestMapping(value = "/updateProduct")
    @ResponseBody
    public Map<String, String> updateProduct(Product product, Integer category) {
        int i = productService.updateProduct(product, category);
        String msg = "0";
        if (i >= 1) {
            msg = "1";
        }
        Map<String, String> map = new HashMap<>();
        map.put("success", msg);
        return map;
    }

    /**
     * 获取修改前的初始信息
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/updateProductInit")
    public String updateProductInit(Integer id, Model model) {
        Product product = productService.findProductInfo(id);
        List<Shops> shopsList = productService.findShopsAll();
        List<Category> categoryList = productService.findCategoryAll();
        model.addAttribute("shops", shopsList);
        model.addAttribute("cates", categoryList);
        model.addAttribute("product", product);
        return "product/productupdate";
    }

    /**
     * 批量删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/delProduct")
    @ResponseBody
    public Map<String, String> delProduct(Integer[] ids,String pics) {
        //String[] idsStr = ids.split(",");
        int i = productService.delProduct(ids,pics,uploadFolder);
        String msg = "0";
        if (i >= 1) {
            msg = "1";
        }
        Map<String, String> map = new HashMap<>();
        map.put("success", msg);
        return map;
    }

    /**
     * 添加商品
     *
     * @param product
     * @return
     */
    @RequestMapping("/addProduct")
    @ResponseBody
    public Map<String, String> addProduct(Product product, HttpSession session, Integer category, HttpServletRequest request) {
        Shops shops = (Shops) session.getAttribute("session");
        Integer sid = shops.getId();
        String msg = "0";
        int i = productService.addProduct(product, sid, category);
        if (i == 1) {
            msg = "1";
        }
        Map<String, String> map = new HashMap<>();
        map.put("success", msg);
        return map;
    }

    /**
     * 获取添加信息前的商户id和商户名称和商品类别
     *
     * @return
     */
    @RequestMapping("/addProductInit")
    public String addProductInit(Model model) {
        List<Shops> shopsList = productService.findShopsAll();
        List<Category> categoryList = productService.findCategoryAll();
        System.out.println("aaaaaaaaaaaaaaaaa");
        model.addAttribute("shops", shopsList);
        model.addAttribute("cates", categoryList);
        return "product/productadd";
    }

    /**
     * 查询商户商品列表及分页
     *
     * @param limit
     * @return
     */
    @RequestMapping("/findAll")
    @ResponseBody
    public Map<String, Object> findAll(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit, @Param("productName") String productName, @Param("category") String category, @Param("productCode") String productCode, HttpSession session) {
        Shops shops = (Shops) session.getAttribute("session");
        Integer sid = shops.getId();
        PageBean pageBean = new PageBean();
        pageBean.setFromPage(page);
        pageBean.setPageLimit(limit);
        PageInfo<Product> pageInfo = productService.findAll(pageBean, productName, category, sid, productCode);
        Map<String, Object> map = new HashMap<>();
        if (productCode != null && productCode != "") {
            if (pageInfo.getList().size() != 0) {
                map.put("msg", "1");
            }
            return map;
        }
        map.put("product", pageInfo);
        map.put("status", 0);
        map.put("message", "");
        return map;
    }

    /**
     * 查询单条数据详细信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/findProductInfo")
    public String findProductInfo(Integer id, Model model) {
        Product product = productService.findProductInfo(id);
        model.addAttribute("product", product);
        return "product/productview";
    }
}

