package com.bgs.service.impl;

import com.bgs.dao.ShopsMapper;
import com.bgs.pojo.Shops;
import com.bgs.service.ShopsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName: ShopsServiceImpl
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/7 12:14
 * @Version: v1.0
 */
@Service
public class ShopsServiceImpl implements ShopsService {
    @Autowired
    private ShopsMapper shopsMapper;

    /**
     * 修改商户密码
     * @param newPassword
     * @return
     */
    @Override
    public int updatePassword(String shopsCode,String newPassword) {
        int i = shopsMapper.updatePassword(newPassword,shopsCode);
        return i;
    }

    /**
     * 修改商户信息
     * @param shops
     * @return
     */
    @Override
    public int updateShopsInfo(Shops shops) {
        int i = shopsMapper.updateShopsInfo(shops);
        return i;
    }

    /**
     * 添加商户
     * @param shops
     * @return
     */
    @Override
    public int addShops(Shops shops) {
        int i = shopsMapper.addShops(shops);
        return i;
    }

    /**
     * 登录验证
     * @return
     */
    @Override
    public Shops checkShopsCode(String shopsCode) {
        Shops shops = shopsMapper.checkShopsCode(shopsCode);
        return shops;
    }
}
