package com.bgs.dao;

import com.bgs.pojo.Bill;
import com.bgs.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName: BillDao
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/9 18:48
 * @Version: v1.0
 */
public interface BillMapper {
    /**
     * 查询商户订单列表及分页
     * @param userName
     * @param isPayment
     * @param sid
     * @return
     */
    List<Bill> findAll(@Param("userName") String userName, @Param("isPayment") Integer isPayment, @Param("sid") Integer sid, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("flag") Integer flag,
                       @Param("province") String province, @Param("city") String city, @Param("district") String district);


    /**
     * 查看订单详细信息
     * @param bid
     * @return
     */
    List<Product> findBillInfo(@Param("bid") Integer bid);

    /**
     * 删除订单（逻辑删除）
     * @param ids
     * @return
     */
    int delBill(@Param("ids") Integer[] ids);

    /**
     * 删除订单时恢复商品库存
     * @param id
     * @param restoreInventory
     */
    void restoreInventory(@Param("id") Integer id, @Param("restoreInventory") BigDecimal restoreInventory);
}
