/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-12-12 05:45:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sac_entrega_acreditacion
-- ----------------------------
DROP TABLE IF EXISTS `sac_entrega_acreditacion`;
CREATE TABLE `sac_entrega_acreditacion` (
  `id_entrega_acreditacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado_institucion` int(11) NOT NULL,
  `nombre_entrega` varchar(255) NOT NULL,
  `dui_entrega` varchar(10) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  PRIMARY KEY (`id_entrega_acreditacion`),
  KEY `fk_empleado_institucion_entrega_acreditacion` (`id_empleado_institucion`),
  CONSTRAINT `fk_empleado_institucion_entrega_acreditacion` FOREIGN KEY (`id_empleado_institucion`) REFERENCES `sac_empleado_institucion` (`id_empleado_institucion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
