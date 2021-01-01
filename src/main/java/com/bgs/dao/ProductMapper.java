package com.bgs.dao;

import com.bgs.pojo.Category;
import com.bgs.pojo.Product;
import com.bgs.pojo.Shops;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName: ProductDao
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/5 14:59
 * @Version: v1.0
 */
public interface ProductMapper {
    /**
     * 查询用户商品列表
     * @param productName
     * @param category
     * @param sid
     * @param productCode
     * @return
     */
    List<Product> findAll(@Param("productName") String productName, @Param("category") String category, @Param("sid") Integer sid, @Param("productCode") String productCode);


    /**
     * 查询单条数据详细信息
     * @param id
     * @return
     */
    Product findProductInfo(@Param("id") Integer id);

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
     * 向商家商品中间表添加 商品添加成功后的商品主键id
     */
    void addShopsProduct(@Param("sid") Integer sid, @Param("pid") int pid);
    /**
     * 添加商品
     * @param product
     * @return
     */
    int addProduct(Product product);

    /**
     * 批量删除数据商品表数据
     * @param ids
     * @return
     */
    int delProduct(Integer[] ids);
    /**
     *
     * @param ids
     */
    /**
     * 批量删除商家商品中间表数据
     * @param pids
     */
    void delShopsMiddleProduct(@Param("pids") Integer[] pids);
    /**
     * 修改商品信息
     * @param product
     * @return
     */
    int updateProduct(@Param("product") Product product, @Param("category") Integer category);


}
