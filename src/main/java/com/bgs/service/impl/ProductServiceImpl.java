package com.bgs.service.impl;

import com.bgs.dao.ProductMapper;
import com.bgs.pojo.Category;
import com.bgs.pojo.PageBean;
import com.bgs.pojo.Product;
import com.bgs.pojo.Shops;
import com.bgs.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

/**
 * @ClassName: ProductServiceImpl
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/5 14:58
 * @Version: v1.0
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    /**
     * 修改商品信息
     *
     * @param product
     * @return
     */
    @Override
    public int updateProduct(Product product, Integer category) {
        int i = productMapper.updateProduct(product, category);
        return i;
    }

    /**
     * 批量删除数据以及本地文件
     *
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public int delProduct(Integer[] ids,String pics,String uploadFolder) {
        String[] picArr = pics.split(",");
        for (int i = 0; i < picArr.length; i++) {
            String filePath = uploadFolder + picArr[i].substring(picArr[i].lastIndexOf("/"));
            File file = new File(filePath);
            if (file.exists()) {
                file.delete();
            }
        }
        int i = productMapper.delProduct(ids);
        productMapper.delShopsMiddleProduct(ids);
        return i;
    }

    /**
     * 获取商品类别表
     *
     * @return
     */
    @Override
    public List<Category> findCategoryAll() {
        List<Category> categoryList = productMapper.findCategoryAll();
        return categoryList;
    }

    /**
     * 获取添加信息前的商家id和名称
     *
     * @return
     */
    @Override
    public List<Shops> findShopsAll() {
        List<Shops> shopsList = productMapper.findShopsAll();
        return shopsList;
    }

    /**
     * 添加商品
     *
     * @param product
     * @return
     */
    @Transactional
    @Override
    public int addProduct(Product product, Integer sid, Integer category) {
        product.setCategory(category);
        int i = 0;
        i = productMapper.addProduct(product);
        //获取添加后的自增主键值
        int pid = product.getId();
        //向商家商品中间表添加 商品添加成功后的商品主键id
        productMapper.addShopsProduct(sid, pid);

        return i;
    }

    /**
     * 查询单条数据详细信息
     *
     * @param id
     * @return
     */
    @Override
    public Product findProductInfo(Integer id) {
        Product product = productMapper.findProductInfo(id);
        return product;
    }

    /**
     * 查询商户商品列表及分页
     *
     * @return
     */
    @Override
    public PageInfo<Product> findAll(PageBean pageBean,String productName, String category, Integer sid, String productCode) {
        PageHelper.startPage(pageBean.getFromPage(), pageBean.getPageLimit());
        //调用查询列表方法
        List<Product> productList = productMapper.findAll(productName, category, sid, productCode);
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        return pageInfo;
    }

}
