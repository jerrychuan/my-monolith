/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : my_stall

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 18/06/2023 13:58:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '产品类别名称',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '产品类别';

-- ----------------------------
-- Table structure for goods_item
-- ----------------------------
DROP TABLE IF EXISTS `goods_item`;
CREATE TABLE `goods_item`  (
  `id` bigint(20) NOT NULL,
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '产品类别',
  `category_name` varchar(20) DEFAULT NULL COMMENT '产品类别名称',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '单价',
  `is_shelf` char(1) DEFAULT NULL COMMENT '是否上架：T是F否',
  `inventory` int(11) DEFAULT NULL COMMENT '库存',
  `force_manager_flag` char(1) DEFAULT NULL COMMENT '强制管理中：1正常2违规待整改3强制下架',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '产品表';

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `mer_name` varchar(100) DEFAULT NULL COMMENT '商户名称',
  `status` varchar(10) DEFAULT NULL COMMENT '商户状态',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '商户表';

-- ----------------------------
-- Table structure for merchant_category_restrict
-- ----------------------------
DROP TABLE IF EXISTS `merchant_category_restrict`;
CREATE TABLE `merchant_category_restrict`  (
  `id` bigint(20) NOT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  `goods_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '商户可售产品类型表';

-- ----------------------------
-- Table structure for merchant_detail
-- ----------------------------
DROP TABLE IF EXISTS `merchant_detail`;
CREATE TABLE `merchant_detail`  (
  `id` bigint(20) NOT NULL,
  `stall_id` bigint(20) DEFAULT NULL,
  `good_scale` double(2, 2) DEFAULT NULL COMMENT '好评率',
  `service_scale` varchar(255) DEFAULT NULL COMMENT '服务态度',
  `quality_scale` varchar(255) DEFAULT NULL COMMENT '产品质量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '摊位详情';

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` bigint(20) NOT NULL,
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单号',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `amount` decimal(10, 2) DEFAULT NULL COMMENT '实付金额',
  `status` varchar(10) DEFAULT NULL COMMENT '订单状态：1待支付，2已支付，3已取消',
  `pay_config_id` bigint(20) DEFAULT NULL COMMENT '支付配置id',
  `pay_way_code` varchar(20) DEFAULT NULL COMMENT '支付方式code:Balance',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '订单表';

-- ----------------------------
-- Table structure for sale_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_detail`;
CREATE TABLE `sale_order_detail`  (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `stall_id` bigint(20) DEFAULT NULL COMMENT '摊位id',
  `stall_name` varchar(50) DEFAULT NULL COMMENT '摊位名称',
  `goods_item_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `goods_item_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `unit_price` decimal(10, 2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(10, 2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '订单明细';

-- ----------------------------
-- Table structure for sale_order_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_evaluate`;
CREATE TABLE `sale_order_evaluate`  (
  `id` bigint(20) NOT NULL,
  `service_star` varchar(255) DEFAULT NULL COMMENT '服务态度评级',
  `quality_star` varchar(255) DEFAULT NULL COMMENT '产品质量评级',
  `sanitation_star` varchar(255) DEFAULT NULL COMMENT '摊位卫生评级',
  `order_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '订单评价表';

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site`  (
  `id` bigint(20) NOT NULL,
  `region_id` int(11) DEFAULT NULL COMMENT '地区id',
  `name` varchar(255) DEFAULT NULL COMMENT '场地名称',
  `seating_capacity` int(11) DEFAULT NULL COMMENT '可容纳摊位数',
  `rent_price` decimal(10, 2) DEFAULT NULL COMMENT '租金',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '市场';

-- ----------------------------
-- Table structure for social_customer
-- ----------------------------
DROP TABLE IF EXISTS `social_customer`;
CREATE TABLE `social_customer`  (
  `id` bigint(20) NOT NULL,
  `account` varchar(20) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `user_name` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT '用户状态：1正常2限制商家功能3限制交易',
  `last_login_time` datetime(0) DEFAULT NULL,
  `head_sculpture` varchar(255) DEFAULT NULL COMMENT '头像',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '用户表';

-- ----------------------------
-- Table structure for social_customer_account
-- ----------------------------
DROP TABLE IF EXISTS `social_customer_account`;
CREATE TABLE `social_customer_account`  (
  `id` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `balance` decimal(10, 2) DEFAULT NULL COMMENT '余额',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '用户账户表';

-- ----------------------------
-- Table structure for stall
-- ----------------------------
DROP TABLE IF EXISTS `stall`;
CREATE TABLE `stall`  (
  `id` bigint(20) NOT NULL,
  `site_id` bigint(20) DEFAULT NULL COMMENT '场地id',
  `code` varchar(20) DEFAULT NULL COMMENT '摊位编码',
  `name` varchar(255) DEFAULT NULL COMMENT '摊位名称',
  `type` varchar(255) DEFAULT NULL COMMENT '摊位类型',
  `status` varchar(10) DEFAULT NULL COMMENT '摊位状态：1待租2待营业3营业中',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '摊位表';

-- ----------------------------
-- Table structure for stall_rent
-- ----------------------------
DROP TABLE IF EXISTS `stall_rent`;
CREATE TABLE `stall_rent`  (
  `id` bigint(20) NOT NULL,
  `site_id` bigint(20) DEFAULT NULL COMMENT '场地id',
  `stall_id` bigint(20) DEFAULT NULL COMMENT '摊位id',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `days` bigint(11) DEFAULT NULL COMMENT '天数',
  `status` varchar(10) DEFAULT NULL COMMENT '状态：1待审核2已通过3已拒绝',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '摊位出租表';

-- ----------------------------
-- Table structure for sys_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_pay_config`;
CREATE TABLE `sys_pay_config`  (
  `id` bigint(20) NOT NULL,
  `pay_way_code` varchar(30) DEFAULT NULL COMMENT '支付方式编码（Cash）',
  `pay_way_name` varchar(255) DEFAULT NULL COMMENT '支付方式名称（现金）',
  `pay_type_code` varchar(30) DEFAULT NULL COMMENT '支付类型编码（Cash）',
  `pay_type_name` varchar(255) DEFAULT NULL COMMENT '支付类型名称（现金支付）',
  `pay_type_display_name` varchar(255) DEFAULT NULL COMMENT '支付类别显示名称',
  `pay_cat_code` varchar(30) DEFAULT NULL COMMENT '支付类别编码（SCANPAY、QRCODEPAY、CASHPAY、BALANCEPAY、MINIPROGRAMPAY、DEVICE、DEVICESCANPAY）',
  `pay_cat_name` varchar(255) DEFAULT NULL COMMENT '支付类别名称（付款码支付、二维码支付、现金支付、余额支付、小程序支付、设备支付（银行卡，手持机）、设备付款码支付）',
  `pay_auth_params` text COMMENT '支付方式参数',
  `is_active` char(10) DEFAULT NULL COMMENT '是否激活，ACTIVE：激活；UNACTIVE：冻结',
  `crt_user` bigint(255) DEFAULT NULL COMMENT '创建人',
  `crt_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `upd_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `upd_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `level` varchar(255) DEFAULT NULL COMMENT '层级',
  `area_code` varchar(255) DEFAULT NULL COMMENT '地区编码',
  `code` varchar(255) DEFAULT NULL COMMENT '区号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;
