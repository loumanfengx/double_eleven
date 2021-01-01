package com.bgs.service.impl;

import com.bgs.dao.BillMapper;
import com.bgs.pojo.Bill;
import com.bgs.pojo.PageBean;
import com.bgs.pojo.Product;
import com.bgs.service.BillService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName: BillServiceImpl
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/9 18:49
 * @Version: v1.0
 */

@Service
public class BillServiceImpl implements BillService {

    @Autowired
    private BillMapper billMapper;

    /**
     * 删除订单（逻辑删除）
     *
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public int delBill(Integer[] ids) {
        int i = 0;
        i = billMapper.delBill(ids);
        for (int i1 = 0; i1 < ids.length; i1++) {
            //根据订单id返回购买商品列表
            List<Product> productList = billMapper.findBillInfo(ids[i1]);
            //获取订单中每个商品的数量，以及商品的库存量，取两者之和更新到商品表中inventory字段
            for (int i2 = 0; i2 < productList.size(); i2++) {
                billMapper.restoreInventory(productList.get(i2).getId(), productList.get(i2).getInventory().add(productList.get(i2).getProductCount()));
            }
        }

        return i;
    }

    /**
     * 查看订单详细信息
     *
     * @param bid
     * @return
     */
    @Override
    public List<Product> findBillInfo(Integer bid) {
        List<Product> productList = billMapper.findBillInfo(bid);
        return productList;
    }

    /**
     * 查询商户订单列表及分页
     * @param userName
     * @param isPayment
     * @param sid
     * @return
     */
    @Override
    public PageInfo<Bill> findAll(PageBean pageBean,String userName, Integer isPayment, Integer sid, String startTime, String endTime, Integer flag, String province, String city, String district) {
        PageHelper.startPage(pageBean.getFromPage(), pageBean.getPageLimit());
        //调用查询列表方法
        List<Bill> billList = billMapper.findAll(userName, isPayment, sid, startTime, endTime, flag, province, city, district);
        PageInfo<Bill> billPageInfo = new PageInfo<>(billList);
        return billPageInfo;
    }
}
