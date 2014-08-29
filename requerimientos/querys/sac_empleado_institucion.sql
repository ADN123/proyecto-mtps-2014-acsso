/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-08-29 14:49:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sac_empleado_institucion
-- ----------------------------
DROP TABLE IF EXISTS `sac_empleado_institucion`;
CREATE TABLE `sac_empleado_institucion` (
  `id_empleado_institucion` int(11) NOT NULL auto_increment,
  `id_lugar_trabajo` int(11) NOT NULL,
  `id_tipo_inscripcion` int(11) NOT NULL,
  `nombre_empleado` varchar(255) NOT NULL,
  `cargo_empleado` varchar(255) NOT NULL,
  `dui_empleado` varchar(10) NOT NULL,
  `id_tipo_representacion` int(11) NOT NULL,
  `delegado` tinyint(4) default NULL,
  `sindicato` tinyint(4) default NULL,
  `estado_empleado` tinyint(4) NOT NULL default '1',
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime default NULL,
  `id_usuario_modifica` int(11) default NULL,
  PRIMARY KEY  (`id_empleado_institucion`),
  KEY `fk_lugar_trabajo_empleado_institucion` (`id_lugar_trabajo`),
  KEY `fk_tipo_inscripcion_empleado_emnpresa` (`id_tipo_inscripcion`),
  KEY `fk_tipo_representacion_empleado_institucion` (`id_tipo_representacion`),
  CONSTRAINT `fk_lugar_trabajo_empleado_institucion` FOREIGN KEY (`id_lugar_trabajo`) REFERENCES `sac_lugar_trabajo` (`id_lugar_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_inscripcion_empleado_institucion` FOREIGN KEY (`id_tipo_inscripcion`) REFERENCES `sac_tipo_inscripcion` (`id_tipo_inscripcion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_representacion_empleado_institucion` FOREIGN KEY (`id_tipo_representacion`) REFERENCES `sac_tipo_representacion` (`id_tipo_representacion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
