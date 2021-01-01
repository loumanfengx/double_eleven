package com.bgs.dao;

import com.bgs.pojo.Shops;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: ShopsDao
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/7 12:14
 * @Version: v1.0
 */
public interface ShopsMapper {
    /**
     * 登录验证
     * @return
     */
    Shops checkShopsCode(@Param("shopsCode") String shopsCode);

    /**
     * 添加商户
     * @param shops
     * @return
     */
    int addShops(@Param("shops") Shops shops);

    /**
     * 修改商户信息
     * @param shops
     * @return
     */
    int updateShopsInfo(@Param("shops") Shops shops);

    /**
     * 修改商户密码
     * @param newPassword
     * @return
     */
    int updatePassword(@Param("shopsCode") String shopsCode, @Param("newPassword") String newPassword);
}
