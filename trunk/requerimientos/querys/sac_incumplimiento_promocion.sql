/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-02-19 02:30:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sac_incumplimiento_promocion
-- ----------------------------
DROP TABLE IF EXISTS `sac_incumplimiento_promocion`;
CREATE TABLE `sac_incumplimiento_promocion` (
  `id_promocion` int(11) NOT NULL,
  `id_incumplimiento` int(11) DEFAULT NULL,
  `observacion_adicional` text,
  KEY `fk_incumplimiento_promocion_1` (`id_promocion`),
  KEY `fk_incumplimiento_promocion_2` (`id_incumplimiento`),
  CONSTRAINT `fk_incumplimiento_promocion_1` FOREIGN KEY (`id_promocion`) REFERENCES `sac_promocion` (`id_promocion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_incumplimiento_promocion_2` FOREIGN KEY (`id_incumplimiento`) REFERENCES `sac_incumplimiento` (`id_incumplimiento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
