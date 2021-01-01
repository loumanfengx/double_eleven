package com.bgs.pojo;


import java.math.BigDecimal;

public class BillProduct {

  private Integer id;
  private Integer pid;
  private Integer bid;
  private BigDecimal productCount;

  public BigDecimal getProductCount() {
    return productCount;
  }

  public void setProductCount(BigDecimal productCount) {
    this.productCount = productCount;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }


  public Integer getBid() {
    return bid;
  }

  public void setBid(Integer bid) {
    this.bid = bid;
  }

}
