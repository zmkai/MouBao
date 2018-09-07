/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : moubao

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-09-07 13:43:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `postId` char(20) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', 'jlkj', '15940593802', '商丘', '476900', '0');
INSERT INTO `address` VALUES ('2', '1', 'kj', '11111111', 'jlkjl', '476900', '0');
INSERT INTO `address` VALUES ('4', '1', '凯哥', '15940593802', '阿萨德', '476900', '0');
INSERT INTO `address` VALUES ('5', '1', '凯哥', '15940593802', '是的法定', '476900', '0');
INSERT INTO `address` VALUES ('6', '1', '凯哥', '15940593802', '是的法定', '476900', '0');
INSERT INTO `address` VALUES ('7', '1', '凯哥', '15940593802', 'hj', '476900', '0');
INSERT INTO `address` VALUES ('8', '1', '凯哥', '15940593802', 'sad', '476900', '1');
INSERT INTO `address` VALUES ('9', '1', '凯哥', '15940593802', '是的法定', '476900', '0');
INSERT INTO `address` VALUES ('10', '1', '凯哥', '15940593802', '沈阳农业大学', '476900', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `picUrl` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `state` char(255) CHARACTER SET utf8 DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `dateOnSale` date DEFAULT NULL,
  `dateSubmit` datetime DEFAULT NULL,
  `location` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userId`),
  CONSTRAINT `userid` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '2', '连衣裙', '/files/dress.jpg', '女装', '588', '这是一件好看的连衣裙', '0', '4', '2018-08-28', '2018-08-28 14:56:44', '浙江省');
INSERT INTO `product` VALUES ('2', '2', '矿泉水', '/files/dress.jpg', '饮用水', '10.2', '很好喝', '1', '5', null, '2018-02-01 00:00:00', null);
INSERT INTO `product` VALUES ('4', '2', '毛衣', '/files/1535614631202.jpg', '女装/男装', '20', '是的范德萨', '1', '6', null, '2018-08-30 00:00:00', null);
INSERT INTO `product` VALUES ('5', '2', '毛衣111', '/files/1535679001328.jpg', '女装/男装', '20', 'lsjflsdkjfklds', '1', '3', null, '2018-08-31 00:00:00', null);

-- ----------------------------
-- Table structure for purchases
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `sellUserId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `orderId` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `saleNum` int(11) DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `sellUserId` (`sellUserId`),
  KEY `productId` (`productId`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`sellUserId`) REFERENCES `user` (`id`),
  CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `purchases_ibfk_4` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES ('1', '1', '2', '1', '8', '3c70f3aa-4138-', '1', '12', '2018-08-30', '12');
INSERT INTO `purchases` VALUES ('2', '1', '2', '1', '8', 'd6056f9c-2c6a-', '1', '10', '2018-08-30', '20');
INSERT INTO `purchases` VALUES ('3', '1', '2', '1', '6', '9f278db0-babc-', '1', '1', '2018-08-30', '588');
INSERT INTO `purchases` VALUES ('4', '1', '2', '1', '8', '744bd017-022b-', '1', '2', '2018-08-30', '1176');
INSERT INTO `purchases` VALUES ('5', '1', '2', '1', '4', '4e46a90b-16cf-', '1', '1', '2018-08-31', '588');
INSERT INTO `purchases` VALUES ('6', '1', '2', '1', '4', 'eda21d7b-ae41-', '1', '1', '2018-08-31', '588');
INSERT INTO `purchases` VALUES ('7', '1', '2', '1', '4', 'b0eff5f3-a6d7-', '1', '1', '2018-08-31', '588');
INSERT INTO `purchases` VALUES ('8', '1', '2', '1', null, null, '0', '1', null, '588');
INSERT INTO `purchases` VALUES ('9', '1', '2', '1', '9', '56e9b549-f4c1-', '1', '3', '2018-08-31', '1764');
INSERT INTO `purchases` VALUES ('10', '1', '2', '4', '9', '81243045-4b32-', '1', '3', '2018-08-31', '60');
INSERT INTO `purchases` VALUES ('11', '1', '2', '4', null, null, '0', '6', null, '120');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1');
INSERT INTO `user` VALUES ('2', 'admin1', 'admin1', '0');
