package com.bgs.dao;

import com.bgs.pojo.Product;

import java.util.List;

/**
 * @ClassName: RedisMapper
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/12/2 14:06
 * @Version: v1.0
 */
public interface RedisMapper {
    List<Product> findAll();
}
