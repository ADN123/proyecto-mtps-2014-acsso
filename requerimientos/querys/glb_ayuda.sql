/*
Navicat MySQL Data Transfer

Source Server         : localhostIP
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-01-13 16:05:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for glb_ayuda
-- ----------------------------
DROP TABLE IF EXISTS `glb_ayuda`;
CREATE TABLE `glb_ayuda` (
  `id_ayuda` int(11) NOT NULL AUTO_INCREMENT,
  `id_modulo` int(11) NOT NULL,
  `descripcion_ayuda` text NOT NULL,
  `para_que` text NOT NULL,
  PRIMARY KEY (`id_ayuda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of glb_ayuda
-- ----------------------------
INSERT INTO `glb_ayuda` VALUES ('1', '94', 'Aquí se realiza el ingreso de la información básica de las organizaciones (públicas y privadas).', 'Estas empresas fungen como empleadores que tienen registrados lugares de trabajo, estos lugares de trabajo son el principal insumo dentro proceso de acreditaciones.');

-- ----------------------------
-- Table structure for glb_paso
-- ----------------------------
DROP TABLE IF EXISTS `glb_paso`;
CREATE TABLE `glb_paso` (
  `id_paso` int(11) NOT NULL AUTO_INCREMENT,
  `id_ayuda` int(11) NOT NULL,
  `titulo_paso` varchar(255) NOT NULL,
  `paso` text NOT NULL,
  `orden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_paso`),
  KEY `fk_paso_ayuda` (`id_ayuda`),
  CONSTRAINT `fk_paso_ayuda` FOREIGN KEY (`id_ayuda`) REFERENCES `glb_ayuda` (`id_ayuda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of glb_paso
-- ----------------------------
INSERT INTO `glb_paso` VALUES ('1', '1', 'Ingresar empleadores', 'Crear registros de empleadores, para luego asignarles lugares de trabajo.', '0');
INSERT INTO `glb_paso` VALUES ('2', '1', 'Buscar, editar y eliminar empleadores', 'Hacer cambios en el registro de un empleador (ej.: cambio de representante legal). Tenga en cuenta que si elimina un registro, también eliminará todos los lugares de trabajo registrados bajo dicho empleador.', '0');

-- ----------------------------
-- Table structure for glb_problema
-- ----------------------------
DROP TABLE IF EXISTS `glb_problema`;
CREATE TABLE `glb_problema` (
  `id_problema` int(11) NOT NULL AUTO_INCREMENT,
  `id_ayuda` int(11) NOT NULL,
  `problema` text NOT NULL,
  `solucion` text NOT NULL,
  PRIMARY KEY (`id_problema`),
  KEY `fk_problema_ayuda` (`id_ayuda`),
  CONSTRAINT `fk_problema_ayuda` FOREIGN KEY (`id_ayuda`) REFERENCES `glb_ayuda` (`id_ayuda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of glb_problema
-- ----------------------------
INSERT INTO `glb_problema` VALUES ('1', '1', '¿Porqué marca como malo el NIT?', 'En los formularios existen diferentes tipos de datos que se deben almacenar de manera adecuada (ej.: fechas, número de teléfono, etc.), para evitar que el usuario ingrese un dato incorrecto se hace uso de máscaras. Una máscara no es más que un formato aplicado a un dato. El NIT está conformado únicamente por números y guiones, pero no sólo eso, los guiones están repartidos en una manera específica, permitiendo una lectura fácil. El formato del NIT es el siguiente: (4 números)-(6 números)-(3 números)-(1 número)');
