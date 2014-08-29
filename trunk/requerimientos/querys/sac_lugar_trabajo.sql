/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-08-29 14:49:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sac_lugar_trabajo
-- ----------------------------
DROP TABLE IF EXISTS `sac_lugar_trabajo`;
CREATE TABLE `sac_lugar_trabajo` (
  `id_lugar_trabajo` int(11) NOT NULL auto_increment,
  `id_institucion` int(11) NOT NULL,
  `id_tipo_lugar_trabajo` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `nombre_lugar` varchar(255) NOT NULL,
  `direccion_lugar` text NOT NULL,
  `nombre_contacto` varchar(255) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `correo` varchar(255) default NULL,
  `total_hombres` int(11) NOT NULL,
  `total_mujeres` int(11) NOT NULL,
  `fecha_conformacion` date default NULL,
  `estado` tinyint(4) NOT NULL default '1',
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime default NULL,
  `id_usuario_modifica` int(11) default NULL,
  PRIMARY KEY  (`id_lugar_trabajo`),
  KEY `fk_tipo_lugar_trabajo_lugar_trabajo` (`id_tipo_lugar_trabajo`),
  KEY `fk_institucion_lugar_trabajo` (`id_institucion`),
  CONSTRAINT `fk_institucion_lugar_trabajo` FOREIGN KEY (`id_institucion`) REFERENCES `sac_institucion` (`id_institucion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_lugar_trabajo_lugar_trabajo` FOREIGN KEY (`id_tipo_lugar_trabajo`) REFERENCES `sac_tipo_lugar_trabajo` (`id_tipo_lugar_trabajo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_lugar_trabajo
-- ----------------------------
INSERT INTO `sac_lugar_trabajo` VALUES ('13', '14', '2', '97', 'Metrosur', 'Condominio Metrocentro Sur # 413 Planta Baja, S.S.', 'Luis Cardona', '22603508', 'luis.cardona@superselectos.com.sv', '15', '20', null, '1', '2014-07-22 21:33:09', '22', '2014-07-22 22:44:45', '22');
INSERT INTO `sac_lugar_trabajo` VALUES ('14', '14', '2', '75', 'Santa Tecla', '2a Calle Oriente y 3a. Av .Nte. No 2-9', '', '22888211', '', '0', '0', null, '1', '2014-07-22 21:36:21', '22', '2014-07-22 21:36:32', '22');
INSERT INTO `sac_lugar_trabajo` VALUES ('15', '14', '2', '163', 'San Vicente', '2a. Av. Sur.ex -local arena, San Vicente', '', '23930073', '', '0', '0', null, '1', '2014-07-22 21:37:32', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('16', '14', '2', '114', 'Plaza Mundo', 'Km. 4 1/2 Boulev. del Ejercito, C.C. Plaza Mundo, Ancla \"A\"', '', '', '', '0', '0', null, '1', '2014-07-22 21:39:19', '22', '2014-07-22 21:39:48', '22');
INSERT INTO `sac_lugar_trabajo` VALUES ('17', '14', '2', '106', 'Mejicanos', 'Final 5a. Av. Nte. Universitaria', '', '22262715', '', '0', '0', null, '1', '2014-07-22 21:40:45', '22', '2014-07-28 20:07:10', '22');
INSERT INTO `sac_lugar_trabajo` VALUES ('18', '14', '2', '97', 'Metrocentro', 'Mentrocentro', '', '', '', '0', '0', null, '1', '2014-08-12 10:44:31', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('19', '15', '1', '97', 'Dirección General de Aduana Oficina Central', 'San Salvador', 'Carlos Cáceres', '22303445', 'carloscaceres@mh.gob.sv', '75', '25', null, '1', '2014-08-21 14:42:39', '22', '2014-08-21 14:57:25', '22');
INSERT INTO `sac_lugar_trabajo` VALUES ('20', '15', '2', '13', 'Dirección General de Aduana Santa Ana', 'Santa Ana, Santa Ana', '', '', '', '0', '0', null, '1', '2014-08-21 14:44:18', '22', null, null);
