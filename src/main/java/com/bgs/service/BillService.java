package com.bgs.service;

import com.bgs.pojo.Bill;
import com.bgs.pojo.PageBean;
import com.bgs.pojo.Product;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @ClassName: BillService
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/9 18:49
 * @Version: v1.0
 */
public interface BillService {
    /**
     * 查询商户订单列表及分页
     * @param userName
     * @param isPayment
     * @param sid
     * @return
     */
    PageInfo<Bill> findAll(PageBean pageBean,String userName, Integer isPayment, Integer sid, String startTime, String endTime, Integer flag, String province, String city, String district);

    /**
     * 查看订单详细信息
     * @param bid
     * @return
     */
    List<Product> findBillInfo(Integer bid);

    /**
     * 删除订单（逻辑删除）
     * @param ids
     * @return
     */
    int delBill(Integer[] ids);
}
