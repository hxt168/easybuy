/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : easybuy

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-09-13 17:26:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `easybuy_comment`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_comment`;
CREATE TABLE `easybuy_comment` (
  `ecId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ecReply` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '回复',
  `ecContent` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `ecCreateTime` datetime NOT NULL COMMENT '创建时间',
  `ecReplyTime` datetime DEFAULT NULL COMMENT '回复时间',
  `ecNickName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '留言用户昵称',
  PRIMARY KEY (`ecId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_comment
-- ----------------------------
INSERT INTO `easybuy_comment` VALUES ('1', '1', '老板在不。', '2013-09-02 12:47:02', '2013-09-02 12:47:19', '小张');
INSERT INTO `easybuy_comment` VALUES ('2', '0', '你们店有什么优惠么？', '2013-09-02 19:48:42', '0000-00-00 00:00:00', '');
INSERT INTO `easybuy_comment` VALUES ('3', '0', '我已经申请退款了。', '2013-09-02 19:49:42', '0000-00-00 00:00:00', '');
INSERT INTO `easybuy_comment` VALUES ('4', '', '这个宝贝免邮么？', '2013-09-13 15:34:12', null, null);

-- ----------------------------
-- Table structure for `easybuy_news`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_news`;
CREATE TABLE `easybuy_news` (
  `enId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `enTitle` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `enContent` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `enCreateTime` datetime NOT NULL COMMENT '录入日期',
  PRIMARY KEY (`enId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_news
-- ----------------------------
INSERT INTO `easybuy_news` VALUES ('1', '美邦大减价', '全场白送，买10件送一个导购员', '2013-09-01 18:49:43');
INSERT INTO `easybuy_news` VALUES ('2', 'iphone 4S直降300！', '原价5500的iphone 4S现在只要5200，对！你没有看错', '2013-08-12 18:51:36');
INSERT INTO `easybuy_news` VALUES ('3', 'iphone 5S新款上市', '全国首家iphone 5S发售，价格不菲！', '2013-08-31 18:57:24');
INSERT INTO `easybuy_news` VALUES ('4', '友臣金丝肉松饼干', '福建特产零食品 友臣金丝肉松饼干60个整箱中秋月饼 一箱多省包邮', '2013-09-04 17:20:54');
INSERT INTO `easybuy_news` VALUES ('5', '三星I9300现在只要2700', '三星I9300', '2013-09-17 10:20:52');
INSERT INTO `easybuy_news` VALUES ('6', '蔡林记热干面 武汉热干面', '13省2袋包邮 湖北特产食品 蔡林记热干面 武汉热干面 泡面 方便面 ', '2013-09-06 10:53:18');
INSERT INTO `easybuy_news` VALUES ('7', '草安堂薰衣草舒爽去屑洗发露', '草安堂薰衣草舒爽去屑洗发露750ml 正品男女士止痒控油去油洗发水\r\n洗发水+沐浴露 仅36元 请拍套餐', '2013-09-06 10:56:14');

-- ----------------------------
-- Table structure for `easybuy_order`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order`;
CREATE TABLE `easybuy_order` (
  `eoId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `eoUserId` bigint(20) NOT NULL COMMENT '用户ID',
  `eoRealName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `eoUserAddress` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户地址',
  `eoCreateTime` datetime NOT NULL COMMENT '创建时间',
  `eoCost` double(10,0) NOT NULL COMMENT '金额',
  `eoStatus` int(11) NOT NULL COMMENT '状态： 1下单 2 审核通过 3 配货 4 送货中 5收获并确认',
  `eoType` int(11) NOT NULL COMMENT '付款方式：1 货到付款 2 网上支付',
  `eoUserPhone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户手机号码',
  PRIMARY KEY (`eoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_order
-- ----------------------------
INSERT INTO `easybuy_order` VALUES ('1', '3', '蒋怡婷', '杭电', '2013-09-02 19:51:48', '191', '1', '2', '');
INSERT INTO `easybuy_order` VALUES ('2', '4', '韩雪桐', '杭电', '2013-09-02 19:53:13', '58', '4', '1', '');
INSERT INTO `easybuy_order` VALUES ('3', '5', '沈慧婷', '大水院', '2013-09-02 20:25:13', '33', '2', '1', '');

-- ----------------------------
-- Table structure for `easybuy_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order_detail`;
CREATE TABLE `easybuy_order_detail` (
  `eodId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `eoId` bigint(20) NOT NULL COMMENT '订单ID',
  `epId` bigint(20) NOT NULL COMMENT '商品ID',
  `eodQuantity` int(11) NOT NULL COMMENT '数量',
  `eodCost` float(10,0) NOT NULL COMMENT '金额',
  PRIMARY KEY (`eodId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_order_detail
-- ----------------------------
INSERT INTO `easybuy_order_detail` VALUES ('1', '20130902000001', '1', '1', '65');
INSERT INTO `easybuy_order_detail` VALUES ('2', '20130902000002', '2', '1', '30000');
INSERT INTO `easybuy_order_detail` VALUES ('3', '20130902000003', '3', '20', '40000');

-- ----------------------------
-- Table structure for `easybuy_parent_category`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_parent_category`;
CREATE TABLE `easybuy_parent_category` (
  `epcParentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '父分类',
  `epcParentName` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '父分类名称',
  PRIMARY KEY (`epcParentId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_parent_category
-- ----------------------------
INSERT INTO `easybuy_parent_category` VALUES ('1', '图书');
INSERT INTO `easybuy_parent_category` VALUES ('2', '百货');
INSERT INTO `easybuy_parent_category` VALUES ('3', '品牌');

-- ----------------------------
-- Table structure for `easybuy_product`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product`;
CREATE TABLE `easybuy_product` (
  `epId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `epName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '名字',
  `epDescription` text CHARACTER SET utf8 COMMENT '描述',
  `epPrice` float(10,0) NOT NULL COMMENT '价格',
  `epStock` int(11) NOT NULL COMMENT '库存',
  `epcChildId` int(11) NOT NULL COMMENT '二级分类ID',
  `epFileName` varchar(100) COLLATE utf8_bin DEFAULT 'product/0.jpg' COMMENT '文件名(图片路径)',
  `epIsPromote` int(11) NOT NULL DEFAULT '0' COMMENT '是否为促销 0： 不促销  1 促销',
  `epSellAmount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '售出数量',
  `epPromotePrice` float DEFAULT '0' COMMENT '促销价格',
  `epCreateTime` datetime NOT NULL COMMENT '商品创建时间',
  `epProductNum` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`epId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_product
-- ----------------------------
INSERT INTO `easybuy_product` VALUES ('1', '美特斯邦威T恤', '美邦全场5折出售', '65', '100', '6', 'product/美特斯邦威.jpg', '0', '0', '0', '2013-07-08 12:31:03', 'EDAC00001');
INSERT INTO `easybuy_product` VALUES ('2', '林俊杰个人专辑', '林俊杰最新专辑', '100', '1000', '1', 'product/linJJ.jpg', '0', '0', '0', '2013-07-25 10:21:13', 'EDAC00002');
INSERT INTO `easybuy_product` VALUES ('3', 'Edifier耳机', '漫步者耳机', '50', '100', '12', 'product/0.jpg', '0', '0', '0', '2013-08-11 23:31:40', 'EDAC00003');
INSERT INTO `easybuy_product` VALUES ('4', '远东正狐牛仔裤女', '远东正狐牛仔裤女，全场包邮', '123', '100', '7', 'product/5.jpg', '0', '0', '0', '2013-08-12 13:48:26', 'EDAC00004');
INSERT INTO `easybuy_product` VALUES ('5', '玉兰油美白三件套', '明天就变白', '1234', '100', '20', 'product/3.jpg', '0', '0', '0', '2013-08-12 13:48:39', 'EDAC00005');
INSERT INTO `easybuy_product` VALUES ('6', 'iphone 4S', '苹果iphone 4s', '3080', '1000', '17', 'product/iphone 4s.jpg', '0', '0', '0', '2013-08-12 13:49:50', 'EDAC00006');
INSERT INTO `easybuy_product` VALUES ('7', '拖把', '清洁拖把', '15', '150', '9', 'product/拖把.jpg', '0', '0', '0', '2013-09-13 17:12:40', 'EDAC00007');
INSERT INTO `easybuy_product` VALUES ('8', '佳洁士牙膏', '佳洁士', '6', '300', '10', 'product/佳洁士.jpg', '0', '0', '0', '2013-09-13 17:14:22', 'EDAC00008');
INSERT INTO `easybuy_product` VALUES ('9', '创意餐盘', '餐盘', '20', '50', '13', 'product/餐盘.jpg', '0', '0', '0', '2013-09-13 17:15:44', 'EDAC00009');
INSERT INTO `easybuy_product` VALUES ('10', '餐巾纸', '心心相印餐巾纸', '3', '500', '11', 'product/餐巾纸.jpg', '0', '0', '0', '0000-00-00 00:00:00', 'EDAC00010');
INSERT INTO `easybuy_product` VALUES ('11', '成人饲料', '专为IT苦逼者设计', '5', '99999', '0', 'product/0.jpg', '0', '0', '0', '0000-00-00 00:00:00', 'EDAC00011');
INSERT INTO `easybuy_product` VALUES ('12', '日清方便面', '12杯装', '55', '500', '21', 'product/日清.jpg', '0', '0', '0', '2013-09-13 17:24:37', 'EDAC00012');
INSERT INTO `easybuy_product` VALUES ('16', '移动花费50元', '在线快冲50元话费', '50', '9999', '18', 'product/yidong50.jpg', '0', '0', '0', '2013-09-05 14:05:33', 'EDAC00013');
INSERT INTO `easybuy_product` VALUES ('17', '清风纸品  3层*270段*10卷', '清风纸品 卷纸 原木纯品卷筒卫生纸 3层*270段*10卷', '17', '3000', '19', 'product/清风卫生纸.jpg', '0', '0', '0', '2013-09-05 14:07:11', 'EDAC00015');
INSERT INTO `easybuy_product` VALUES ('18', '联想 Y400N-IFI', '产品名称：Lenovo/联想 Y400N-IFI体积(含包装): 15X35X45重量(含包装): 4kg品牌: Lenovo/联想系列: IdeaPad Y400IdeaPad Y400系列型号: Y400N-IFI屏幕尺寸: 14寸CPU平台: Intel Core/酷睿 i5Intel Core/酷睿 i5: i5-3210M显卡类型: 独立独显: NVIDIA Geforce GT 650M显存容量: 2G机械硬盘容量: 1T固态硬盘: 无内存容量: 4G光驱类型: 刻录光驱笔记本定位: 家庭影音 全能学生 商务办公 高清游戏重量: 2-2.5公斤电池类型: 6芯锂电池笔记本价格区间: 5000-5499元售后服务: 全国联保颜色分类: 黑色 灰色上市时间: 2012年月份: 12月操作系统: Windows 8通信功能: 无线网卡输入设备: 触摸板其它功能: HDMI接口 摄像头 扬声器 USB 3.0笔记本套餐: 套餐一 套餐二 套餐三 套餐四 官方标配成色: 全新是否超极本: 否', '5200', '450', '15', 'product/4.jpg', '0', '0', '0', '2013-09-05 14:09:42', 'EDAC00015');
INSERT INTO `easybuy_product` VALUES ('19', 'adidas护腕', '阿迪护腕', '58', '100', '14', 'product/adidas.jpg', '0', '0', '0', '2013-09-05 14:11:31', 'EDAC00016');
INSERT INTO `easybuy_product` VALUES ('20', '李连杰', '敢死队2', '30', '100', '2', 'product/李连杰.jpg', '0', '0', '0', '2013-09-13 17:02:24', 'EDAC00017');
INSERT INTO `easybuy_product` VALUES ('21', '脑筋急转弯', '益智类脑筋急转弯', '10', '50', '3', 'product/脑筋急转弯.jpg', '0', '0', '0', '2013-09-13 17:02:23', 'EDAC00018');
INSERT INTO `easybuy_product` VALUES ('22', '海贼王', '海贼王 路飞', '10', '100', '4', 'product/海贼王.jpg', '0', '0', '0', '2013-09-13 17:02:19', 'EDAC00019');
INSERT INTO `easybuy_product` VALUES ('23', '斗破苍穹', '经典小说 斗破苍穹', '20', '300', '5', 'product/斗破苍穹.jpg', '0', '0', '0', '2013-09-13 17:02:00', 'EDAC00020');
INSERT INTO `easybuy_product` VALUES ('24', '多美滋金盾', '婴幼儿奶粉', '168', '500', '16', 'product/10.jpg', '0', '0', '0', '2013-09-13 17:07:57', 'EDAC00021');
INSERT INTO `easybuy_product` VALUES ('25', '耐克运动裤', '运动裤', '150', '100', '8', 'product/nike.jpg', '0', '0', '0', '2013-09-13 17:11:10', 'EDAC00022');

-- ----------------------------
-- Table structure for `easybuy_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product_category`;
CREATE TABLE `easybuy_product_category` (
  `epcId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `epcName` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '名字',
  `epcParentId` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '父分类',
  PRIMARY KEY (`epcId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_product_category
-- ----------------------------
INSERT INTO `easybuy_product_category` VALUES ('1', '音乐', '1');
INSERT INTO `easybuy_product_category` VALUES ('2', '影视', '1');
INSERT INTO `easybuy_product_category` VALUES ('3', '益智', '1');
INSERT INTO `easybuy_product_category` VALUES ('4', '动漫', '1');
INSERT INTO `easybuy_product_category` VALUES ('5', '小说', '1');
INSERT INTO `easybuy_product_category` VALUES ('6', '外衣', '2');
INSERT INTO `easybuy_product_category` VALUES ('7', '休闲裤', '2');
INSERT INTO `easybuy_product_category` VALUES ('8', '运动裤', '2');
INSERT INTO `easybuy_product_category` VALUES ('9', '拖把', '2');
INSERT INTO `easybuy_product_category` VALUES ('10', '牙膏', '2');
INSERT INTO `easybuy_product_category` VALUES ('11', '卫生纸', '2');
INSERT INTO `easybuy_product_category` VALUES ('12', '耳机', '2');
INSERT INTO `easybuy_product_category` VALUES ('13', '餐盘', '2');
INSERT INTO `easybuy_product_category` VALUES ('14', '阿迪达斯', '3');
INSERT INTO `easybuy_product_category` VALUES ('15', '联想', '3');
INSERT INTO `easybuy_product_category` VALUES ('16', '多美滋', '3');
INSERT INTO `easybuy_product_category` VALUES ('17', '苹果', '3');
INSERT INTO `easybuy_product_category` VALUES ('18', '中国移动', '3');
INSERT INTO `easybuy_product_category` VALUES ('19', '金红叶', '3');
INSERT INTO `easybuy_product_category` VALUES ('20', '玉兰油', '3');
INSERT INTO `easybuy_product_category` VALUES ('21', '泡面', '2');

-- ----------------------------
-- Table structure for `easybuy_user`
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_user`;
CREATE TABLE `easybuy_user` (
  `euUserId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `euUserName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `euPassword` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `euRealName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `euSex` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `euBirthday` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '出生日期',
  `euIdentityCode` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `euEmail` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Email',
  `euMobile` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `euAddress` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `euStatus` int(11) NOT NULL DEFAULT '1' COMMENT '类型：1 普通用户 2 管理员',
  PRIMARY KEY (`euUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of easybuy_user
-- ----------------------------
INSERT INTO `easybuy_user` VALUES ('1', 'admin', '123', '管理员', '男', null, '987654321', null, null, null, '2');
INSERT INTO `easybuy_user` VALUES ('3', 'jyt', '123', '蒋怡婷', '女', null, '9876543', null, null, null, '1');
INSERT INTO `easybuy_user` VALUES ('4', 'hxt', '123', '韩雪桐', '男', null, '987654', null, null, null, '1');
INSERT INTO `easybuy_user` VALUES ('5', 'sht', '123', '沈慧婷', '女', null, '98765', null, null, null, '1');
INSERT INTO `easybuy_user` VALUES ('6', 'lj', '123', '吕洁', '女', null, '9876', null, null, null, '1');
INSERT INTO `easybuy_user` VALUES ('7', 'ws', '123', '王硕', '男', null, '1232142151', null, null, null, '1');
