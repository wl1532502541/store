/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 19/05/2021 12:18:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '跑步鞋');
INSERT INTO `category` VALUES (2, '休闲鞋');
INSERT INTO `category` VALUES (3, '篮球鞋');
INSERT INTO `category` VALUES (4, '帆布鞋');
INSERT INTO `category` VALUES (5, '板鞋');
INSERT INTO `category` VALUES (6, '凉鞋');
INSERT INTO `category` VALUES (7, '皮鞋');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `left_count` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NOT NULL,
  `sold_count` int NOT NULL,
  `category_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKn1hbjbxhwrd3wynoruqh31xk8`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 2322, '要疯5狂潮3篮球鞋2021新款', 599, 12, 3);
INSERT INTO `goods` VALUES (2, 1521, '要疯逆刃篮球鞋2021新款', 439, 123, 3);
INSERT INTO `goods` VALUES (3, 1331, '火影忍者联名篮球鞋2021新款', 689, 123, 3);
INSERT INTO `goods` VALUES (4, 1221, '创1.0跑鞋2021新款', 409, 12, 1);
INSERT INTO `goods` VALUES (5, 1111, '氢跑3.0跑鞋2021新款', 389, 132, 1);
INSERT INTO `goods` VALUES (6, 1222, '毒刺跑鞋2021新款', 259, 122, 1);
INSERT INTO `goods` VALUES (7, 1222, '免系带旋钮跑鞋', 409, 123, 1);
INSERT INTO `goods` VALUES (8, 122, '星标系列游心休闲鞋2021新款', 989, 128, 2);
INSERT INTO `goods` VALUES (9, 122, '魔方拒绝平庸休闲鞋', 229, 122, 2);
INSERT INTO `goods` VALUES (10, 123, '巢鞋 x SALEHE休闲鞋2021新款', 519, 123, 2);
INSERT INTO `goods` VALUES (11, 221, '冰河千禧鞋男鞋休闲鞋', 209, 1233, 2);
INSERT INTO `goods` VALUES (12, 211, '汤普森KT6篮球鞋54汤配色2021新款kt', 800, 123, 3);
INSERT INTO `goods` VALUES (13, 211, 'bubble泡泡全掌气垫跑鞋2021新款', 589, 232, 1);
INSERT INTO `goods` VALUES (14, 231, '氢跑鞋zero跑鞋2021新款', 539, 212, 1);
INSERT INTO `goods` VALUES (15, 122, '弹力胶跑鞋2021新款', 389, 122, 1);
INSERT INTO `goods` VALUES (16, 122, '虫洞科技羚跑专业跑鞋2021新款', 459, 122, 1);
INSERT INTO `goods` VALUES (17, 123, 'bubble2.0泡泡跑鞋2021新款', 359, 222, 1);
INSERT INTO `goods` VALUES (18, 1111, '汤普森KT系列篮球文化新板鞋2021新款kt', 459, 1232, 5);
INSERT INTO `goods` VALUES (19, 121, '潮流时尚沙滩鞋', 49, 121, 6);
INSERT INTO `goods` VALUES (20, 121, '英伦男士商务休闲鞋正装皮鞋', 99, 122, 7);
INSERT INTO `goods` VALUES (21, 121, '春夏季男士新款男鞋高帮板鞋韩版', 79, 121, 4);

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `goods_count` int NOT NULL,
  `state` int NOT NULL,
  `goods_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpbanwftrxy8enytpu2ugcl9g3`(`goods_id`) USING BTREE,
  INDEX `FK1dqm16mo3cntjlxap3iusqvyt`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES (1, '花果山', 2, 4, 2, 5);
INSERT INTO `trade` VALUES (2, '花果山', 1, 4, 3, 4);
INSERT INTO `trade` VALUES (3, '花果山', 2, 4, 1, 3);
INSERT INTO `trade` VALUES (4, '花果山', 2, 4, 4, 2);
INSERT INTO `trade` VALUES (5, '花果山', 3, 4, 3, 5);
INSERT INTO `trade` VALUES (6, '花果山', 2, 4, 1, 5);
INSERT INTO `trade` VALUES (7, '花果山', 3, 4, 2, 5);
INSERT INTO `trade` VALUES (8, '花果山', 1, 2, 1, 2);
INSERT INTO `trade` VALUES (9, '花果山', 1, 1, 1, 3);
INSERT INTO `trade` VALUES (10, '花果山', 1, 2, 1, 4);
INSERT INTO `trade` VALUES (11, '花果山', 1, 2, 1, 5);
INSERT INTO `trade` VALUES (12, '花果山', 1, 3, 1, 6);
INSERT INTO `trade` VALUES (13, '花果山', 1, 3, 1, 7);
INSERT INTO `trade` VALUES (14, '花果山', 1, 3, 1, 7);
INSERT INTO `trade` VALUES (15, '花果山', 2, 1, 1, 5);
INSERT INTO `trade` VALUES (16, '花果山', 1, 1, 2, 5);
INSERT INTO `trade` VALUES (17, '花果山ss', 2, 2, 8, 5);
INSERT INTO `trade` VALUES (18, '花果山', 2, 1, 2, 5);
INSERT INTO `trade` VALUES (19, '花果山', 1, 1, 4, 5);
INSERT INTO `trade` VALUES (20, '花果山', 2, 1, 3, 5);
INSERT INTO `trade` VALUES (21, '花果山', 2, 1, 6, 5);
INSERT INTO `trade` VALUES (22, '花果山ss', 1, 1, 1, 5);
INSERT INTO `trade` VALUES (23, '花果山', 2, 2, 1, 5);
INSERT INTO `trade` VALUES (24, '花果山', 2, 1, 3, 5);
INSERT INTO `trade` VALUES (25, '花果山', 1, 1, 4, 5);
INSERT INTO `trade` VALUES (26, '花果山1234567', 2, 1, 4, 5);
INSERT INTO `trade` VALUES (27, '花果山1234567', 3, 1, 9, 5);
INSERT INTO `trade` VALUES (28, '花果山12345', 10, 1, 21, 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `balance` double NOT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pay_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '花果山', 0, b'1', 'w', 'w', 'w');
INSERT INTO `user` VALUES (2, '花果山', 0, b'0', 's', 's', 's');
INSERT INTO `user` VALUES (3, '花果山', 0, b'0', 'a', 'a', 'a');
INSERT INTO `user` VALUES (4, '花果山', 0, b'0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (5, '花果山', 0, b'0', 'asd', 'asd', 'asd');
INSERT INTO `user` VALUES (6, '花果山', 0, b'0', '啊实打实的', 'asdasd', 'asdasd');
INSERT INTO `user` VALUES (7, '花果山', 0, b'0', 'sdf', 'sdf', 'sdf');

SET FOREIGN_KEY_CHECKS = 1;
