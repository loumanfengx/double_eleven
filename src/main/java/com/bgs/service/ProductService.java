package com.bgs.service;

import com.bgs.pojo.Category;
import com.bgs.pojo.PageBean;
import com.bgs.pojo.Product;
import com.bgs.pojo.Shops;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @ClassName: ProductService
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/5 14:58
 * @Version: v1.0
 */
public interface ProductService {
    /**
     * 添加商品
     * @param product
     * @return
     */
    int addProduct(Product product, Integer sid, Integer category);

    /**
     * 查询商户商品列表及分页
     * @param productName
     * @param category
     * @param sid
     * @param productCode
     * @return
     */
    PageInfo<Product> findAll(PageBean pageBean, String productName, String category, Integer sid, String productCode);

    /**
     * 查询单条数据详细信息
     * @param id
     * @return
     */
    Product findProductInfo(Integer id);

    /**
     * 获取添加信息前的商家id和名称
     * @return
     */
    List<Shops> findShopsAll();

    /**
     * 获取商品类别表
     * @return
     */
    List<Category> findCategoryAll();

    /**
     * 批量删除数据
     * @param ids
     * @return
     */
    int delProduct(Integer[] ids,String pics,String uploadFolder);

    /**
     * 修改商品信息
     * @param product
     * @return
     */
    int updateProduct(Product product, Integer category);
}
