package com.bgs.controller;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;

/**
 * @ClassName: Test01
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/12/14 19:43
 * @Version: v1.0
 */
public class Test01 {
    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String format = sdf.format(new Date());
        System.out.println(format);
        List<Object> list = new ArrayList();

        list.add("aaa");
        list.add("bbb");
        list.add("ccc");
        list.add("ddd");
        //列表迭代器逆向输出
        ListIterator<Object> listIterator = list.listIterator();
        for (listIterator = list.listIterator(); listIterator.hasNext(); ) {
            listIterator.next();
        }
        for (; listIterator.hasPrevious(); ) {
            System.out.println(listIterator.previous());
        }
        int a = 47/33;
        System.out.println(a);
    }
}
