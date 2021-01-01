/*
package com.bgs;

import com.bgs.dao.RedisMapper;
import com.bgs.pojo.Product;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.assertj.core.internal.Classes;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
//由于是Web项目，Junit需要模拟ServletContext，因此我们需要给我们的测试类加上@WebAppConfiguration。
class DoubleElevenSpringbootApplicationTests {
    //依赖注入
    @Autowired
    private RedisMapper redisMapper;
    @Autowired
    private RedisTemplate<String,String> redisTemplate;
    @Test
    void contextLoads() throws JsonProcessingException {
        System.out.println(redisMapper);
        //从reids缓存中获得指定的数据                       (products.findAll 为键名可以随意设置)
        String productStr = redisTemplate.boundValueOps("products.findAll").get();
        //如果redis中没有数据的话
        if (productStr == null) {
            //查询数据库获得数据
            List<Product> productList = redisMapper.findAll();
            //转换为json格式的字符串
            ObjectMapper json = new ObjectMapper();
            productStr = json.writeValueAsString(productList);
            //将数据库存储到redis中，下次再查询直接从redis中获得数据，不用再查询数据库
            redisTemplate.boundValueOps("products.findAll").set(productStr);
            System.out.println("===============从数据库获得数据===============");
        }else{
            System.out.println("===============从redis缓存中获得数据===============");
        }
        //打印product列表数据
        System.out.println(productStr);
    }

}
*/
