package com.bgs;

import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;

/**
 * @author KangJianhang
 * @version 1.0
 * @date 2020/12/29 18:38
 */
public class CollectionTest {
    public static void main(String[] args) {
        TreeSet<String> treeSet = new TreeSet<String>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                int i1 = o1.length() - o2.length();
                int i2 = o1.compareTo(o2);
                return i1 == 0 ? i2:i1;
            }
        });
        treeSet.add("ab");
        treeSet.add("bhjfdgfdgdf");
        treeSet.add("ckkjl");
        treeSet.add("dghjghj");
        for (String s : treeSet) {
            System.out.println(s);
        }
    }
    @Test
    public void Test01() {


    }
}
