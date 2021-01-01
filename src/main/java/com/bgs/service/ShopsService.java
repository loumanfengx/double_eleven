package com.bgs.service;

import com.bgs.pojo.Shops;

/**
 * @ClassName: ShopsService
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/7 12:14
 * @Version: v1.0
 */
public interface ShopsService {
    /**
     * 登录验证
     * @return
     */
    Shops checkShopsCode(String shopsCode);

    /**
     * 添加商户
     * @param shops
     * @return
     */
    int addShops(Shops shops);

    /**
     * 修改商户信息
     * @param shops
     * @return
     */
    int updateShopsInfo(Shops shops);

    /**
     * 修改密码
     * @param newPassword
     * @return
     */
    int updatePassword(String shopsCode, String newPassword);
}
