package com.bgs.pojo;

/**
 * @ClassName: Page
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/7/28 10:50
 * @Version: v1.0
 */
public class PageBean {
    private Integer fromPage;//起始页
    private Integer pageLimit;//每页的数据量

    public Integer getFromPage() {
        return fromPage;
    }

    public void setFromPage(Integer fromPage) {
        this.fromPage = fromPage;
    }

    public Integer getPageLimit() {
        return pageLimit;
    }

    public void setPageLimit(Integer pageLimit) {
        this.pageLimit = pageLimit;
    }
}
