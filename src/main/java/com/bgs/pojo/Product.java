package com.bgs.pojo;


import java.math.BigDecimal;

public class Product {

  private Integer id;
  private String productCode;
  private String productName;
  private double productPrice;
  private String productUnit;
  private Integer category;
  private BigDecimal inventory;
  private String description;
  private Category categorys;
  private BigDecimal productCount;
  private String pic;

  public String getPic() {
    return pic;
  }

  public void setPic(String pic) {
    this.pic = pic;
  }

  public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public BigDecimal getProductCount() {
    return productCount;
  }

  public void setProductCount(BigDecimal productCount) {
    this.productCount = productCount;
  }

  public Category getCategorys() {
    return categorys;
  }

  public void setCategorys(Category categorys) {
    this.categorys = categorys;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }


  public double getProductPrice() {
    return productPrice;
  }

  public void setProductPrice(double productPrice) {
    this.productPrice = productPrice;
  }


  public String getProductUnit() {
    return productUnit;
  }

  public void setProductUnit(String productUnit) {
    this.productUnit = productUnit;
  }


  public Integer getCategory() {
    return category;
  }

  public void setCategory(Integer category) {
    this.category = category;
  }


  public BigDecimal getInventory() {
    return inventory;
  }

  public void setInventory(BigDecimal inventory) {
    this.inventory = inventory;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
