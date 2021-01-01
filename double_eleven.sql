/*
Navicat MySQL Data Transfer

Source Server         : 本机链接
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : double_eleven

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2021-01-01 17:09:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `orderId` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `isPayment` int(2) DEFAULT NULL COMMENT '是否付款（0：未付款；1：已付款）',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `totalPrice` decimal(11,2) DEFAULT NULL COMMENT '订单总价',
  `createTime` datetime DEFAULT NULL COMMENT '订单创建时间',
  `flag` int(2) DEFAULT NULL COMMENT '订单状态（0：订单失效 1：订单有效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', 'bill0001', '0', '1', '1200.01', '2020-11-01 22:42:10', '0');
INSERT INTO `bill` VALUES ('2', 'bill0002', '1', '2', '100.00', '2020-09-28 22:42:14', '0');
INSERT INTO `bill` VALUES ('3', 'bill0003', '0', '3', '200.00', '2020-09-13 22:42:20', '1');
INSERT INTO `bill` VALUES ('4', 'bill0004', '1', '4', '300.00', '2020-07-26 22:42:26', '1');
INSERT INTO `bill` VALUES ('5', 'bill0005', '0', '5', '400.00', '2020-05-04 22:42:33', '0');
INSERT INTO `bill` VALUES ('6', 'bill0006', '0', '6', '500.00', '2020-04-19 22:42:40', '1');
INSERT INTO `bill` VALUES ('7', 'bill0007', '1', '7', '666.00', '2020-11-01 18:31:13', '1');
INSERT INTO `bill` VALUES ('8', 'bill0008', '1', '8', '888.00', '2020-10-04 18:31:47', '1');
INSERT INTO `bill` VALUES ('9', 'bill0009', '1', '9', '6688.00', '2020-09-27 18:32:11', '1');
INSERT INTO `bill` VALUES ('10', 'bill0010', '1', '10', '799.00', '2020-09-06 18:32:59', '1');
INSERT INTO `bill` VALUES ('11', 'bill0011', '1', '6', '88.00', '2020-10-27 18:37:40', '1');

-- ----------------------------
-- Table structure for bill_product
-- ----------------------------
DROP TABLE IF EXISTS `bill_product`;
CREATE TABLE `bill_product` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` int(20) DEFAULT NULL COMMENT '商品id',
  `bid` int(20) DEFAULT NULL COMMENT '订单id',
  `productCount` decimal(10,0) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bill_product
-- ----------------------------
INSERT INTO `bill_product` VALUES ('1', '1', '1', '10');
INSERT INTO `bill_product` VALUES ('2', '2', '1', '2');
INSERT INTO `bill_product` VALUES ('3', '3', '1', '3');
INSERT INTO `bill_product` VALUES ('4', '4', '2', '6');
INSERT INTO `bill_product` VALUES ('5', '5', '2', '5');
INSERT INTO `bill_product` VALUES ('6', '1', '2', '4');
INSERT INTO `bill_product` VALUES ('7', '6', '3', '3');
INSERT INTO `bill_product` VALUES ('8', '2', '3', '2');
INSERT INTO `bill_product` VALUES ('9', '7', '4', '20');
INSERT INTO `bill_product` VALUES ('10', '8', '5', '11');
INSERT INTO `bill_product` VALUES ('11', '18', '6', '3');
INSERT INTO `bill_product` VALUES ('12', '6', '7', '4');
INSERT INTO `bill_product` VALUES ('13', '17', '8', '11');
INSERT INTO `bill_product` VALUES ('14', '4', '9', '6');
INSERT INTO `bill_product` VALUES ('15', '5', '10', '10');
INSERT INTO `bill_product` VALUES ('16', '8', '6', '3');
INSERT INTO `bill_product` VALUES ('17', '8', '11', '6');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '零食酒饮');
INSERT INTO `category` VALUES ('2', '优选蔬菜');
INSERT INTO `category` VALUES ('3', '超级U选');
INSERT INTO `category` VALUES ('4', '海鲜肉禽');
INSERT INTO `category` VALUES ('5', '乳饮果汁');
INSERT INTO `category` VALUES ('6', '居家优品');
INSERT INTO `category` VALUES ('7', '超值套餐');
INSERT INTO `category` VALUES ('8', '潮玩礼品');
INSERT INTO `category` VALUES ('9', '冷冻速食');
INSERT INTO `category` VALUES ('10', '海鲜冻品');
INSERT INTO `category` VALUES ('11', '粮油干货');
INSERT INTO `category` VALUES ('12', '环球美食');
INSERT INTO `category` VALUES ('13', '年货礼盒');
INSERT INTO `category` VALUES ('14', '热销爆款');
INSERT INTO `category` VALUES ('15', '缤纷水果');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `productCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `productName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `productPrice` decimal(20,2) DEFAULT NULL COMMENT '商品价格',
  `productUnit` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '商品单位',
  `category` int(10) DEFAULT NULL COMMENT '商品类型',
  `inventory` decimal(20,0) DEFAULT NULL COMMENT '商品库存',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品描述',
  `pic` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图片名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'pro0001', '娃哈哈', '3.00', '瓶', '1', '1014', '好喝', '1.jpg');
INSERT INTO `product` VALUES ('2', 'pro0002', '红牛', '5.00', '罐', '2', '2002', '喝完有劲', '2.jpg');
INSERT INTO `product` VALUES ('3', 'pro0003', '健力宝', '3.00', '瓶', '3', '3003', '醒脑', '34ED7A5C2E5242BDA7105A1C1390496D.jpg');
INSERT INTO `product` VALUES ('4', 'pro0004', '康师傅矿泉水', '1.00', '瓶', '2', '6006', '解渴', '387E247DC03A45C98D7AE8EC873C8669.jpg');
INSERT INTO `product` VALUES ('5', 'pro0005', '君乐宝酸奶', '5.00', '瓶', '3', '2005', '润肠', '3678358077A146ADB3F1526C6E3791F9.jpg');
INSERT INTO `product` VALUES ('6', 'pro0006', '银鹭八宝粥', '4.00', '罐', '4', '1000', '管饱', '20201216190208.jpg');
INSERT INTO `product` VALUES ('7', 'pro0007', '王老吉', '4.00', '瓶', '1', '1000', '怕上火喝王老吉', '2020121420000907033A7D59FC472A9D42B07BD4416E34.jpg');
INSERT INTO `product` VALUES ('8', 'pro0008', '橘子罐头', '10.00', '瓶', '15', '100', '爽口', 'D52CE761C5AD4CEAA6B53F0AD513589D.jpg');
INSERT INTO `product` VALUES ('17', 'pro0009', 'b ', '2.00', 'pin', '1', '2', '2', 'D52CE761C5AD4CEAA6B53F0AD513589D.jpg');
INSERT INTO `product` VALUES ('18', 'pro0010', '手动阀', '2.00', '个', '14', '111', '萨法', 'D52CE761C5AD4CEAA6B53F0AD513589D.jpg');
INSERT INTO `product` VALUES ('19', 'pro00011', '方便面', '1.00', '袋', '1', '20', '干吃面', 'D52CE761C5AD4CEAA6B53F0AD513589D.jpg');
INSERT INTO `product` VALUES ('20', 'pro0004', '奶茶', '5.00', '杯', '1', '100', '好喝', 'D52CE761C5AD4CEAA6B53F0AD513589D.jpg');

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键（商家id）',
  `shopsCode` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `shopsPassword` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '商家密码',
  `shopsName` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '商家名称',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商家电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', '1', '1', '哈哈哈', '13243184662');
INSERT INTO `shops` VALUES ('2', 'zhangsan', '111111', '你', '2');
INSERT INTO `shops` VALUES ('3', 'lisi', '1', '好', '2');
INSERT INTO `shops` VALUES ('4', 'liming', '666666', '啊', '2');
INSERT INTO `shops` VALUES ('5', '2', '1', '额', '2');

-- ----------------------------
-- Table structure for shops_product
-- ----------------------------
DROP TABLE IF EXISTS `shops_product`;
CREATE TABLE `shops_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sid` int(11) DEFAULT NULL COMMENT '商家id',
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shops_product
-- ----------------------------
INSERT INTO `shops_product` VALUES ('1', '1', '1');
INSERT INTO `shops_product` VALUES ('2', '1', '2');
INSERT INTO `shops_product` VALUES ('3', '1', '3');
INSERT INTO `shops_product` VALUES ('4', '2', '4');
INSERT INTO `shops_product` VALUES ('6', '1', '11');
INSERT INTO `shops_product` VALUES ('7', '1', '5');
INSERT INTO `shops_product` VALUES ('8', '5', '6');
INSERT INTO `shops_product` VALUES ('9', '3', '5');
INSERT INTO `shops_product` VALUES ('10', '4', '2');
INSERT INTO `shops_product` VALUES ('12', '5', '18');
INSERT INTO `shops_product` VALUES ('13', '1', '19');
INSERT INTO `shops_product` VALUES ('14', '1', '20');
INSERT INTO `shops_product` VALUES ('15', '1', '21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `userName` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `userPassword` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `gender` int(10) DEFAULT NULL COMMENT '性别（1:女、 2:男）',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `address` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lilei', 'lilei', '123456', '1', '1983-10-10', '13688889999', '北京市海淀区成府路207号');
INSERT INTO `user` VALUES ('2', 'liming', '李明', '0000000', '2', '1983-12-10', '13688884457', '北京市东城区前门东大街9号');
INSERT INTO `user` VALUES ('3', 'hanlubiao', '韩路彪', '0000000', '2', '1984-06-05', '18567542321', '北京市朝阳区北辰中心12号');
INSERT INTO `user` VALUES ('4', 'zhanghua', ' 张华', '0000000', '1', '1983-06-15', '13544561111', ' 北京市海淀区学院路61号');
INSERT INTO `user` VALUES ('5', 'wangyang', '王洋', '0000000', '2', '1982-12-31', '13444561124', '北京市海淀区西二旗辉煌国际16层');
INSERT INTO `user` VALUES ('6', 'zhaoyan', '赵燕', '0000000', '1', '1986-03-07', '18098764545', '北京市海淀区回龙观小区10号楼');
INSERT INTO `user` VALUES ('7', 'sunlei', '孙磊', '0000000', '2', '1981-01-04', '13387676765', '北京市朝阳区管庄新月小区12楼');
INSERT INTO `user` VALUES ('8', 'sunxing', '孙兴', '0000000', '2', '1978-03-12', '13367890900', '北京市朝阳区建国门南大街10号');
INSERT INTO `user` VALUES ('9', 'zhangchen', '张晨', '0000000', '1', '1986-03-28', '18098765434', '朝阳区管庄路口北柏林爱乐三期13号楼');
INSERT INTO `user` VALUES ('10', 'dengchao', '邓超', '0000000', '2', '1981-11-04', '13689674534', '北京市海淀区北航家属院10号楼');
