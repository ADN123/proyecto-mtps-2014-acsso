/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2014-12-16 10:40:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sac_asistencia
-- ----------------------------
DROP TABLE IF EXISTS `sac_asistencia`;
CREATE TABLE `sac_asistencia` (
  `id_capacitacion` int(11) NOT NULL,
  `id_empleado_institucion` int(11) NOT NULL,
  `asistio` tinyint(4) NOT NULL DEFAULT '0',
  `fecha_acreditacion` date DEFAULT NULL,
  PRIMARY KEY (`id_capacitacion`,`id_empleado_institucion`),
  KEY `fk_capacitacion_asistencia` (`id_capacitacion`),
  KEY `fk_empleado_institucion_asistencia` (`id_empleado_institucion`),
  CONSTRAINT `fk_capacitacion_asistencia` FOREIGN KEY (`id_capacitacion`) REFERENCES `sac_capacitacion` (`id_capacitacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_empleado_institucion_asistencia` FOREIGN KEY (`id_empleado_institucion`) REFERENCES `sac_empleado_institucion` (`id_empleado_institucion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_asistencia
-- ----------------------------

-- ----------------------------
-- Table structure for sac_capacitacion
-- ----------------------------
DROP TABLE IF EXISTS `sac_capacitacion`;
CREATE TABLE `sac_capacitacion` (
  `id_capacitacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_lugar_trabajo` int(11) DEFAULT NULL,
  `fecha_capacitacion` date NOT NULL,
  `hora_capacitacion` time NOT NULL,
  `estado_capacitacion` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modifica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_capacitacion`),
  KEY `fk_lugar_trabajo_capacitacion` (`id_lugar_trabajo`),
  CONSTRAINT `fk_lugar_trabajo_capacitacion` FOREIGN KEY (`id_lugar_trabajo`) REFERENCES `sac_lugar_trabajo` (`id_lugar_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_capacitacion
-- ----------------------------

-- ----------------------------
-- Table structure for sac_capacitador
-- ----------------------------
DROP TABLE IF EXISTS `sac_capacitador`;
CREATE TABLE `sac_capacitador` (
  `id_capacitacion` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_capacitacion`,`id_empleado`),
  CONSTRAINT `fk_capacitador_capacitacion` FOREIGN KEY (`id_capacitacion`) REFERENCES `sac_capacitacion` (`id_capacitacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_capacitador
-- ----------------------------

-- ----------------------------
-- Table structure for sac_cargo_comite
-- ----------------------------
DROP TABLE IF EXISTS `sac_cargo_comite`;
CREATE TABLE `sac_cargo_comite` (
  `id_cargo_comite` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo_comite` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cargo_comite`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_cargo_comite
-- ----------------------------
INSERT INTO `sac_cargo_comite` VALUES ('1', 'Presidente(a)');
INSERT INTO `sac_cargo_comite` VALUES ('2', 'Secretario(a)');
INSERT INTO `sac_cargo_comite` VALUES ('3', 'Vocal');

-- ----------------------------
-- Table structure for sac_clasificacion_institucion
-- ----------------------------
DROP TABLE IF EXISTS `sac_clasificacion_institucion`;
CREATE TABLE `sac_clasificacion_institucion` (
  `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `ciiu4` varchar(10) NOT NULL,
  `codigo_clasificacion` varchar(10) NOT NULL,
  `nombre_clasificacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_clasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3469 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_clasificacion_institucion
-- ----------------------------
INSERT INTO `sac_clasificacion_institucion` VALUES ('5', 'A', 'A', 'AGRICULTURA, GANADERÍA, SILVICULTURA Y PESCA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('6', 'A', '01', 'PRODUCCIÓN AGRÍCOLA, PECUARIA, CAZA Y ACTIVIDADES DE SERVICIOS CONEXAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('7', 'A', '011', 'PRODUCCIÓN DE CULTIVOS ESTACIONALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('8', 'A', '0111', 'CULTIVO DE CEREALES EXCEPTO ARROZ, PLANTAS LEGUMINOSAS Y SEMILLAS OLEAGINOSAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('9', 'A', '01111', 'Cultivo de cereales excepto arroz y para forrajes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('10', 'A', '0111101', 'Cultivo de maíz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('11', 'A', '0111102', 'Cultivo de maíz en asocio con sorgo o maicillo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('12', 'A', '0111103', 'Cultivo de maíz de grano para consumo excepto maíz dulce');
INSERT INTO `sac_clasificacion_institucion` VALUES ('13', 'A', '0111104', 'Cultivo de maíz en asocio con fríjol');
INSERT INTO `sac_clasificacion_institucion` VALUES ('14', 'A', '0111105', 'Cultivo de mijo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('15', 'A', '0111106', 'Cultivo de sorgo (maicillo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('16', 'A', '0111199', 'Cultivo de otros  cereales  excepto arroz y otros forrajes ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('17', 'A', '01112', 'Cultivo de legumbres ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('18', 'A', '0111201', 'Cultivo de fríjol seco ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('19', 'A', '0111202', 'Cultivo de fríjol para grano seco (excepto para verduras)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('20', 'A', '0111203', 'Cultivo de ejote (fríjol de ejote)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('21', 'A', '0111204', 'Cultivo de arveja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('22', 'A', '0111205', 'Cultivo de arveja (arveja o gandul) para grano seco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('23', 'A', '0111206', 'Cultivo de arveja tierna (gandul o vigna)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('24', 'A', '0111207', 'Cultivo de arveja china');
INSERT INTO `sac_clasificacion_institucion` VALUES ('25', 'A', '01113', 'Cultivo de semillas oleaginosas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('26', 'A', '0111301', 'Cultivo de soya (soja) para grano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('27', 'A', '0111302', 'Cultivo de ajonjolí o sésamo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('28', 'A', '0111303', 'Cultivo de maní o cacahuate');
INSERT INTO `sac_clasificacion_institucion` VALUES ('29', 'A', '0111304', 'Cultivo de maíz en asocio con ajonjolí');
INSERT INTO `sac_clasificacion_institucion` VALUES ('30', 'A', '01114', 'Cultivo de plantas para la preparación de semillas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('31', 'A', '0111401', 'Cultivo de maíz para la obtención de semillas mejoradas puras y/o híbridas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('32', 'A', '0111402', 'Cultivo de otras plantas para la obtención de semillas mejoradas y/o híbridas (excepto arroz)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('33', 'A', '01119', 'Cultivo de otros cereales excepto arroz y forrajeros n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('34', 'A', '0111901', 'Cultivo de amarantos (cereal)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('35', 'A', '0112', 'CULTIVO DE ARROZ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('36', 'A', '01120', 'Cultivo de arroz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('37', 'A', '0112001', 'Cultivo de arroz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('38', 'A', '112002', 'Cultivo de arroz para la obtención de semillas mejoradas puras y/o híbridas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('39', 'A', '0113', 'CULTIVO DE HORTALIZAS Y MELONES, RAÍCES Y TUBÉRCULOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('40', 'A', '01131', 'Cultivo de raíces y tubérculos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('41', 'A', '0113101', 'Cultivo de yuca');
INSERT INTO `sac_clasificacion_institucion` VALUES ('42', 'A', '0113102', 'Cultivo de papa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('43', 'A', '0113103', 'Cultivo de jícama');
INSERT INTO `sac_clasificacion_institucion` VALUES ('44', 'A', '0113104', 'Cultivo de camotes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('45', 'A', '01132', 'Cultivo de brotes, bulbos, vegetales tubérculos y cultivos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('46', 'A', '0113201', 'Cultivo de zanahoria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('47', 'A', '0113202', 'Cultivo de rábano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('48', 'A', '0113203', 'Cultivo de remolacha (no azucareras)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('49', 'A', '0113204', 'Cultivo de cebolla y cebollín');
INSERT INTO `sac_clasificacion_institucion` VALUES ('50', 'A', '0113205', 'Cultivo de ajo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('51', 'A', '0113206', 'Cultivo de soya germinada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('52', 'A', '0113207', 'Cultivo de malanga y otros tubérculos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('53', 'A', '01133', 'Cultivo hortícola de fruto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('54', 'A', '0113301', 'Cultivo de sandía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('55', 'A', '0113302', 'Cultivo de melón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('56', 'A', '0113303', 'Cultivo de pepino y pepinillo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('57', 'A', '0113304', 'Cultivo de pipían, calabaza (ayote), etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('58', 'A', '0113305', 'Cultivo de tomate');
INSERT INTO `sac_clasificacion_institucion` VALUES ('59', 'A', '0113306', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('60', 'A', '0113307', 'Cultivo de güisquil');
INSERT INTO `sac_clasificacion_institucion` VALUES ('61', 'A', '0113308', 'Cultivo de berenjena');
INSERT INTO `sac_clasificacion_institucion` VALUES ('62', 'A', '01134', 'Cultivo de hortalizas de hoja y otras hortalizas n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('63', 'A', '0113401', 'Cultivo de elotío');
INSERT INTO `sac_clasificacion_institucion` VALUES ('64', 'A', '0113402', 'Cultivo de elote');
INSERT INTO `sac_clasificacion_institucion` VALUES ('65', 'A', '0113403', 'Cultivo de bambú para la producción de brotes comestibles para consumo, fresco o envasado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('66', 'A', '0113404', 'Cultivo de pacaya');
INSERT INTO `sac_clasificacion_institucion` VALUES ('67', 'A', '0113405', 'Cultivo de repollo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('68', 'A', '0113406', 'Cultivo de lechuga');
INSERT INTO `sac_clasificacion_institucion` VALUES ('69', 'A', '0113407', 'Cultivo de ocra');
INSERT INTO `sac_clasificacion_institucion` VALUES ('70', 'A', '0113408', 'Cultivo de apio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('71', 'A', '0113409', 'Cultivo de berro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('72', 'A', '0113410', 'Cultivo de espinaca, mora y otras verduras de hojas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('73', 'A', '0113411', 'Cultivo de chipilin');
INSERT INTO `sac_clasificacion_institucion` VALUES ('74', 'A', '0113412', 'Cultivo de diversas hortalizas y verduras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('75', 'A', '0113413', 'Cultivo de hongos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('76', 'A', '0113414', 'Cultivo de loroco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('77', 'A', '0114', 'CULTIVO DE CAÑA DE AZÚCAR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('78', 'A', '01140', 'Cultivo de caña de azúcar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('79', 'A', '0114001', 'Cultivo de caña de azúcar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('80', 'A', '0115', 'CULTIVO DE TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('81', 'A', '01150', 'Cultivo de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('82', 'A', '0115001', 'Cultivo de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('83', 'A', '0116', 'CULTIVO DE FIBRAS VEGETALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('84', 'A', '01161', 'Cultivo de algodón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('85', 'A', '0116101', 'Cultivo de algodón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('86', 'A', '01162', 'Cultivo de fibras vegetales excepto algodón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('87', 'A', '0116201', 'Cultivo de henequén');
INSERT INTO `sac_clasificacion_institucion` VALUES ('88', 'A', '0116202', 'Cultivo de kenaf');
INSERT INTO `sac_clasificacion_institucion` VALUES ('89', 'A', '0116203', 'Cultivo de plantas que proporcionan materiales para trenzado (mimbre, palma de sombrero, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('90', 'A', '0116004', 'Cultivo de yute');
INSERT INTO `sac_clasificacion_institucion` VALUES ('91', 'A', '0119', 'CULTIVOS DE OTRAS PLANTAS  NO PERENNES N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('92', 'A', '01191', 'Cultivo de plantas no perennes  para la produccion de semillas y flores  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('93', 'A', '0119101', 'Cultivo de semillas de remolacha (excepto las de remolacha azucarera)  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('94', 'A', '0119102', 'Cultivo de plantas para la producción de flores y capullos (rosas, claveles, nardos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('95', 'A', '0119103', 'Cultivo de plantas para la producción de semillas de flores, frutas, hortalizas incluyendo material vegetativo para la reproducción (se excluye la producción de semillas mejoradas puras y/o híbridas de maíz, arroz, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('96', 'A', '01192', 'Cultivo de cereales y pastos para la alimentación animal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('97', 'A', '0119201', 'Otros cultivos para alimentación animal (pastos, cereales, leguminosas y otras utilizados principalmente para alimentar animales)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('98', 'A', '01199', 'Producción de cultivos no estaciónales n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('99', 'A', '0119901', 'Cultivo de marigold');
INSERT INTO `sac_clasificacion_institucion` VALUES ('100', 'A', '0119902', 'Cultivo de sorgo (maicillo) para la fabricación de escobas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('101', 'A', '0119903', 'Cultivo de plantas para la producción de pastes (esponjas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('102', 'A', '012', 'CULTIVOS DE PLANTAS   PERENNES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('103', 'A', '0121', 'CULTIVO DE UVAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('104', 'A', '0122', 'CULTIVO DE FRUTAS TROPICALES Y SUBTROPICALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('105', 'A', '01220', 'Cultivo de frutas tropicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('106', 'A', '0122001', 'Cultivo de papaya');
INSERT INTO `sac_clasificacion_institucion` VALUES ('107', 'A', '0122002', 'Cultivo de piña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('108', 'A', '0122003', 'Cultivo de aguacate');
INSERT INTO `sac_clasificacion_institucion` VALUES ('109', 'A', '0122004', 'Cultivo de mango');
INSERT INTO `sac_clasificacion_institucion` VALUES ('110', 'A', '0122005', 'Cultivo de maracuyá');
INSERT INTO `sac_clasificacion_institucion` VALUES ('111', 'A', '0122006', 'Cultivo de guayaba');
INSERT INTO `sac_clasificacion_institucion` VALUES ('112', 'A', '0122007', 'Cultivo de plátano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('113', 'A', '0122008', 'Cultivo de guineo de seda');
INSERT INTO `sac_clasificacion_institucion` VALUES ('114', 'A', '0122009', 'Cultivo de guineo majoncho, manzano, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('115', 'A', '0122010', 'Cultivo de jocote corona');
INSERT INTO `sac_clasificacion_institucion` VALUES ('116', 'A', '0122011', 'Cultivo de jocote de verano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('117', 'A', '0122012', 'Cultivo de mamey');
INSERT INTO `sac_clasificacion_institucion` VALUES ('118', 'A', '0122013', 'Cultivo de zapote');
INSERT INTO `sac_clasificacion_institucion` VALUES ('119', 'A', '0122014', 'Cultivo de tamarindo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('120', 'A', '0122015', 'Cultivo de anona');
INSERT INTO `sac_clasificacion_institucion` VALUES ('121', 'A', '0122016', 'Cultivo de arrayán');
INSERT INTO `sac_clasificacion_institucion` VALUES ('122', 'A', '0122017', 'Cultivo de carambola');
INSERT INTO `sac_clasificacion_institucion` VALUES ('123', 'A', '0122018', 'Cultivo de granadilla (fruta)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('124', 'A', '0122019', 'Cultivo de granadilla o granada de fresco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('125', 'A', '0122020', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('126', 'A', '0122021', 'Cultivo de nance');
INSERT INTO `sac_clasificacion_institucion` VALUES ('127', 'A', '0122022', 'Cultivo de marañón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('128', 'A', '0123', 'CULTIVO DE CÍTRICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('129', 'A', '01230', 'Cultivo de cítricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('130', 'A', '0123001', 'Cultivo de naranja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('131', 'A', '0123002', 'Cultivo de limón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('132', 'A', '0123003', 'Cultivo de mandarina y otros cítricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('133', 'A', '0124', 'CULTIVO DE FRUTAS DE PEPITA Y DE HUESO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('134', 'A', '01240', 'Cultivo de frutas de pepita y hueso ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('135', 'A', '0124001', 'Cultivo de níspero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('136', 'A', '0124002', 'Cultivo de manzana');
INSERT INTO `sac_clasificacion_institucion` VALUES ('137', 'A', '0124003', 'Cultivo de ciruela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('138', 'A', '0124004', 'Cultivo de durazno');
INSERT INTO `sac_clasificacion_institucion` VALUES ('139', 'A', '0124005', 'Cultivo de diversos frutales y otras plantas incluidas en ésta clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('140', 'A', '0125', 'CULTIVO DE OTROS FRUTOS Y NUECES DE ARBOLES Y ARBUSTOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('141', 'A', '01251', 'Cultivo de frutas n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('142', 'A', '0125101', 'Cultivo de fresas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('143', 'A', '01252', 'Cultivo de otros frutos  y nueces de arboles y arbustos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('144', 'A', '0126', 'CULTIVO DE FRUTOS OLEAGINOSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('145', 'A', '01260', 'Cultivo de frutos oleaginosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('146', 'A', '0126001', 'Cultivo de otros frutos oleaginosos (coco, aceitunas y palmas de aceite) ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('147', 'A', '0127', 'CULTIVO DE PLANTAS PARA LA ELABORACIÓN DE BEBIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('148', 'A', '01271', 'Cultivo de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('149', 'A', '0127101', 'Cultivo de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('150', 'A', '01272', 'Cultivo de plantas para la elaboración de bebidas excepto café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('151', 'A', '0127201', 'Cultivo de cacao');
INSERT INTO `sac_clasificacion_institucion` VALUES ('152', 'A', '0128', 'CULTIVO DE ESPECIAS Y PLANTAS AROMÁTICAS, MEDICINALES Y FARMACÉUTICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('153', 'A', '01281', 'Cultivo de especias y aromáticas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('154', 'A', '0128101', 'Cultivo de achiote');
INSERT INTO `sac_clasificacion_institucion` VALUES ('155', 'A', '0128102', 'Cultivo de hierbabuena');
INSERT INTO `sac_clasificacion_institucion` VALUES ('156', 'A', '0128103', 'Cultivo de perejil y cilantro de hoja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('157', 'A', '0128104', 'Cultivo de jengibre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('158', 'A', '0128105', 'Cultivo de orégano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('159', 'A', '0128106', 'Cultivo de chían');
INSERT INTO `sac_clasificacion_institucion` VALUES ('160', 'A', '0128107', 'Cultivo de chile dulce y picante');
INSERT INTO `sac_clasificacion_institucion` VALUES ('161', 'A', '01282', 'Cultivo de plantas para la obtención de productos medicinales y farmacéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('162', 'A', '0128201', 'Cultivo de plantas para la extracción de aceites esenciales utilizados para perfumes y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('163', 'A', '0128202', 'Cultivo de plantas utilizadas con fines medicinales y para la obtención de medicamentos farmacéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('164', 'A', '0128203', 'Cultivo de plantas utilizadas para la obtención de insecticidas y fungicidas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('165', 'A', '0129', 'CULTIVOS DE OTRAS PLANTAS  PERENNES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('166', 'A', '01291', 'Cultivo de árboles de hule (caucho) para la obtención de látex');
INSERT INTO `sac_clasificacion_institucion` VALUES ('167', 'A', '0129101', 'Cultivo de árboles de hule (caucho) para la obtención de látex');
INSERT INTO `sac_clasificacion_institucion` VALUES ('168', 'A', '01292', 'Cultivo de plantas para la obtención de productos químicos y colorantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('169', 'A', '0129201', 'Cultivo de plantas para la extracción de colorantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('170', 'A', '01299', 'Producción de cultivos perennes n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('171', 'A', '0129901', 'Cultivo de plantas para la conservación de suelos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('172', 'A', '013', 'PROPAGACIÓN DE PLANTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('173', 'A', '0130', 'PROPAGACIÓN DE PLANTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('174', 'A', '01300', 'Propagacion de plantas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('175', 'A', '0130001', 'cultivo de plantas con fines ornamentales, incluido césped para trasplante');
INSERT INTO `sac_clasificacion_institucion` VALUES ('176', 'A', '0130002', 'cultivo de plantas vivas para utilizar sus bulbos, tubérculos y raíces; esquejes e injertos; blancos de setas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('177', 'A', '0130003', 'Vivero de plantas ornamentales, árboles frutales y otros (excepto viveros para plantación forestal)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('178', 'A', '014', 'PRODUCCIÓN PECUARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('179', 'A', '0141', 'CRÍA DE GANADO BOVINO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('180', 'A', '01410', 'Cría y engorde de ganado bovino');
INSERT INTO `sac_clasificacion_institucion` VALUES ('181', 'A', '0141001', 'Cría de ganado bovino  (producción de leche cruda)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('182', 'A', '0141002', 'Cría y engorde de ganado bovino para la producción de carne');
INSERT INTO `sac_clasificacion_institucion` VALUES ('183', 'A', '0141003', 'Cría y engorde de ganado bovino de doble propósito (para la producción de leche y carne)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('184', 'A', '0141004', 'Cría de ganado vacuno reproductor  para la producción de semen, terneritos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('185', 'A', '0141005', 'Engorde de ganado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('186', 'A', '0142', 'CRÍA DE CABALLOS Y OTROS EQUINOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('187', 'A', '01420', 'Cría de caballos y otros equinos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('188', 'A', '0142001', 'Cría de caballos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('189', 'A', '0142002', 'Cría de otros equinos (asnos, mulas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('190', 'A', '0143', 'CRÍA DE CAMELLOS Y CAMÉLIDOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('191', 'A', '0144', 'CRÍA DE OVEJAS  Y CABRAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('192', 'A', '01440', 'Cria de ovejas y cabras ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('193', 'A', '0144001', 'Cría de ganado caprino (cabras) para la obtención de leche y carne');
INSERT INTO `sac_clasificacion_institucion` VALUES ('194', 'A', '0144002', 'Cría de ganado ovino (ovejas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('195', 'A', '0145', 'CRÍA DE CERDOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('196', 'A', '01450', 'Cría de cerdos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('197', 'A', '0145001', 'Cría y engorde de cerdos para la producción de carne ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('198', 'A', '0145002', 'Cría de cerdos  a nivel familiar o doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('199', 'A', '0145003', 'Cría de cerdos reproductores (incluye la producción de cerditos, lechones y semen entre otros productos relacionados).');
INSERT INTO `sac_clasificacion_institucion` VALUES ('200', 'A', '0146', 'CRÍA DE AVES DE CORRAL ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('201', 'A', '01460', 'Cría de aves de corral y producción de huevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('202', 'A', '0146001', 'Incubación de huevo fértil para venta de polluelos recién nacidos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('203', 'A', '0146002', 'Cría de aves de postura para la producción de huevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('204', 'A', '0146003', 'Cría de pollos de engorde para la venta');
INSERT INTO `sac_clasificacion_institucion` VALUES ('205', 'A', '0146004', 'Cría de aves de postura y engorde');
INSERT INTO `sac_clasificacion_institucion` VALUES ('206', 'A', '0146005', 'Cría de aves reproductoras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('207', 'A', '0146006', 'Cría de pavos para la producción de carne, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('208', 'A', '0146007', 'Cría de gansos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('209', 'A', '0146008', 'Cría de aves criollas: gallinas, patos, gansos, y otros, a nivel doméstico no formal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('210', 'A', '0146009', 'Cría  de codornices');
INSERT INTO `sac_clasificacion_institucion` VALUES ('211', 'A', '0149', 'CRÍA DE OTROS  ANIMALES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('212', 'A', '01491', 'Cría de abejas (apicultura) para la obtención de miel y otros productos apícolas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('213', 'A', '0149101', 'Cría de abejas (apicultura) para la obtención de miel y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('214', 'A', '01492', 'Cría de conejos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('215', 'A', '0149201', 'Cría de conejos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('216', 'A', '01493', 'Cría de iguanas y garrobos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('217', 'A', '0149301', 'Cría de iguanas y garrobos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('218', 'A', '01494', 'Cría de mariposas y otros insectos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('219', 'A', '0149401', 'Cría de mariposas y otros insectos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('220', 'A', '01499', 'Cría y obtención de productos animales n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('221', 'A', '0149901', 'Cría de  animales destinados para mascotas (excepto perros y gatos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('222', 'A', '0149902', 'Cría de perros y gatos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('223', 'A', '0149903', 'Cría en cautiverio de animales salvajes semidomesticados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('224', 'A', '0149904', 'Cría de animales destinados a la producción de pieles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('225', 'A', '015', 'CULTIVO DE PRODUCTOS AGRICOLAS EN COMBINACION  CON LA  CRIA DE ANIMALES (EXPLOTACIONES MIXTAS)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('226', 'A', '0150', 'CULTIVO DE PRODUCTOS AGRICOLAS EN COMBINACION  CON LA  CRIA DE ANIMALES (EXPLOTACIONES MIXTAS)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('227', 'A', '01500', 'Cultivo de productos agrícolas en combinación con la cría de animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('228', 'A', '0150001', 'Cría de ganado bovino y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('229', 'A', '0150002', 'Cría de aves de corral y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('230', 'A', '0150003', 'Cría de abejas (apicultura) y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('231', 'A', '0150004', 'Cría de cerdos y cultivos  en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('232', 'A', '0150005', 'Cría de conejos y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('233', 'A', '0150006', 'Cría de ovejas, cabras, venados y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('234', 'A', '0150007', 'Cría de iguanas, garrobos y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('235', 'A', '0150008', 'Cría de caballos, similares y cultivos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('236', 'A', '0150009', 'Cría de animales y cultivos incluyendo el  forestal (Agrosilvopecuario)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('237', 'A', '0150010', 'Explotación diversificada de cultivos y crianza de animales para uso alimenticio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('238', 'A', '0150011', 'Cultivo para la producción de organismos biológicos: con diversos fines excluyendo animales y plantas para la producción de alimentos y forestal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('239', 'A', '016', 'ACTIVIDADES  DE APOYO A LA AGRICULTURA  Y LA GANADERIA  Y ACTIVIDADES POST COSECHA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('240', 'A', '0161', 'ACTIVIDADES DE APOYO A LA AGRICULTURA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('241', 'A', '01611', 'Servicios de maquinaria agrícola');
INSERT INTO `sac_clasificacion_institucion` VALUES ('242', 'A', '0161101', 'Alquiler de maquinaria agrícola con conductor  para labores de cultivo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('243', 'A', '01612', 'Control de plagas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('244', 'A', '0161201', 'Control de plagas y enfermedades en los cultivos por contrato');
INSERT INTO `sac_clasificacion_institucion` VALUES ('245', 'A', '01613', 'Servicios de riego');
INSERT INTO `sac_clasificacion_institucion` VALUES ('246', 'A', '0161301', 'Manejo de sistemas de riego');
INSERT INTO `sac_clasificacion_institucion` VALUES ('247', 'A', '01614', 'Servicios de contratación de mano de obra para la agricultura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('248', 'A', '0161401', 'Recolección de cosechas por contrato');
INSERT INTO `sac_clasificacion_institucion` VALUES ('249', 'A', '0161402', 'Desgrane de maíz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('250', 'A', '0161403', 'Extracción de copra de coco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('251', 'A', '01619', 'Servicios agrícolas n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('252', 'A', '0161901', 'Embalaje de pastos (zacate) tuzas y otros productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('253', 'A', '0162', 'ACTIVIDADES DE APOYO A LA GANADERIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('254', 'A', '01621', 'Actividades para mejorar la reproducción , el crecimiento y el rendimiento de los animales y sus productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('255', 'A', '0162101', 'Servicios de inseminación artificial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('256', 'A', '0162102', 'Mejora en la reproducción, crecimiento y rendimiento de los animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('257', 'A', '01622', 'Servicios de mano de obra pecuaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('258', 'A', '0162201', 'Servicios de mano de obra pecuaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('259', 'A', '01629', 'Servicios pecuarios n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('260', 'A', '0162901', 'Arreo y pasturaje de ganado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('261', 'A', '0162902', 'Servicios pecuarios n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('262', 'A', '0163', 'ACTIVIDADES  POST COSECHA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('263', 'A', '01631', 'Labores post cosecha de preparación de los productos agrícolas para su comercialización o para la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('264', 'A', '0163101', 'Labores post cosecha de preparación de los productos agrícolas para su comercialización o para la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('265', 'A', '01632', 'Servicio de beneficio de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('266', 'A', '0163201', 'Beneficiado de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('267', 'A', '0163202', 'Despulpado de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('268', 'A', '0163203', 'Trillado de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('269', 'A', '01633', 'Servicio de beneficiado de plantas textiles (incluye el beneficiado cuando este es realizado en la misma explotación agropecuaria)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('270', 'A', '0163301', 'Beneficiado de fibra de henequén y de otras fibras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('271', 'A', '0163302', 'Beneficiado  de algodón (desmotado de algodón)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('272', 'A', '0164', 'TRATAMIENTO DE SEMILLAS PARA LA PROPAGACIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('273', 'A', '01640', 'Tratamiento de semillas para la propagación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('274', 'A', '0164001', 'Tratamiento de semillas para la propagación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('275', 'A', '017', 'CAZA ORDINARIA Y MEDIANTE TRAMPAS Y SERVICIOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('276', 'A', '0170', 'CAZA ORDINARIA Y MEDIANTE TRAMPAS Y SERVICIOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('277', 'A', '01700', 'Caza ordinaria y mediante trampas, repoblación de animales de caza y servicios conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('278', 'A', '0170001', 'Caza ordinaria y mediante trampas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('279', 'A', '0170002', 'Reproducción y repoblación de animales de caza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('280', 'A', '02', 'SILVICULTURA Y EXTRACCIÓN DE MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('281', 'A', '021', 'SILVICULTURA Y OTRAS ACTIVIDADES FORESTALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('282', 'A', '0210', 'SILVICULTURA Y  OTRAS ACTIVIDADES FORESTALES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('283', 'A', '02100', 'Silvicultura y otras actividades forestales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('284', 'A', '0210001', 'Vivero de árboles forestales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('285', 'A', '0210002', 'Cultivo de árboles forestales de coníferas (pino, ocote, ciprés, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('286', 'A', '0210003', 'Cultivo de árboles forestales no confieras ( latí foliados ): cedro, caoba, laurel, cortés blanco, teca, eucalipto y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('287', 'A', '0210004', 'Cultivo de bambú, para uso como madera de construcción, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('288', 'A', '0210005', 'Cultivo de paterna');
INSERT INTO `sac_clasificacion_institucion` VALUES ('289', 'A', '0210006', 'Cultivo de nacaspilo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('290', 'A', '0210007', 'Cultivo de pepeto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('291', 'A', '022', 'EXTRACCIÓN DE MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('292', 'A', '0220', 'EXTRACCIÓN DE MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('293', 'A', '02200', 'Extracción de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('294', 'A', '0220001', 'Tala de árboles forestales y producción de madera en bruto: troncos, trozas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('295', 'A', '0220002', 'Tala y extracción de leña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('296', 'A', '023', 'RECOLECCIÓN DE PRODUCTOS FORESTALES EXCEPTO MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('297', 'A', '0230', 'RECOLECCIÓN DE PRODUCTOS FORESTALES EXCEPTO MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('298', 'A', '02300', 'Recolección de productos diferentes a la madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('299', 'A', '0230001', 'Extracción de bálsamo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('300', 'A', '0230002', 'Extracción y recolección de productos forestales: savias, resinas, gomas, lacas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('301', 'A', '0230003', 'Recolección de productos forestales silvestres: musgos, líquenes, bellotas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('302', 'A', '0230004', 'Recolección de semillas forestales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('303', 'A', '024', 'SERVICIOS DE APOYO A LA SILVICULTURA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('304', 'A', '0240', 'SERVICIOS DE APOYO A LA SILVICULTURA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('305', 'A', '02400', 'Servicios de apoyo a la silvicultura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('306', 'A', '0240001', 'Servicios forestales de control de incendios, inventarios forestales, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('307', 'A', '03', 'PESCA Y ACUICULTURA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('308', 'A', '031', 'PESCA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('309', 'A', '0311', 'PESCA MARÍTIMA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('310', 'A', '03110', 'Pesca marítima de altura y costera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('311', 'A', '0311001', 'Pesca marítima de altura y costera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('312', 'A', '0312', 'PESCA DE AGUA DULCE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('313', 'A', '03120', 'Pesca de agua dulce');
INSERT INTO `sac_clasificacion_institucion` VALUES ('314', 'A', '0312001', 'Pesca  en aguas interiores de ríos, lagos o embalses');
INSERT INTO `sac_clasificacion_institucion` VALUES ('315', 'A', '032', 'ACUICULTURA ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('316', 'A', '0321', 'ACUICULTURA MARÍTIMA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('317', 'A', '03210', 'Acuicultura marítima');
INSERT INTO `sac_clasificacion_institucion` VALUES ('318', 'A', '0321001', 'Reproducción de larvas de camarón de agua salada Desde la fase de huevo hasta larva');
INSERT INTO `sac_clasificacion_institucion` VALUES ('319', 'A', '0321002', 'Cría y engorde de camarón de agua salada Desde la fase de post-larva hasta adulto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('320', 'A', '0321003', 'Reproducción, cría y engorde de camarón de agua salada Desde la fase de huevo hasta adulto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('321', 'A', '0321004', 'Reproducción de peces de agua salada Desde la fase de huevo hasta alevines');
INSERT INTO `sac_clasificacion_institucion` VALUES ('322', 'A', '0321005', 'Cría y engorde de peces de agua salada Desde la fase de alevines hasta adultos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('323', 'A', '0321006', 'Reproducción, cría y engorde de peces de agua salada Desde huevo hasta adultos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('324', 'A', '0321007', 'Reproducción, cría y engorde de peces  crustáceos, moluscos y otros organismos de agua salada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('325', 'A', '0322', 'ACUICULTURA DE AGUA DULCE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('326', 'A', '03220', 'Acuicultura de agua dulce');
INSERT INTO `sac_clasificacion_institucion` VALUES ('327', 'A', '0322001', 'Reproducción de larvas de camarón de agua dulce Desde la  fase huevo hasta larva');
INSERT INTO `sac_clasificacion_institucion` VALUES ('328', 'A', '0322002', 'Reproducción, cría y engorde de camarón de agua dulce Desde la fase de huevo hasta adulto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('329', 'A', '0322003', 'Reproducción de peces de agua dulce desde la  fase de huevos hasta alevines');
INSERT INTO `sac_clasificacion_institucion` VALUES ('330', 'A', '0322004', 'Cría y engorde de peces de agua dulce Desde la fase de alevines hasta adulto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('331', 'A', '0322005', 'Reproducción, cría y engorde de peces de agua dulce Desde la fase de huevo hasta adulto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('332', 'A', '0322006', 'Reproducción, cría y engorde de peces, crustáceos y moluscos de agua dulce');
INSERT INTO `sac_clasificacion_institucion` VALUES ('333', 'A', '0322007', 'Reproducción, cría de peces y otros animales acuáticos ornamentales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('334', 'A', '0322008', 'Cría de ranas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('335', 'A', '033', 'SERVICIOS DE APOYO A LA PESCA Y ACUICULTURA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('336', 'A', '0330', 'SERVICIOS DE APOYO A LA PESCA Y ACUICULTURA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('337', 'A', '03300', 'Servicios de apoyo a la pesca y acuicultura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('338', 'A', '0330001', 'Servicios relacionados con la pesca de mar y de agua dulce y con criaderos de peces y granjas piscícolas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('339', 'B', 'B', 'EXPLOTACIÓN DE MINAS Y CANTERAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('340', 'B', '05', 'EXTRACCIÓN  CARBÓN  DE  PIEDRA Y LIGNITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('341', 'B', '051', 'EXTRACCIÓN  DE CARBÓN  DE  PIEDRA ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('342', 'B', '0510', 'EXTRACCIÓN DE CARBÓN  DE  PIEDRA ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('343', 'B', '05100', 'Extracción de hulla ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('344', 'B', '052', 'EXTRACCIÓN  DE LIGNITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('345', 'B', '0520', 'EXTRACCIÓN  LIGNITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('346', 'B', '05200', 'Extracción  y aglomeración de  lignito');
INSERT INTO `sac_clasificacion_institucion` VALUES ('347', 'B', '06', 'EXTRACCIÓN DE PETRÓLEO CRUDO Y GAS NATURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('348', 'B', '061', 'EXTRACCIÓN DE PETRÓLEO CRUDO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('349', 'B', '0610', 'EXTRACCIÓN DE PETRÓLEO CRUDO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('350', 'B', '06100', 'Extracción de petróleo crudo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('351', 'B', '062', 'EXTRACCIÓN DE GAS NATURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('352', 'B', '0620', 'EXTRACCIÓN DE GAS NATURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('353', 'B', '06200', 'Extracción de gas natural ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('354', 'B', '07', 'EXTRACCIÓN DE MINERALES METALÍFEROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('355', 'B', '071', 'EXTRACCIÓN DE MINERALES DE HIERRO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('356', 'B', '0710', 'EXTRACCIÓN DE MINERALES DE HIERRO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('357', 'B', '07100', 'Extracción de minerales  de hierro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('358', 'B', '072', 'EXTRACCIÓN DE MINERALES METALÍFEROS NO FERROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('359', 'B', '0721', 'EXTRACCIÓN DE MINERALES DE URANIO Y TORIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('360', 'B', '07210', 'Extracción de minerales de uranio y torio ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('361', 'B', '0729', 'EXTRACCIÓN DE OTROS MINERALES METALÍFEROS NO FERROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('362', 'B', '07290', 'Extracción de minerales metalíferos no ferrosos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('363', 'B', '0729001', 'Extracción de oro y plata');
INSERT INTO `sac_clasificacion_institucion` VALUES ('364', 'B', '08', 'EXPLOTACIÓN DE MINAS Y CANTERAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('365', 'B', '081', 'EXTRACCIÓN DE PIEDRA, ARENA Y ARCILLA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('366', 'B', '0810', 'EXTRACCIÓN DE PIEDRA, ARENA Y ARCILLA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('367', 'B', '08100', 'Extracción de piedra, arena y arcilla');
INSERT INTO `sac_clasificacion_institucion` VALUES ('368', 'B', '0810001', 'Explotación de canteras de piedra');
INSERT INTO `sac_clasificacion_institucion` VALUES ('369', 'B', '0810002', 'Explotación de graveras y canteras de arena');
INSERT INTO `sac_clasificacion_institucion` VALUES ('370', 'B', '0810003', 'Extracción de arcilla');
INSERT INTO `sac_clasificacion_institucion` VALUES ('371', 'B', '0810004', 'Extracción de cascajo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('372', 'B', '0810005', 'Explotación de minas de piedra caliza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('373', 'B', '0810006', 'Extracción de escoria volcánica, adoquines y para uso ornamental de parques, jardines y otros usos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('374', 'B', '0810007', 'Extracción de granito');
INSERT INTO `sac_clasificacion_institucion` VALUES ('375', 'B', '0810008', 'Extracción de mármol');
INSERT INTO `sac_clasificacion_institucion` VALUES ('376', 'B', '0810009', 'Extracción de yeso');
INSERT INTO `sac_clasificacion_institucion` VALUES ('377', 'B', '089', 'EXPLOTACIÓN DE MINAS Y CANTERAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('378', 'B', '0891', 'EXTRACCIÓN DE MINERALES PARA LA FABRICACIÓN DE ABONOS   Y PRODUCTOS QUÍMICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('379', 'B', '08910', 'Extracción  de minerales para la fabricación de abonos  y productos químicos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('380', 'B', '0892', 'EXTRACCIÓN  DE TURBA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('381', 'B', '08920', 'Extracción y aglomeración de turba');
INSERT INTO `sac_clasificacion_institucion` VALUES ('382', 'B', '0893', 'EXTRACCIÓN DE SAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('383', 'B', '08930', 'Extracción de sal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('384', 'B', '0893001', 'Extracción de sal mediante evaporación al sol de agua de mar y cocimiento de la salmuera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('385', 'B', '0899', 'EXPLOTACIÓN DE MINAS Y CANTERAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('386', 'B', '08990', 'Explotación de otras minas y canteras n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('387', 'B', '0899001', 'Extracción de piedra pómez');
INSERT INTO `sac_clasificacion_institucion` VALUES ('388', 'B', '0899002', 'Extracción de piedra abrasiva');
INSERT INTO `sac_clasificacion_institucion` VALUES ('389', 'B', '0899003', 'Extracción de perlita');
INSERT INTO `sac_clasificacion_institucion` VALUES ('390', 'B', '0899004', 'Extracción de puzolana');
INSERT INTO `sac_clasificacion_institucion` VALUES ('391', 'B', '0899005', 'Extracción de carbón mineral');
INSERT INTO `sac_clasificacion_institucion` VALUES ('392', 'B', '09', 'ACTIVIDADES DE SERVICIOS DE APOYO A LA EXPLOTACIÓN DE MINAS Y CANTERAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('393', 'B', '091', 'ACTIVIDADES DE APOYO A LA EXTRACCIÓN DE PETRÓLEO Y GAS NATURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('394', 'B', '0910', 'ACTIVIDADES DE APOYO A LA EXTRACCIÓN DE PETRÓLEO Y GAS NATURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('395', 'B', '09100', 'Actividades  de apoyo a la extracción de petróleo y gas natural ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('396', 'B', '099', 'ACTIVIDADES DE APOYO PARA  OTRAS ACTIVIDADES  DE EXPLOTACION  DE MINAS Y CANTERAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('397', 'B', '0990', 'ACTIVIDADES DE APOYO A LA EXPLOTACIÓN DE OTRAS MINAS Y CANTERAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('398', 'B', '09900', 'Actividades de apoyo a la  explotación de minas y canteras ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('399', 'C', 'C', 'INDUSTRIAS MANUFACTURERAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('400', 'C', '10', 'ELABORACIÓN DE PRODUCTOS ALIMENTICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('401', 'C', '101', 'ELABORACION  Y CONSERVACIÓN DE CARNE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('402', 'C', '1010', 'ELABORACION  Y CONSERVACIÓN DE CARNE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('403', 'C', '10101', 'Servicio de rastros y mataderos  de bovinos y porcinos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('404', 'C', '1010101', 'Servicio de rastros y mataderos de bovinos y porcinos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('405', 'C', '10102', 'Matanza y procesamiento de bovinos y porcinos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('406', 'C', '1010201', 'Matanza y procesamiento de bovinos y porcinos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('407', 'C', '10103', 'Matanza y procesamientos de aves de corral ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('408', 'C', '1010301', 'Mataderos avícolas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('409', 'C', '10104', 'Elaboración y conservación de embutidos y tripas naturales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('410', 'C', '1010401', 'Elaboración y conservación de embutidos y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('411', 'C', '1010402', 'Preparación de tripas naturales para embutidos y salchichas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('412', 'C', '10105', 'Servicios de conservación y empaque de carnes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('413', 'C', '1010501', 'Preparación, empaque, refrigeración y congelación de carne bovina, porcina y de aves de corral');
INSERT INTO `sac_clasificacion_institucion` VALUES ('414', 'C', '1010502', 'Preparación y conservación de carne mediante salado, secado, deshidratado, y ahumado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('415', 'C', '1010503', 'Preparación, conservación y enlatado de carne');
INSERT INTO `sac_clasificacion_institucion` VALUES ('416', 'C', '10106', 'Elaboración y conservación de grasas y aceites animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('417', 'C', '1010601', 'Fundición de cebo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('418', 'C', '1010602', 'Extracción y refinación de manteca de cerdo, bovino, porcino, ovino, caprino, aves y otras grasas comestibles de origen animal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('419', 'C', '1010603', 'Fabricación de aceites y grasas no comestibles de origen animal, excluyendo bovinos, porcinos, ovinos, caprinos, conejos y aves');
INSERT INTO `sac_clasificacion_institucion` VALUES ('420', 'C', '10107', 'Servicios de molienda de carne');
INSERT INTO `sac_clasificacion_institucion` VALUES ('421', 'C', '1010701', 'Molienda de carne');
INSERT INTO `sac_clasificacion_institucion` VALUES ('422', 'C', '10108', 'Elaboración de productos de carne n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('423', 'C', '1010801', 'Producción de harinas  de carne y de los despojos de carne');
INSERT INTO `sac_clasificacion_institucion` VALUES ('424', 'C', '1010802', 'Producción de carnes y productos de carne excepto de ganado bovino, porcino, ovino y de aves. Incluye producción de carne de garrobo y sus productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('425', 'C', '102', 'PROCESAMIENTO Y CONSERVACIÓN DE PESCADO, CRUSTÁCEOS Y MOLUSCOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('426', 'C', '1020', 'PROCESAMIENTO Y CONSERVACIÓN DE PESCADO, CRUSTÁCEOS Y MOLUSCOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('427', 'C', '10201', 'Procesamiento y conservación de pescado, crustáceos y moluscos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('428', 'C', '1020101', 'Preparación, refrigeración y congelación de pescado, crustáceos, moluscos y otros productos acuáticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('429', 'C', '1020102', 'Preparación y conservación de pescado, crustáceos, moluscos y otros productos acuáticos mediante salado, secado, deshidratado, ahumado, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('430', 'C', '1020103', 'Preparación, conservación y envase (enlatado) de pescado, crustáceos, moluscos y otros productos acuáticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('431', 'C', '10209', 'Fabricación de productos de pescado n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('432', 'C', '1020901', 'Fabricación de harina de pescado y otros productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('433', 'C', '103', 'ELABORACIÓN Y CONSERVACIÓN DE FRUTAS, LEGUMBRES Y HORTALIZAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('434', 'C', '1030', 'ELABORACIÓN Y CONSERVACIÓN DE FRUTAS, LEGUMBRES Y HORTALIZAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('435', 'C', '10301', 'Elaboración de jugos de frutas y hortalizas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('436', 'C', '1030101', 'Procesamiento, conservación y envase de jugos de frutas y legumbres');
INSERT INTO `sac_clasificacion_institucion` VALUES ('437', 'C', '10302', 'Elaboración y envase de jaleas, mermeladas y frutas deshidratadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('438', 'C', '1030201', 'Elaboración y envase de jaleas, mermeladas y frutas deshidratadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('439', 'C', '10309', 'Elaboración de productos de frutas y hortalizas n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('440', 'C', '1030901', 'Procesamiento, conservación y envase de encurtidos, puré, pastas, salsas y productos similares de hortalizas y legumbres');
INSERT INTO `sac_clasificacion_institucion` VALUES ('441', 'C', '1030902', 'Procesamiento, conservación y envase de extractos, esencias y concentrados de frutas y hortalizas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('442', 'C', '104', 'ELABORACIÓN DE ACEITES Y GRASA DE ORIGEN VEGETAL Y ANIMAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('443', 'C', '1040', 'ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN VEGETAL Y ANIMAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('444', 'C', '10401', 'Fabricación de aceites y grasas vegetales y animales comestibles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('445', 'C', '1040101', 'Fabricación de aceites y grasas comestibles de origen vegetal y animal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('446', 'C', '1040102', 'Extracción y procesamiento de aceite de pescado y de mamiferos marinos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('447', 'C', '10402', 'Fabricación de aceites y grasas vegetales y animales no comestibles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('448', 'C', '1040201', 'Fabricación de aceites y grasas no comestibles de origen vegetal y animal, excluyendo la extracción de aceites esenciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('449', 'C', '10409', 'Servicio de maquilado de aceites');
INSERT INTO `sac_clasificacion_institucion` VALUES ('450', 'C', '1040901', 'Maquilado de aceites');
INSERT INTO `sac_clasificacion_institucion` VALUES ('451', 'C', '105', 'ELABORACIÓN DE PRODUCTOS LÁCTEOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('452', 'C', '1050', 'ELABORACIÓN DE PRODUCTOS LÁCTEOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('453', 'C', '10501', 'Fabricación de productos lácteos excepto sorbetes y quesos sustitutos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('454', 'C', '1050101', 'Fabricación de productos lácteos (excepto sorbetes y quesos sustitutos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('455', 'C', '10502', 'Fabricación de sorbetes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('456', 'C', '1050201', 'Fabricación de sorbetes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('457', 'C', '1050202', 'Fabricación de paletas , yogur y otros helados ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('458', 'C', '10503', 'Fabricación de quesos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('459', 'C', '1050301', 'Fabricación de quesos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('460', 'C', '106', 'ELABORACIÓN DE PRODUCTOS DE MOLINERÍA, ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('461', 'C', '1061', 'ELABORACIÓN DE PRODUCTOS DE MOLINERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('462', 'C', '10611', 'Molienda de cereales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('463', 'C', '1061101', 'Fabricación de harina de trigo y harinas preparadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('464', 'C', '1061102', 'Fabricación de harina de maíz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('465', 'C', '1061103', 'Fabricación de harina de arroz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('466', 'C', '1061104', 'Fabricación de harina de otros granos y semillas de origen vegetal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('467', 'C', '1061105', 'Fabricación de harina de soya, leche y otros harinas preparadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('468', 'C', '10612', 'Elaboración de cereales para el desayuno y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('469', 'C', '1061201', 'Elaboración de hojuelas, insuflado, tostado, macerado y perlado de cereales y otros granos utilizados como alimento humano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('470', 'C', '10613', 'Servicios de beneficiado de productos agrícolas n.c.p. (excluye Beneficio de azúcar rama 1072 y beneficio de café rama 0163)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('471', 'C', '1061301', 'Beneficiado de arroz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('472', 'C', '1062', 'ELABORACIÓN DE ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('473', 'C', '10621', 'Fabricación de almidón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('474', 'C', '1062101', 'Fabricación de almidón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('475', 'C', '10628', 'Servicio de molienda de maíz húmedo molino para nixtamal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('476', 'C', '1062801', 'Servicio de molienda de maíz húmedo molino para nixtamal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('477', 'C', '107', 'ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('478', 'C', '1071', 'ELABORACIÓN DE PRODUCTOS DE PANADERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('479', 'C', '10711', 'Elaboración de tortillas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('480', 'C', '1071101', 'Elaboración de tortillas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('481', 'C', '10712', 'Fabricación de pan, galletas y barquillos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('482', 'C', '1071201', 'Fabricación de pan y galletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('483', 'C', '1071202', 'Fabricación de conos y barquillos para sorbete y otros productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('484', 'C', '10713', 'Fabricación de repostería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('485', 'C', '1071301', 'Fabricación de repostería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('486', 'C', '1072', 'ELABORACIÓN DE AZÚCAR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('487', 'C', '10721', 'Ingenios azucareros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('488', 'C', '1072101', 'Fabricación y refinación de azúcar de caña y otros subproductos (Ingenios azucareros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('489', 'C', '10722', 'Molienda de caña de azúcar para la elaboración de dulces');
INSERT INTO `sac_clasificacion_institucion` VALUES ('490', 'C', '1072201', 'Molienda de caña de azúcar para la elaboración de dulce de panela y otros productos (trapiches)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('491', 'C', '10723', 'Elaboración de jarabes de azúcar y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('492', 'C', '1072301', 'Elaboración de jarabes de azúcar y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('493', 'C', '10724', 'Maquilado de azúcar de caña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('494', 'C', '1072401', 'Maquilado de azúcar de caña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('495', 'C', '1073', 'ELABORACIÓN DE CACAO, CHOCOLATE Y PRODUCTOS DE CONFITERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('496', 'C', '10730', 'Fabricación de cacao, chocolates y productos de confitería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('497', 'C', '1073001', 'Fabricación de dulces, gomas de mascar y preparación de  frutas y semillas confitadas, endulzadas o en conserva.(dulcería y confitería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('498', 'C', '1073002', 'Fabricación de productos de cacao');
INSERT INTO `sac_clasificacion_institucion` VALUES ('499', 'C', '1073008', 'Maquilado de dulces');
INSERT INTO `sac_clasificacion_institucion` VALUES ('500', 'C', '1074', 'ELABORACIÓN DE MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINÁCEOS SIMILARES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('501', 'C', '10740', 'Elaboración de macarrones, fideos, y productos farináceos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('502', 'C', '1074001', 'Fabricación de pastas alimenticias (fideos, macarrones, coditos, pasta para lasaña, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('503', 'C', '1075', 'ELABORACIÓN DE COMIDAS Y PLATOS PREPARADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('504', 'C', '10750', 'Elaboración de comidas y platos preparados para la reventa en locales y/o para exportación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('505', 'C', '1075001', 'Elaboración de comidas preparadas para la venta en supermercados y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('506', 'C', '1075002', 'Elaboración de pupusas, tamales y otras comidas regionales para la reventa en supermercados (debe estar con tratamientos de conservación)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('507', 'C', '1079', 'ELABORACIÓN DE PRODUCTOS ALIMENTICIOS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('508', 'C', '10791', 'Elaboración de productos de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('509', 'C', '1079101', 'Tostaduría y molienda de café');
INSERT INTO `sac_clasificacion_institucion` VALUES ('510', 'C', '1079102', 'Fabricación de café soluble instantáneo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('511', 'C', '10792', 'Elaboración de especies, sazonadores y condimentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('512', 'C', '1079201', 'Elaboración de especies, sazonadores y condimentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('513', 'C', '1079202', 'Elaboración de sal para uso alimenticio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('514', 'C', '1079203', 'Yodificación y refinación de sal comestible');
INSERT INTO `sac_clasificacion_institucion` VALUES ('515', 'C', '10793', 'Elaboración de sopas, cremas y consomé');
INSERT INTO `sac_clasificacion_institucion` VALUES ('516', 'C', '1079301', 'Elaboración de sopas, cremas, consomé en polvo y en pastas. A base de concentrados de carne, mariscos y  otros  ingredientes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('517', 'C', '10794', 'Fabricación de bocadillos tostados y/o fritos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('518', 'C', '1079401', 'Fabricación de bocadillos tostados, fritos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('519', 'C', '10799', 'Elaboración de productos alimenticios n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('520', 'C', '1079901', 'Elaboración de levaduras en polvo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('521', 'C', '1079902', 'Fabricación de gelatina comestible, flan y otros productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('522', 'C', '1079903', 'Procesamiento y conservación de huevos sin cáscara, mediante pasteurizado, congelado, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('523', 'C', '1079904', 'Elaboración de  alimentos en polvo principalmente para refrescos. (horchata, cebada, chilate y otros similares)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('524', 'C', '1079905', 'Elaboración de Colorantes Alimenticios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('525', 'C', '1079906', 'Elaboracion de té');
INSERT INTO `sac_clasificacion_institucion` VALUES ('526', 'C', '1079907', 'Elaboración de sucedáneos no lácteos de leche y de queso (quesos sustitutos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('527', 'C', '108', 'ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('528', 'C', '1080', 'ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('529', 'C', '10800', 'Elaboración de alimentos preparados para animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('530', 'C', '1080001', 'Fabricación de alimentos para ganado y otros animales de granjas  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('531', 'C', '1080002', 'Elaboración de alimentos para  mascotas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('532', 'C', '1080003', 'Fabricación de alimento para animales acuáticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('533', 'C', '11', 'ELABORACIÓN DE BEBIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('534', 'C', '110', 'ELABORACIÓN DE BEBIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('535', 'C', '1101', 'DESTILACIÓN, RECTIFICACIÓN Y MEZCLA DE BEBIDAS ALCOHÓLICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('536', 'C', '11012', 'Fabricación de aguardiente y licores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('537', 'C', '1101201', 'Fabricación de aguardiente');
INSERT INTO `sac_clasificacion_institucion` VALUES ('538', 'C', '1101202', 'Fabricación de licores rectificados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('539', 'C', '1102', 'ELABORACIÓN DE VINOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('540', 'C', '11020', 'Elaboración de vinos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('541', 'C', '1102001', 'Elaboración de vinos, sidras, rompope, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('542', 'C', '1103', 'ELABORACIÓN DE BEBIDAS MALTEADAS Y DE MALTA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('543', 'C', '11030', 'Fabricación de cerveza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('544', 'C', '1103001', 'Fabricación de cerveza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('545', 'C', '1104', 'ELABORACIÓN DE BEBIDAS NO ALCOHÓLICAS; PRODUCCIÓN DE AGUA MINERAL Y OTRAS AGUAS EMBOTELLADAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('546', 'C', '11041', 'Fabricación de aguas gaseosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('547', 'C', '1104101', 'Fabricación de aguas gaseosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('548', 'C', '11042', 'Fabricación y envasado de agua');
INSERT INTO `sac_clasificacion_institucion` VALUES ('549', 'C', '1104201', 'Fabricación y envasado de agua purificada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('550', 'C', '11043', 'Elaboración de refrescos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('551', 'C', '1104301', 'Fabricación de bebidas refrescantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('552', 'C', '11048', 'Maquilado de aguas gaseosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('553', 'C', '1104801', 'Maquilado de aguas gaseosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('554', 'C', '12', 'ELABORACIÓN DE PRODUCTOS DE TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('555', 'C', '120', 'ELABORACIÓN DE PRODUCTOS DE TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('556', 'C', '1200', 'ELABORACIÓN DE PRODUCTOS DE TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('557', 'C', '12000', 'Elaboración de productos de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('558', 'C', '1200001', 'Fabricación de cigarrillos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('559', 'C', '1200002', 'Elaboración de cigarros (puros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('560', 'C', '13', 'FABRICACIÓN DE PRODUCTOS TEXTILES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('561', 'C', '131', 'HILATURA, TEJEDURA Y ACABADO DE PRODUCTOS TEXTILES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('562', 'C', '1311', 'PREPARACIÓN E HILATURA DE FIBRA TEXTILES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('563', 'C', '13111', 'Preparación de fibras textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('564', 'C', '1311101', 'Cardado y peinado de todo tipo de fibras vegetales, animales o artificiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('565', 'C', '13112', 'Fabricación de hilados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('566', 'C', '1311201', 'Fabricación de hilos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('567', 'C', '1312', 'TEJEDURA DE PRODUCTOS TEXTILES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('568', 'C', '13120', 'Fabricación de telas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('569', 'C', '1312001', 'Fabricación de telas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('570', 'C', '1312002', 'Hilanderías y telares a mano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('571', 'C', '1313', 'ACABADO DE PRODUCTOS TEXTILES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('572', 'C', '13130', 'Acabado de productos textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('573', 'C', '1313001', 'Acabado de productos textiles mediante procesos de: blanqueado, teñido, plisado, encogimiento, estampado de telas, etc. No producido en la misma unidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('574', 'C', '1313002', 'Estampado serigráfico de productos textiles y prendas de vestir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('575', 'C', '139', 'FABRICACIÓN DE OTROS PRODUCTOS TEXTILES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('576', 'C', '1391', 'FABRICACIÓN DE TEJIDOS DE PUNTO Y GANCHILLO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('577', 'C', '13910', 'Fabricación de tejidos de punto y  ganchillo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('578', 'C', '1391001', 'Fabricación de telas de tejido de punto y ganchillo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('579', 'C', '1391002', 'Fabricación de paños de tejido de punto y ganchillo para secar platos, repasadores de pisos y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('580', 'C', '1391003', 'Fabricación de toallas y otros artículos (cuando son fabricados por la misma unidad que produce la tela,  por considerarse una actividad auxiliar de la tejedura)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('581', 'C', '1392', 'FABRICACIÓN DE ARTÍCULOS CONFECCIONADOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('582', 'C', '13921', 'Fabricación de productos textiles para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('583', 'C', '1392101', 'Fabricación de manteles  de tela y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('584', 'C', '1392102', 'Fabricación de ropa de cama');
INSERT INTO `sac_clasificacion_institucion` VALUES ('585', 'C', '1392103', 'Fabricación de almohadas y cojines excepto de hule');
INSERT INTO `sac_clasificacion_institucion` VALUES ('586', 'C', '1392104', 'Fabricación de colchas de hilo y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('587', 'C', '1392105', 'Fabricación de toallas y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('588', 'C', '1392106', 'Fabricación de hamacas de tela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('589', 'C', '1392107', 'Fabricación de adornos de tela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('590', 'C', '1392108', 'Elaboración de mosquiteros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('591', 'C', '1392109', 'Fabricación de cortinas y otros artículos similares.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('592', 'C', '13922', 'Sacos, bolsas y otros artículos textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('593', 'C', '1392201', 'Fabricación de sacos y bolsas de henequén, kenaf, yute y sintéticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('594', 'C', '1392202', 'Fabricación de sacos y bolsas, mochilas de tela y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('595', 'C', '13929', 'Fabricación de artículos confeccionados con materiales textiles, excepto prendas de vestir n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('596', 'C', '1392901', 'Fabricación de toldos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('597', 'C', '1392902', 'Fabricación de otros artículos de tela: trapeadores, franela, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('598', 'C', '1392903', 'Fabricación de ropa de uso hospitalario ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('599', 'C', '1392904', 'Fabricacion de banderas, gallardetes y estandartes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('600', 'C', '1393', 'FABRICACIÓN DE TAPICES Y ALFOMBRAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('601', 'C', '13930', 'Fabricación de tapices y alfombras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('602', 'C', '1393001', 'Fabricación de tapices y alfombras mediante tejidos o trenzados; afelpados, etc. de hilados de lana, algodón y otras fibras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('603', 'C', '1394', 'FABRICACIÓN DE CUERDAS, CORDELES, BRAMANTES Y REDES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('604', 'C', '13941', 'Fabricación de cuerdas de henequén y otras fibras naturales( lazos, pitas).');
INSERT INTO `sac_clasificacion_institucion` VALUES ('605', 'C', '1394101', 'Fabricación de cuerdas de henequén y otras fibras ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('606', 'C', '1394102', 'Fabricación de cuerdas, cordeles, lazos, hilos de fibras sintéticas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('607', 'C', '13942', 'Fabricación de redes de diversos materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('608', 'C', '1394201', 'Fabricación de hamacas y manguillos de fibra de henequén y de otras fibras naturales y sintéticas ( nylon, poliéster, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('609', 'C', '1394202', 'Fabricación de redes para pescar y otros artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('610', 'C', '1394203', 'Fabricación de mallas para deporte y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('611', 'C', '1394204', 'Elaboración de redes utilizadas para depositar objetos, productos agrícolas y otra clase de artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('612', 'C', '13948', 'Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('613', 'C', '1394801', 'Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('614', 'C', '1399', 'FABRICACIÓN DE OTROS PRODUCTOS TEXTILES N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('615', 'C', '13991', 'Fabricación de adornos, etiquetas y otros artículos para prendas de vestir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('616', 'C', '1399101', 'Fabricación de adornos para la confección de vestidos y otras prendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('617', 'C', '1399102', 'Fabricación de etiquetas de tela y otros artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('618', 'C', '1399103', 'Fabricación de elástico y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('619', 'C', '1399104', 'Fabricación de cintas o cordones para zapatos, ribetes, fajitas para mochilas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('620', 'C', '13992', 'Servicio de bordados en artículos y prendas de tela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('621', 'C', '1399201', 'Bordados en artículos y prendas de tela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('622', 'C', '13999', 'Fabricación de productos textiles n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('623', 'C', '1399901', 'Fabricación de guata  y artículos del mismo material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('624', 'C', '1399902', 'Fabricación de mechas de materiales textiles trenzados o tejidos de diversos  materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('625', 'C', '1399903', 'Elaboración de insignias, marbetes y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('626', 'C', '1399904', 'Fabricación de telas bordadas en piezas, tiras y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('627', 'C', '1399905', 'Fabricación de telas impermeables bañadas, impregnadas o recubiertas con una lámina de hule (caucho), plástico y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('628', 'C', '1399906', 'Fabricación de cuero sintético');
INSERT INTO `sac_clasificacion_institucion` VALUES ('629', 'C', '1399907', 'Fabricación de tejidos de fieltro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('630', 'C', '1399908', 'Fabricación de lienzo de materiales textiles para pintores y para otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('631', 'C', '14', 'FABRICACIÓN DE PRENDAS DE VESTIR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('632', 'C', '141', 'FABRICACIÓN DE PRENDAS DE VESTIR, EXCEPTO PRENDAS DE PIEL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('633', 'C', '1410', 'FABRICACIÓN DE PRENDAS DE VESTIR, EXCEPTO PRENDAS DE PIEL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('634', 'C', '14101', 'Fabricación de ropa interior, para dormir y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('635', 'C', '1410101', 'Fabricación de ropa  interior para ambos sexos y para todas las edades');
INSERT INTO `sac_clasificacion_institucion` VALUES ('636', 'C', '1410102', 'Fabricación de ropa para dormir (pijamas, camisones, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('637', 'C', '14102', 'Fabricación de ropa para niños');
INSERT INTO `sac_clasificacion_institucion` VALUES ('638', 'C', '1410201', 'Fabricación de ropa para niños');
INSERT INTO `sac_clasificacion_institucion` VALUES ('639', 'C', '14103', 'Fabricación de prendas de vestir para ambos sexos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('640', 'C', '1410301', 'Fabricación de camisas (camisería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('641', 'C', '1410302', 'Fabricación de ropa de vestir para hombres pantalones y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('642', 'C', '1410303', 'Fabricación de prendas de vestir femenina');
INSERT INTO `sac_clasificacion_institucion` VALUES ('643', 'C', '1410304', 'Fabricación de ropa femenina para ocasiones especiales: primera comunión, 15 años, novias, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('644', 'C', '1410305', 'Fabricación de ropa para ambos sexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('645', 'C', '1410306', 'Fabricación de uniformes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('646', 'C', '14104', 'Confección de prendas a medida');
INSERT INTO `sac_clasificacion_institucion` VALUES ('647', 'C', '1410401', 'Sastrería (confección de trajes para hombre, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('648', 'C', '1410402', 'Costurería  (confección de vestidos a la medida, modas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('649', 'C', '14105', 'Fabricación de prendas de vestir para deportes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('650', 'C', '1410501', 'Fabricación de prendas de vestir para deporte (excepto de tejido de punto)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('651', 'C', '14106', 'Elaboración de artesanías de uso personal confeccionadas especialmente de materiales textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('652', 'C', '1410601', 'Elaboración de artesanías de uso personal confeccionadas especialmente de materiales textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('653', 'C', '14108', 'Maquilado de prendas de vestir, accesorios y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('654', 'C', '1410801', 'Maquilado de prendas de vestir, accesorios y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('655', 'C', '1410802', 'Maquilado de etiquetas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('656', 'C', '14109', 'Fabricación de prendas y accesorios de vestir n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('657', 'C', '1410901', 'Fabricación de gorros y gorras de todo tipo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('658', 'C', '1410902', 'Fabricación de sombreros de fieltro, tela, cuero y palma');
INSERT INTO `sac_clasificacion_institucion` VALUES ('659', 'C', '1410903', 'Fabricación de prendas de vestir y otros accesorios con telas impermeables. Sus piezas unidas por costura capas, ponchos, delantales plásticos, cuero, etc.  Se exceptúan las unidas por el uso de pegamentos o adhesivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('660', 'C', '1410904', 'Fabricación de accesorios de vestir y de uso personal: corbatas, corbatines, pañuelos, redecillas para el pelo, cinturones de todo tipo, guantes y mitones de cualquier material, etc.; se exceptúan los de uso para deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('661', 'C', '1410909', 'Fabricación de prendas de vestir n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('662', 'C', '142', 'FABRICACIÓN DE ARTÍCULOS DE PIEL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('663', 'C', '1420', 'FABRICACIÓN DE ARTÍCULOS DE PIEL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('664', 'C', '14200', 'Fabricación de Artículos de piel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('665', 'C', '1420001', 'Fabricación de prendas y accesorios de vestir de piel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('666', 'C', '143', 'FABRICACIÓN DE PRENDAS DE PUNTO Y GANCHILLO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('667', 'C', '1430', 'FABRICACIÓN DE PRENDAS DE PUNTO Y GANCHILLO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('668', 'C', '14301', 'Fabricación de calcetines, calcetas, medias (panty house) y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('669', 'C', '1430101', 'Fabricación de calcetines y calcetas y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('670', 'C', '1430102', 'Fabricación de medias (panty house) y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('671', 'C', '14302', 'Fabricación de ropa interior de tejido de punto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('672', 'C', '1430201', 'Fabricación de ropa interior de tejido de punto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('673', 'C', '14309', 'Fabricación de prendas de vestir de tejido de punto n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('674', 'C', '1430901', 'Fabricación de prendas de vestir de tejido de punto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('675', 'C', '1430902', 'Fabricación de ropa para deporte de tejido de punto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('676', 'C', '1430903', 'Fabricación de accesorios de vestir de tejido de punto (corbatas, gorros, guantes, mitones y otros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('677', 'C', '15', 'FABRICACIÓN DE CUEROS Y PRODUCTOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('678', 'C', '151', 'CURTIDO Y ADOBO DE CUEROS; ADOBO Y TEÑIDO DE PIELES; FABRICACIÓN DE MALETAS, BOLSOS DE MANO ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('679', 'C', '1511', 'CURTIDO Y ADOBO DE CUEROS; ADOBO Y TEÑIDO DE PIELES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('680', 'C', '15110', 'Curtido y adobo de cueros; adobo y teñido de pieles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('681', 'C', '1511001', 'Curtido y adobo de cueros (tenerías)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('682', 'C', '1511002', 'Adobo y teñido de pieles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('683', 'C', '1512', 'FABRICACIÓN DE MALETAS, BOLSOS DE MANO Y ARTÍCULOS SIMILARES Y DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('684', 'C', '15121', 'Fabricación de maletas, bolsos de mano y otros artículos de marroquinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('685', 'C', '1512101', 'Fabricación de artículos confeccionados  de cuero natural, sintético y otros materiales: bolsos de mano y artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('686', 'C', '1512102', 'Fabricación de valijas, maletas y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('687', 'C', '1512103', 'Fabricación de carteras de fibra de henequén y otras fibras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('688', 'C', '15122', 'Fabricación de monturas, accesorios y vainas (talabartería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('689', 'C', '1512201', 'Fabricación de monturas, accesorios y vainas (talabartería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('690', 'C', '15123', 'Elaboración de artesanías principalmente de cuero natural y sintético');
INSERT INTO `sac_clasificacion_institucion` VALUES ('691', 'C', '1512301', 'Fabricacion de artesanías principalmente de cuero natural y sintético');
INSERT INTO `sac_clasificacion_institucion` VALUES ('692', 'C', '15128', 'Maquilado de artículos de cuero natural, sintético y de otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('693', 'C', '1512801', 'Maquilado de artículos de cuero natural, sintético y de otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('694', 'C', '152', 'FABRICACIÓN DE CALZADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('695', 'C', '1520', 'FABRICACIÓN DE CALZADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('696', 'C', '15201', 'Fabricación de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('697', 'C', '1520101', 'Fabricación de calzado de cuero natural y sintético, lona y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('698', 'C', '1520102', 'Fabricación de calzado para  deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('699', 'C', '1520103', 'Fabricación de calzado de hule , plástico y otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('700', 'C', '15202', 'Fabricación de partes y accesorios de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('701', 'C', '1520201', 'Fabricación de partes y accesorios de calzado:  tacones, cerquillos, ribetes, plantillas, suelas de cuero.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('702', 'C', '15208', 'Maquilado de calzado y partes de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('703', 'C', '1520801', 'Maquilado de calzado y partes de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('704', 'C', '16', 'PRODUCCIÓN DE MADERA Y FABRICACIÓN DE PRODUCTOS DE MADERA Y CORCHO EXCEPTO MUEBLES; FABRICACIÓN DE ARTÍCULOS DE PAJA Y DE MATERIALES TRENZABLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('705', 'C', '161', 'ASERRADERO Y ACEPILLADURA DE MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('706', 'C', '1610', 'ASERRADERO Y ACEPILLADURA DE MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('707', 'C', '16100', 'Aserradero y acepilladura de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('708', 'C', '1610001', 'Aserradero de madera excepto manual');
INSERT INTO `sac_clasificacion_institucion` VALUES ('709', 'C', '1610002', 'Aserrado manual de trozas de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('710', 'C', '1610003', 'Impregnación y tratamiento químico de la madera, con preservantes y otras sustancias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('711', 'C', '1610004', 'Fabricación de harina y partículas de madera y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('712', 'C', '162', 'FABRICACIÓN DE PRODUCTOS DE MADERA, CORCHO, PAJA Y MATERIALES TRENZABLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('713', 'C', '1621', 'FABRICACIÓN DE HOJAS DE MADERA PARA ENCHAPADO Y  TABLEROS A BASE DE MADERA ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('714', 'C', '16210', 'Fabricación de madera laminada, terciada, enchapada y contrachapada , paneles para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('715', 'C', '1621001', 'Fabricación de madera laminada, terciada, enchapada y contrachapada, paneles para la construcción (plywood, durapanel, fibrolit, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('716', 'C', '1622', 'FABRICACIÓN DE PARTES Y PIEZAS DE CARPINTERÍA PARA EDIFICIOS Y CONSTRUCCIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('717', 'C', '16220', 'Fabricación de partes y piezas de carpintería para edificios y construcciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('718', 'C', '1622001', 'Fabricación de partes y piezas de carpintería para edificios y construcciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('719', 'C', '1622002', 'Producción de componentes de edificios prefabricados principalmente de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('720', 'C', '1623', 'FABRICACIÓN DE RECIPIENTES DE MADERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('721', 'C', '16230', 'Fabricación de envases y recipientes de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('722', 'C', '1623001', 'Fabricación de cajas, cajones, jaulas, barriles y otros envases de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('723', 'C', '1629', 'Fabricación de artesanías de madera, semillas,  materiales trenzables');
INSERT INTO `sac_clasificacion_institucion` VALUES ('724', 'C', '16291', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('725', 'C', '16292', 'Fabricación de artesanías de madera, semillas, materiales trenzables');
INSERT INTO `sac_clasificacion_institucion` VALUES ('726', 'C', '1629201', 'Fabricación de artesanías de madera, semillas, materiales trenzables');
INSERT INTO `sac_clasificacion_institucion` VALUES ('727', 'C', '16299', 'Fabricación de productos de madera, corcho, paja y materiales trenzables n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('728', 'C', '1629901', 'Fabricación de marcos de madera para cuadros, espejos y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('729', 'C', '1629902', 'Fabricación de estatuas, imágenes o figuras eclesiásticas de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('730', 'C', '1629903', 'Fabricación de mangos para objetos y herramientas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('731', 'C', '1629904', 'Fabricación de hormas, plataformas, tacones, y tensores de madera para calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('732', 'C', '1629905', 'Fabricación de pequeños artículos de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('733', 'C', '1629906', 'Fabricación de artículos de materiales trenzables (cestos de mimbre, esterillas, etc.); excepto muebles y artesanías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('734', 'C', '1629907', 'Fabricacion  de estuches y exhibidores de madera para joyas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('735', 'C', '17', 'FABRICACIÓN DE PAPEL Y DE PRODUCTOS DE PAPEL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('736', 'C', '170', 'FABRICACIÓN DE PAPEL Y PRODUCTOS DE PAPEL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('737', 'C', '1701', 'FABRICACIÓN DE PASTA DE MADERA, PAPEL Y CARTÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('738', 'C', '17010', 'Fabricación de pasta de madera, papel y cartón; fabricación de papel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('739', 'C', '1701001', 'Fabricación de pasta de papel blanqueada, semiblanqueada o desblanqueada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('740', 'C', '1701002', 'Fabricación de pasta: de madera, de desechos de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('741', 'C', '1701003', 'Fabricación de papel revestido, recubierto e impregnado satinado, transparente, traslucidos, impermeables a las grasas, pergaminos, vegetal, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('742', 'C', '1702', 'FABRICACIÓN DE PAPEL Y CARTÓN ONDULADO Y DE ENVASES DE PAPEL CARTÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('743', 'C', '17020', 'Fabricación de papel y cartón ondulado y envases de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('744', 'C', '1702001', 'Fabricación de papel, cartón ondulado o envases del mismo material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('745', 'C', '1702002', 'Fabricación de cartón y artículos de cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('746', 'C', '1702003', 'Fabricación de bolsas, envases, empaques, embalajes y otros artículos de toda clase de papel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('747', 'C', '1702004', 'Fabricación de papel o cartón engomado y adhesivo de diferentes formas, tamaños y usos. En forma de: cintas, rollos, etiquetas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('748', 'C', '1709', 'FABRICACIÓN DE OTROS  ARTÍCULOS DE PAPEL Y CARTÓN ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('749', 'C', '17091', 'Fabricación de artículos de papel y cartón de uso personal y doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('750', 'C', '1709101', 'Fabricación de artículos desechables de papel y cartón: conos, vasos, platos, pajillas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('751', 'C', '1709102', 'Fabricación de artículos desechables de uso personal y doméstico ; papel higiénico, servilletas, toallas de cocina, pañuelos, toallas sanitarias, pañales para bebés y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('752', 'C', '17092', 'Fabricación de productos de papel n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('753', 'C', '1709201', 'Fabricación de papel para imprimir, escribir y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('754', 'C', '1709202', 'Fabricación de papel carbón, autocopia y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('755', 'C', '1709203', 'Fabricación de papeles y cartones para impresión de etiquetas, sobres de correspondencia, carpetas (fólder), fundas y tarjetas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('756', 'C', '1709204', 'Fabricación de artículos de pulpa de papel, cartón y pasta de papel moldeado: bobinas, carretes, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('757', 'C', '18', 'IMPRESIÓN Y REPRODUCCIÓN DE GRABACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('758', 'C', '181', 'IMPRESIÓN Y ACTIVIDADES DE SERVICIOS RELACIONADAS CON LA  IMPRESIÓN ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('759', 'C', '1811', 'ACTIVIDADES DE IMPRESIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('760', 'C', '18110', 'Impresión ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('761', 'C', '1811001', 'Imprentas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('762', 'C', '1811002', 'Impresión de anuncios  publicitarios ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('763', 'C', '1811003', 'Impresión de bolsas, empaques  de cualquier material ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('764', 'C', '1811004', 'Impresión y elaboracion de cuadernos y libretas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('765', 'C', '1811005', 'Impresión de etiquetas y códigos de barra');
INSERT INTO `sac_clasificacion_institucion` VALUES ('766', 'C', '1812', 'ACTIVIDADES DE SERVICIOS  RELACIONADOS CON LA IMPRESIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('767', 'C', '18120', 'Servicios relacionados con la impresión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('768', 'C', '1812001', 'Encuadernaciones y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('769', 'C', '1812002', 'Corte de papel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('770', 'C', '1812003', 'Estampado y serigrafía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('771', 'C', '1812004', 'Litografía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('772', 'C', '1812005', 'Servicios de artes gráficas: procesos de fotomecánica, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('773', 'C', '182', 'REPRODUCCIÓN DE GRABACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('774', 'C', '1820', 'REPRODUCCIÓN DE GRABACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('775', 'C', '18200', 'Reproducción de grabaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('776', 'C', '1820001', 'Reproducción de grabaciones a partir de copias matrices de : cintas magnetofónicas, videocintas, discos gramofónicos,  etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('777', 'C', '1820002', 'Reproducción de microfilm');
INSERT INTO `sac_clasificacion_institucion` VALUES ('778', 'C', '19', 'FABRICACIÓN DE COQUE Y DE PRODUCTOS DE LA REFINACIÓN DE PETRÓLEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('779', 'C', '191', 'FABRICACIÓN DE PRODUCTOS DE HORNOS DE COQUE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('780', 'C', '1910', 'FABRICACIÓN DE PRODUCTOS DE HORNOS DE COQUE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('781', 'C', '19100', 'Fabricación de productos de hornos de coque');
INSERT INTO `sac_clasificacion_institucion` VALUES ('782', 'C', '1910001', 'Fabricación de alquitrán');
INSERT INTO `sac_clasificacion_institucion` VALUES ('783', 'C', '1910002', 'Fabricación de productos de alquitrán');
INSERT INTO `sac_clasificacion_institucion` VALUES ('784', 'C', '192', 'FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('785', 'C', '1920', 'FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('786', 'C', '19201', 'Fabricación de combustible');
INSERT INTO `sac_clasificacion_institucion` VALUES ('787', 'C', '1920101', 'Fabricación de productos derivados de la refinación de petróleo:   combustible para vehículos, aviones, gas propano, butano y asfalto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('788', 'C', '19202', 'Fabricación de aceites y lubricantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('789', 'C', '1920201', 'Fabricación de aceites y grasas lubricantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('790', 'C', '1920202', 'Fabricación de productos de asfalto y mezclas asfálticas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('791', 'C', '20', 'FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('792', 'C', '201', 'FABRICACIÓN DE SUSTANCIAS QUÍMICAS BÁSICAS, ABONOS Y COMPUESTOS DE NITRÓGENO; PLÁSTICO Y CAUCHO SINTÉTICO EN FORMA PRIMARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('793', 'C', '2011', 'FABRICACIÓN DE SUSTANCIAS QUÍMICAS BÁSICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('794', 'C', '20111', 'Fabricación de materias primas para la fabricación de colorantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('795', 'C', '2011101', 'Fabricación de materias colorantes de origen vegetal y animal y  colorantes orgánicos sintéticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('796', 'C', '2011102', 'Fabricación de pigmentos colorantes y otros compuestos químicos que contienen colorantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('797', 'C', '2011103', 'Fabricación de materias tintóreas y colorantes para teñir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('798', 'C', '20112', 'Fabricación de materiales curtientes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('799', 'C', '2011201', 'Fabricación de productos curtientes naturales y sintéticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('800', 'C', '20113', 'Fabricación de gases industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('801', 'C', '2011301', 'Fabricación de gases industriales, incluyendo gases elementales: aire líquido, aire comprimido, acetileno, gases refrigerantes, mezclas de gases industriales, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('802', 'C', '2011302', 'Fabricación de hielo seco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('803', 'C', '20114', 'Fabricación de alcohol etílico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('804', 'C', '2011401', 'Fabricación de alcohol etílico ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('805', 'C', '2011402', 'Maquilado de alcohol etílico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('806', 'C', '20119', 'Fabricación de sustancias químicas básicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('807', 'C', '2011901', 'Fabricación de sustancias químicas orgánicas básicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('808', 'C', '2011902', 'Fabricación de sustancias químicas inorgánicas básicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('809', 'C', '2011903', 'Elaboración de carbón vegetal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('810', 'C', '2011909', 'Fabricación de otros elementos químicos excepto metales comunes, metales preciosos  y elementos isótopos y otros compuestos radioactivos para combustible nuclear');
INSERT INTO `sac_clasificacion_institucion` VALUES ('811', 'C', '2011999', 'Fabricación de otros productos químicos básicos para la industria manufacturera no clasificada en otra parte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('812', 'C', '2012', 'FABRICACIÓN DE ABONOS Y COMPUESTOS DE NITRÓGENO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('813', 'C', '20120', 'Fabricación de abonos y fertilizantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('814', 'C', '2012001', 'Fabricación de compuestos de nitrógeno y otros, utilizados como materia prima para la fabricación de fertilizantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('815', 'C', '2012002', 'Fabricación de fertilizantes (abonos) inorgánicos de origen mineral: nitrogenados, fosfatados, potásicos, puros, mixtos, compuestos complejos, incluyendo la urea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('816', 'C', '2012003', 'Fabricación  de fertilizantes (abonos) orgánicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('817', 'C', '2012004', 'Maquilado de fertilizantes ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('818', 'C', '2013', 'FABRICACIÓN DE PLÁSTICO Y CAUCHO SINTÉTICO EN FORMAS PRIMARIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('819', 'C', '20130', 'Fabricación de plástico y caucho en formas primarias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('820', 'C', '2013001', 'Fabricación de plástico en forma primaria, incluso polímeros,  poliuretanos, siliconas, ésteres de vinilo, resinas de petróleo, epoxídicas, alquídicas, fenólicas y sus derivados químicos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('821', 'C', '2013002', 'Fabricación de hule (caucho) sintético y de sucedáneos a partir de aceites, en forma primaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('822', 'C', '2013003', 'Producción de mezclas de hule (caucho) sintético y natural y de gomas similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('823', 'C', '202', 'FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('824', 'C', '2021', 'FABRICACIÓN DE PLAGUICIDAS Y OTROS PRODUCTOS QUÍMICOS DE USO AGROPECUARIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('825', 'C', '20210', 'Fabricación de plaguicidas y otros productos químicos de uso agropecuario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('826', 'C', '2021001', 'Fabricación de plaguicidas inorgánicos de origen mineral: insecticidas, fungicidas, bactericidas, herbicidas y otros: arseniatos de calcio, de plomo y compuestos azufrados, fluorados y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('827', 'C', '2021002', 'Fabricación de plaguicidas orgánicos sintéticos: clorados, fosforados, carbonatos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('828', 'C', '2021003', 'Fabricación de plaguicidas orgánicos naturales extraídos de plantas, restos orgánicos antiguos y otros: nicotina, piretrina, rotenona, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('829', 'C', '2022', 'FABRICACIÓN DE PINTURAS, BARNICES Y PRODUCTOS DE REVESTIMIENTO SIMILARES; TINTAS DE IMPRENTA Y MASILLAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('830', 'C', '20220', 'Fabricación de pinturas, barnices y productos de revestimiento similares; tintas de imprenta y masillas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('831', 'C', '2022001', 'Fabricación de pinturas, barnices, esmaltes, selladores impermeabilizantes, lacas, solventes, diluyentes, removedores de pintura y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('832', 'C', '2022002', 'Fabricación de pigmentos preparados, colores preparados, esmaltes y barnices utilizados en la industria de la cerámica, vidrio y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('833', 'C', '2022003', 'Fabricación de tintas para imprenta, artes gráficas y litografía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('834', 'C', '2022004', 'Fabricación de productos de revestimiento, masillas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('835', 'C', '2023', 'FABRICACIÓN DE JABONES Y DETERGENTES, PREPARADOS PARA LIMPIAR Y PULIR, PERFUMES Y PREPARADOS DE TOCADOR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('836', 'C', '20231', 'Fabricación de jabones, detergentes y similares para limpieza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('837', 'C', '2023101', 'Fabricación de jabones, detergentes, blanqueadores (lejía) y suavizadores  para lavar ropa y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('838', 'C', '2023102', 'Fabricación de  ceras artificiales y mezclas de ceras utilizadas como materia prima');
INSERT INTO `sac_clasificacion_institucion` VALUES ('839', 'C', '2023103', 'Fabricación de pastas,  ceras, betunes y cremas para calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('840', 'C', '2023104', 'Fabricación de pasta, ceras y otros preparados para limpiar y dar brillo a metales, carrocerías, vidrios, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('841', 'C', '2023105', 'Fabricación de preparados para limpiar, desinfectar pisos, y otros productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('842', 'C', '2023106', 'Maquilado de jabones  de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('843', 'C', '20232', 'Fabricación de perfumes, cosméticos y productos de higiene y cuidado personal, incluyendo tintes, champú, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('844', 'C', '2023201', 'Fabricación de perfumes, cosméticos y productos de tocador, incluyendo tintes, champú, jabón de baño y otros preparados de uso personal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('845', 'C', '2029', 'FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('846', 'C', '20291', 'Fabricación de tintas y colores para escribir y pintar; fabricación de cintas para impresoras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('847', 'C', '2029101', 'Fabricación de materiales colorantes para pintores, artistas  y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('848', 'C', '2029102', 'Fabricación de tintas para escribir y dibujar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('849', 'C', '2029103', 'Elaboración de cintas para impresora');
INSERT INTO `sac_clasificacion_institucion` VALUES ('850', 'C', '2029104', 'Fabricación de toner ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('851', 'C', '20292', 'Fabricación de productos pirotécnicos, explosivos y municiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('852', 'C', '2029201', 'Fabricación de productos pirotécnicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('853', 'C', '2029202', 'Fabricación de explosivos y municiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('854', 'C', '2029203', 'Fabricación de fósforos y cerillos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('855', 'C', '20299', 'Fabricación de productos químicos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('856', 'C', '2029901', 'Fabricación de aceites esenciales  para la elaboración de perfumes y para otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('857', 'C', '2029902', 'Fabricación de gomas, colas, gelatinas,  pegamentos y otros adhesivos preparados a base de caucho (hule), plástico, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('858', 'C', '2029903', 'Fabricación de reactivos  usados en el diagnóstico de laboratorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('859', 'C', '2029904', 'Fabricación de catalizadores (para activar o desactivar reacciones químicas)  y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('860', 'C', '2029905', 'Fabricación de carbón activado (de origen orgánico)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('861', 'C', '2029906', 'Fabricación de productos químicos utilizados en el proceso de fabricación industrial, con una acción modificadora determinada para: aclarar, blanquear, absorber, purificar, endurecer, licuar el producto final');
INSERT INTO `sac_clasificacion_institucion` VALUES ('862', 'C', '2029907', 'Fabricación de productos fotoquímicos, materiales sensibles sin impresionar (estampar) y preparados químicos de uso fotográfico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('863', 'C', '203', 'FABRICACIÓN DE FIBRAS ARTIFICIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('864', 'C', '2030', 'FABRICACIÓN DE FIBRAS ARTIFICIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('865', 'C', '20300', 'Fabricación de fibras artificiales ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('866', 'C', '2030001', 'Fabricación de hilos de fibras sintéticas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('867', 'C', '2030002', 'Fabricación de fibras discontinuas y estopas de filamentos artificiales, excepto vidrios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('868', 'C', '21', 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACEUTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('869', 'C', '210', 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACEUTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('870', 'C', '2100', 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACEUTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('871', 'C', '21001', 'Manufactura de productos farmacéuticos, sustancias químicas y productos botánicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('872', 'C', '2100101', 'Fabricación de preparados farmacéuticos para uso médico incluyendo jabones medicinales,  vacunas, vitaminas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('873', 'C', '2100102', 'Fabricación de sustancias químicas y otros productos utilizados como materia prima para la fabricación de medicamentos farmacéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('874', 'C', '2100103', 'Fabricación de materiales y artículos quirúrgicos: hisopos, gasas y otros ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('875', 'C', '2100104', 'Fabricación de medicamentos naturópatas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('876', 'C', '2100105', 'Preparación artesanal de productos vegetales molidos pulverizados o en otras formas, utilizados como medicamentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('877', 'C', '2100106', 'Fabricación de medicamentos veterinarios y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('878', 'C', '21008', 'Maquilado de medicamentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('879', 'C', '2100801', 'Maquilado de medicamentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('880', 'C', '22', 'FABRICACIÓN DE PRODUCTOS DE CAUCHO Y PLÁSTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('881', 'C', '221', 'FABRICACIÓN DE PRODUCTOS DE CAUCHO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('882', 'C', '2211', 'FABRICACIÓN DE CUBIERTAS Y CÁMARAS DE CAUCHO; RECAUCHADO Y RENOVACIÓN DE CUBIERTAS DE CAUCHO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('883', 'C', '22110', 'Fabricación de cubiertas y cámaras; renovación y recauchutado de cubiertas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('884', 'C', '2211001', 'Fabricación de llantas y tubos de hule');
INSERT INTO `sac_clasificacion_institucion` VALUES ('885', 'C', '2211002', 'Recauche y vulcanización de llantas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('886', 'C', '2219', 'FABRICACIÓN OTROS PRODUCTOS DE CAUCHO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('887', 'C', '22190', 'Fabricación de otros productos de caucho');
INSERT INTO `sac_clasificacion_institucion` VALUES ('888', 'C', '2219001', 'Fabricación de caucho natural o sintético');
INSERT INTO `sac_clasificacion_institucion` VALUES ('889', 'C', '2219002', 'Fabricación de artículos higiénicos y farmacéuticos de hule');
INSERT INTO `sac_clasificacion_institucion` VALUES ('890', 'C', '2219003', 'Fabricación de prendas, accesorios de vestir y de caucho (sólo si las piezas están adheridas y no cosidas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('891', 'C', '2219004', 'Fabricación de artículos de caucho de uso diverso: empaques, rodillos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('892', 'C', '222', 'FABRICACIÓN DE PRODUCTOS DE PLÁSTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('893', 'C', '2220', 'FABRICACIÓN DE PRODUCTOS DE PLÁSTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('894', 'C', '22201', 'Fabricación de envases plásticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('895', 'C', '2220101', 'Fabricación de bolsas de plástico, piezas o rollos de plástico, de anchos diferentes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('896', 'C', '2220102', 'Fabricación de envases plásticos para la industria y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('897', 'C', '2220103', 'Fabricación de empaques plásticos  flexibles o rígidos, revestidos o  no con materiales impregnados o adheridos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('898', 'C', '22202', 'Fabricación de productos plásticos para uso personal o doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('899', 'C', '2220201', 'Fabricación de artículos plásticos para uso del hogar, personal y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('900', 'C', '2220202', 'Fabricación de vajillas plásticas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('901', 'C', '2220203', 'Fabricación de prendas de vestir de plástico, cuyas piezas se unen por adhesión (se excluyen las unidas por costura)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('902', 'C', '2220204', 'Fabricación de esponjas de poliuretano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('903', 'C', '22208', 'Maquila de plásticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('904', 'C', '2220801', 'Maquila de plásticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('905', 'C', '22209', 'Fabricación de productos plásticos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('906', 'C', '2220901', 'Fabricación de artículos plásticos desechables o no desechables, incluyendo Durapax');
INSERT INTO `sac_clasificacion_institucion` VALUES ('907', 'C', '2220902', 'Fabricación de tubería de plástico PVC, y otros accesorios y artículos para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('908', 'C', '2220903', 'Fabricación de planchas plásticas, cintas, láminas perforadas, acanaladas, mallas y otras  formas planas , autoadhesivas y aislantes ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('909', 'C', '2220904', 'Fabricación de artículos acrílicos diversos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('910', 'C', '2220905', 'Fabricación  de cerdas, filamentos, cordeles plásticos, y algunos  artículos de estos filamentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('911', 'C', '2220906', 'Fabricación de puertas ,  ventanas y sus marcos  de  plástico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('912', 'C', '2220907', 'Fabricación de preformas plásticas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('913', 'C', '23', 'FABRICACIÓN DE PRODUCTOS MINERALES NO METÁLICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('914', 'C', '231', 'FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('915', 'C', '2310', 'FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('916', 'C', '23101', 'Fabricación de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('917', 'C', '2310101', 'Fabricación de vidrio en masa, bloque laminado, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('918', 'C', '23102', 'Fabricación de recipientes y envases de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('919', 'C', '2310201', 'Fabricación de recipientes, envases y otros artículos de vidrio para uso diverso');
INSERT INTO `sac_clasificacion_institucion` VALUES ('920', 'C', '23108', 'Servicio de maquilado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('921', 'C', '2310801', 'Maquilado de espejos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('922', 'C', '23109', 'Fabricación de productos de vidrio n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('923', 'C', '2310901', 'Tratamientos de vidrio: teñido, coloreado, polarizado, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('924', 'C', '2310902', 'Fabricación de vidrio para relojes, vidrio óptico y piezas de vidrio óptico sin labrar ( excepto actividades que realizan las ópticas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('925', 'C', '2310903', 'Fabricación de espejos con o sin marcos y otros artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('926', 'C', '2310904', 'Fabricación de productos y artículos de fibra de vidrio, (excepto muebles)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('927', 'C', '239', 'FABRICACIÓN DE PRODUCTOS MINERALES NO METÁLICOS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('928', 'C', '2391', 'FABRICACIÓN DE PRODUCTOS REFRACTARIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('929', 'C', '23910', 'Fabricación de productos refractarios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('930', 'C', '2392', 'FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('931', 'C', '23920', 'Fabricación de productos de arcilla para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('932', 'C', '2392001', 'Fabricación de productos de barro para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('933', 'C', '2392002', 'Fabricación de adobe');
INSERT INTO `sac_clasificacion_institucion` VALUES ('934', 'C', '2392003', 'Fabricación de ladrillo cerámico para piso, con o sin incorporaciones de polvos de mármol, colorantes, y otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('935', 'C', '2392004', 'Fabricación de tejas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('936', 'C', '2393', 'FABRICACIÓN DE OTROS PRODUCTOS DE  PORCELANA Y CERÁMICA ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('937', 'C', '23931', 'Fabricación de productos de cerámica y porcelana no refractaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('938', 'C', '2393101', 'Fabricación de artículos de barro para uso doméstico: ollas, cómales, sartenes, jarros, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('939', 'C', '2393102', 'Fabricación de artículos de arcilla fina: tazas, platos, adornos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('940', 'C', '2393103', 'Fabricación de artículos de porcelana: vajillas, estatuillas ornamentales etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('941', 'C', '2393104', 'Fabricación de artefactos higiénicos de loza y porcelana y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('942', 'C', '2393105', 'Fabricación de aislantes eléctricos y piezas aislantes para maquinas, aparatos y equipo eléctrico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('943', 'C', '2393106', 'Fabricación de artesanías de arcilla y barro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('944', 'C', '2393107', 'Fabricación de artículos para laboratorio y la industria en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('945', 'C', '2393108', 'Maquila de artículos de barro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('946', 'C', '23932', 'Fabricación de productos de cerámica y porcelana n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('947', 'C', '2393201', 'Fabricación de productos de cerámica y porcelana n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('948', 'C', '2394', 'FABRICACIÓN DE CEMENTO, CAL Y YESO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('949', 'C', '23940', 'Fabricación de cemento, cal y yeso');
INSERT INTO `sac_clasificacion_institucion` VALUES ('950', 'C', '2394001', 'Fabricación de cemento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('951', 'C', '2394002', 'Fabricación de cal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('952', 'C', '2394003', 'Fabricación de yeso');
INSERT INTO `sac_clasificacion_institucion` VALUES ('953', 'C', '2395', 'FABRICACIÓN DE ARTÍCULOS DE HORMIGÓN, CEMENTO Y YESO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('954', 'C', '23950', 'Fabricación de artículos de hormigón, cemento y yeso');
INSERT INTO `sac_clasificacion_institucion` VALUES ('955', 'C', '2395001', 'Fabricación de ladrillo de cemento para piso, con o sin incorporación de polvo de mármol, colorantes, porcelana y otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('956', 'C', '2395002', 'Fabricación de productos de cemento o concreto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('957', 'C', '2395003', 'Fabricación de artículos de asbesto cemento, fibrocemento de celulosa,  materiales similares y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('958', 'C', '2395004', 'Fabricación de artículos de yeso,  cemento o concreto y otros artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('959', 'C', '2395005', 'Fabricación de divisiones y otras estructuras prefabricadas para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('960', 'C', '2395006', 'Fabricación de concreto (concretera)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('961', 'C', '2395007', 'Fabricación de cruces, lápidas y placas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('962', 'C', '2396', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('963', 'C', '23960', 'Corte, tallado y acabado de la piedra');
INSERT INTO `sac_clasificacion_institucion` VALUES ('964', 'C', '2396001', 'Corte, tallado y acabado de la piedra en bloque y otras formas, para construcción y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('965', 'C', '2396002', 'Fabricación de productos de mármol: marmolería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('966', 'C', '2399', 'FABRICACIÓN DE PRODUCTOS MINERALES NO METÁLICOS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('967', 'C', '23990', 'Fabricación de productos minerales no metálicos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('968', 'C', '2399001', 'Fabricación de artículos abrasivos: para moler, afilar, pulir y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('969', 'C', '2399002', 'Fabricación de productos abrasivos naturales y/o artificiales incluyendo polvo o granos adheridos para lijar, pulir, lavar trastos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('970', 'C', '2399003', 'Fabricación de productos de bentonita (silicato de calcio o de sodio), utilizados como materia prima en la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('971', 'C', '2399004', 'Fabricación de productos de caolín (silicato de aluminio hidratado) utilizado como materia prima en la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('972', 'C', '2399005', 'Elaboración de productos de piedra pómez');
INSERT INTO `sac_clasificacion_institucion` VALUES ('973', 'C', '2399006', 'Fabricación de otras materias primas para la industria utilizando minerales no metálicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('974', 'C', '2399007', 'Fabricación de otras materias primas para la construcción  utilizando minerales no metálicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('975', 'C', '24', 'FABRICACIÓN DE METALES COMUNES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('976', 'C', '241', 'INDUSTRIAS BASICAS DE HIERRO Y ACERO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('977', 'C', '2410', 'INDUSTRIAS BASICAS DE HIERRO Y ACERO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('978', 'C', '24100', 'Industria básicas de hierro y acero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('979', 'C', '2410001', 'Fabricación de varillas de hierro y acero, barras, tubos y accesorios, piezas en ángulos, perfiles, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('980', 'C', '2410002', 'Fabricación de láminas de hierro y acero lisas o acanaladas, galvanizadas o no');
INSERT INTO `sac_clasificacion_institucion` VALUES ('981', 'C', '242', 'FABRICACIÓN DE PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y METALES NO FERROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('982', 'C', '2420', 'FABRICACIÓN DE PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y METALES NO FERROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('983', 'C', '24200', 'Industria básicas de metales no ferrosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('984', 'C', '2420001', 'Fabricación de metales no ferrosos por refinación u otros procesos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('985', 'C', '2420002', 'Fabricación de barras, varillas, ángulos perfiles, alambre y tubos de metales no ferrosos (aluminio, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('986', 'C', '2420003', 'Fabricación de planchas, láminas, hojas de metales no ferrosos (aluminio, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('987', 'C', '2420004', 'Fabricación de hilos y cables de metal no ferroso sin material aislante para conducir electricidad y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('988', 'C', '243', 'FUNDICIÓN DE METALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('989', 'C', '2431', 'FUNDICIÓN DE HIERRO Y ACERO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('990', 'C', '24310', 'Fundición de hierro y acero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('991', 'C', '2431001', 'Fundición de hierro y acero (excepto fabricación de artículos de hierro y acero)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('992', 'C', '2432', 'FUNDICIÓN DE METALES NO FERROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('993', 'C', '24320', 'Fundición de metales no ferrosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('994', 'C', '2432001', 'Fundición de hierro y acero  (excepto  fabricación de artículos de hierro y acero)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('995', 'C', '25', 'FABRICACIÓN DE PRODUCTOS DERIVADOS DE METAL, EXCEPTO MAQUINARIA Y EQUIPO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('996', 'C', '251', 'FABRICACIÓN DE PRODUCTOS METÁLICOS PARA USO ESTRUCTURAL, TANQUES, DEPÓSITOS Y GENERADORES DE VAPOR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('997', 'C', '2511', 'FABRICACIÓN DE PRODUCTOS METÁLICOS PARA USO ESTRUCTURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('998', 'C', '25111', 'Fabricación de productos metálicos para uso estructural');
INSERT INTO `sac_clasificacion_institucion` VALUES ('999', 'C', '2511101', 'Fabricación de productos metálicos estructurales: torres, secciones de puentes y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1000', 'C', '2511102', 'Fabricación de portones, puertas, marcos de puertas y  ventanas de hierro, acero y aluminio etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1001', 'C', '2511103', 'Fabricación de cortinas, portones automáticos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1002', 'C', '2511104', 'Fabricación de estructuras y partes de estructuras de hierro, acero o aluminio: varillas, ángulos, perfiles, secciones, tuberías, planchas etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1003', 'C', '2511105', 'Fabricación de obras ornamentales de hierro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1004', 'C', '2511106', 'Fabricación de estructuras para  vallas publicitarias ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1005', 'C', '25118', 'Servicio de maquila para la fabricación de estructuras metálicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1006', 'C', '2511801', 'Maquilado de estructuras metálicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1007', 'C', '2512', 'FABRICACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1008', 'C', '25120', 'Fabricación de tanques, depósitos y recipientes de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1009', 'C', '2512001', 'Fabricación de depósitos y tanques de metal para almacenamiento y uso industrial, calderas de calefacción central');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1010', 'C', '2512002', 'Fabricación de radiadores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1011', 'C', '2512003', 'Fabricación de envases de metal para gas comprimido y gas licuado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1012', 'C', '2513', 'FABRICACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN CENTRAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1013', 'C', '25130', 'Fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1014', 'C', '2513001', 'Fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1015', 'C', '252', 'FABRICACIÓN DE ARMAS Y MUNICIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1016', 'C', '2520', 'FABRICACIÓN DE ARMAS Y MUNICIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1017', 'C', '25200', 'Fabricación de armas y municiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1018', 'C', '2520001', 'Fabricación de armas de fuego, accesorios y municiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1019', 'C', '259', 'FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL; ACTIVIDADES DE SERVICIOS DE TRABAJO DE  METALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1020', 'C', '2591', 'FORJADO, PRENSADO, ESTAMPADO Y LAMINADO DE METALES; PULVIMETALURGIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1021', 'C', '25910', 'Forjado, prensado, estampado y laminado de metales; pulvimetalurgia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1022', 'C', '2591001', 'Forjado de hierro y acero (herrería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1023', 'C', '2591002', 'Forjado de metales preciosos (plata, oro, etc.) y  metales no ferrosos (bronce, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1024', 'C', '2591003', 'Prensado y estampado de productos de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1025', 'C', '2592', 'MECANIZADO; TRATAMIENTO Y REVESTIMIENTO DE METALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1026', 'C', '25920', 'Tratamiento y revestimiento de metales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1027', 'C', '2592001', 'Tratamiento y revestimiento de metales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1028', 'C', '2593', 'FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1029', 'C', '25930', 'Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1030', 'C', '2593001', 'Fabricación de artículos de cuchillería para uso doméstico (cuchillos, tenedores, cucharas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1031', 'C', '2593002', 'Fabricación de herramientas de mano  y otros, instrumentos utilizados en la agricultura, ganadería, horticultura, silvicultura, carpintería y otros oficios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1032', 'C', '2593003', 'Fabricación de artículos de ferretería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1033', 'C', '2599', 'FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1034', 'C', '25991', 'Fabricación de envases y artículos conexos de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1035', 'C', '2599101', 'Fabricación de recipientes de metal de todo tamaño y diferentes usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1036', 'C', '2599102', 'Fabricación de corcholatas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1037', 'C', '25992', 'Fabricación de artículos metálicos de uso personal y/o doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1038', 'C', '2599201', 'Fabricación de marcos de metal para cuadros, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1039', 'C', '2599202', 'Fabricación de artículos y utensilios de metal (aluminio etc.) para la cocina y el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1040', 'C', '2599203', 'Fabricación de esponjas (almohadillas)  metálicas para fregar y otros artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1041', 'C', '2599204', 'Fabricación de artesanías de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1042', 'C', '2599205', 'Fabricación de artículos sanitarios de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1043', 'C', '25999', 'Fabricación de productos elaborados de metal n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1044', 'C', '2599901', 'Fabricación de alambre de amarre y galvanizado, malla (ciclón), alambre de púas, clavos, tachuelas y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1045', 'C', '2599902', 'Fabricación de artículos de alambre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1046', 'C', '2599903', 'Fabricación de resortes y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1047', 'C', '2599904', 'Fabricación de artículos y productos de lámina (hojalatería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1048', 'C', '2599905', 'Fabricación de cajas fuertes, pórticos y puertas de cámaras blindadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1049', 'C', '2599906', 'Fabricación de cascos protectores de metal para la cabeza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1050', 'C', '2599907', 'Fabricación de tornillos, pernos, tuercas y otros remaches o sujetadores de metal y sus accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1051', 'C', '2599908', 'Fabricación de objetos de metal con inscripciones gravadas para diferentes motivos y otros artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1052', 'C', '2599909', 'Fabricación de sujetadores de metal sin rosca: grapas, clips, alfileres, broches (ganchos) para sujetar botones, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1053', 'C', '2599910', 'Fabricación de trofeos y  placas de reconocimientos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1054', 'C', '26', 'FABRICACIÓN DE PRODUCTOS INFORMÁTICOS, ELECTRÓNICOS Y ÓPTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1055', 'C', '261', 'FABRICACIÓN DE COMPONENTES Y TABLAREROS  ELECTRÓNICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1056', 'C', '2610', 'FABRICACIÓN DE COMPONENTES  Y TABLEROS ELECTRÓNICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1057', 'C', '26100', 'Fabricación de componentes electrónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1058', 'C', '2610001', 'Fabricación de componentes electrónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1059', 'C', '2610002', 'Maquila de componentes electrónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1060', 'C', '262', 'FABRICACIÓN DE COMPUTADORAS Y EQUIPO PERIFÉRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1061', 'C', '2620', 'FABRICACIÓN DE COMPUTADORAS Y EQUIPO PERIFÉRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1062', 'C', '26200', 'Fabricación de computadoras y equipo conexo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1063', 'C', '2620001', 'Ensamble de computadoras, equipos conexos y periférico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1064', 'C', '263', 'FABRICACIÓN DE EQUIPOS DE COMUNICACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1065', 'C', '2630', 'FABRICACIÓN DE EQUIPOS DE COMUNICACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1066', 'C', '26300', 'Fabricación de equipo de comunicaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1067', 'C', '2630001', 'Fabricación de transmisores de radio y televisión, tableros, paneles, etc. para telefonía, telegrafía con hilos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1068', 'C', '2630002', 'Fabricación de antenas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1069', 'C', '264', 'FABRICACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1070', 'C', '2640', 'FABRICACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1071', 'C', '26400', 'Fabricación de aparatos electrónicos de consumo para audio, video radio y televisión ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1072', 'C', '2640001', 'Fabricación de aparatos receptores de radio y televisión, aparatos de grabación y reproducción de sonido y video y productos conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1073', 'C', '2640002', 'Ensamble de equipos de sonido y otros aparatos similares y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1074', 'C', '265', 'FABRICACIÓN DE EQUIPO PARA MEDIR, VERIFICAR, NAVEGAR; EQUIPO DE CONTROL; ARTÍCULOS DE RELOJERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1075', 'C', '2651', 'FABRICACIÓN DE EQUIPO PARA MEDIR, VERIFICAR, NAVEGAR; EQUIPO DE CONTROL; ARTÍCULOS DE RELOJERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1076', 'C', '26510', 'Fabricación de instrumentos y aparatos para medir, verificar, ensayar, navegar y de control de procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1077', 'C', '2651001', 'Fabricación de instrumentos y aparatos para medir, ensayar, verificar, controlar, determinar propiedades, magnitudes, materiales, procesos y otras actividades afines, excepto el equipo de  control de procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1078', 'C', '2651002', 'Fabricación de equipo de control de procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1079', 'C', '2652', 'FABRICACIÓN DE ARTÍCULOS DE RELOJERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1080', 'C', '26520', 'Fabricación de relojes y piezas de relojes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1081', 'C', '2652001', 'Fabricación de relojes y piezas de relojes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1082', 'C', '266', 'FABRICACIÓN DE EQUIPOS RADIOLÓGICOS, ELECTROMÉDICOS Y ELECTRO TERAPÉUTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1083', 'C', '2660', 'FABRICACIÓN DE EQUIPOS RADIOLÓGICOS, ELECTROMÉDICOS Y ELECTRO TERAPÉUTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1084', 'C', '26600', 'Fabricación de equipos radiológicos, electromédicos y electro terapéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1085', 'C', '2660001', 'Fabricación de equipos radiológicos, electromédicos y electro terapéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1086', 'C', '2660002', 'Ensamble de equipos radiológicos, electromédicos y electro terapéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1087', 'C', '267', 'FABRICACIÓN DE EQUIPO E INSTRUMENTOS ÓPTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1088', 'C', '2670', 'FABRICACIÓN DE EQUIPO E INSTRUMENTOS ÓPTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1089', 'C', '26700', 'Fabricación de instrumentos de óptica y equipo fotográfico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1090', 'C', '2670001', 'Fabricación de espejos ópticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1091', 'C', '2670002', 'Fabricación de instrumentos ópticos de aumento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1092', 'C', '2670003', 'Fabricación de aparatos fotográficos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1093', 'C', '2670004', 'Fabricación de instrumentos de óptica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1094', 'C', '268', 'FABRICACIÓN DE SOPORTES MAGNÉTICOS Y ÓPTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1095', 'C', '2680', 'FABRICACIÓN DE SOPORTES MAGNÉTICOS Y ÓPTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1096', 'C', '26800', 'Fabricación de medios magnéticos y ópticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1097', 'C', '2680001', 'Fabricación de CD, casetes, discos ópticos, sin grabar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1098', 'C', '27', 'FABRICACIÓN DE EQUIPO ELÉCTRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1099', 'C', '271', 'FABRICACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS; APARATOS DE DISTRIBUCIÓN Y CONTROL DE ELECTRICIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1100', 'C', '2710', 'FABRICACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS; APARATOS DE DISTRIBUCIÓN Y CONTROL DE ELECTRICIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1101', 'C', '27100', 'Fabricación de motores, generadores , transformadores eléctricos, aparatos de distribución y control de electricidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1102', 'C', '2710001', 'Fabricación de motores, generadores y transformadores eléctricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1103', 'C', '2710002', 'Fabricación de aparatos de control y distribución eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1104', 'C', '272', 'FABRICACIÓN DE BATERÍAS Y ACUMULADORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1105', 'C', '2720', 'FABRICACIÓN DE BATERÍAS Y ACUMULADORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1106', 'C', '27200', 'Fabricación de baterías y acumuladores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1107', 'C', '2720001', 'Fabricación de acumuladores eléctricos para automóviles (Incluye baterías húmedas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1108', 'C', '2720002', 'Fabricación de pilas eléctricas (baterías secas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1109', 'C', '273', 'FABRICACIÓN DE CABLES Y APARATOS DE CABLEADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1110', 'C', '2731', 'FABRICACIÓN DE CABLES DE FIBRA ÓPTICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1111', 'C', '27310', 'Fabricación de cables de fibra óptica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1112', 'C', '2731001', 'Fabricación de cables de fibra óptica recubiertos de material aislante');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1113', 'C', '2732', 'FABRICACIÓN DE OTROS CABLES ELÉCTRICOS Y ELECTRÓNICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1114', 'C', '27320', 'Fabricación de cables eléctricos y electrónicos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1115', 'C', '2732001', 'Fabricación de hilos y cables  recubierto de material aislante y otros conductores eléctricos incluyendo cables coaxiales y los anodizados y lasqueados (Incluye: Alambre sólido y alambre trenzado)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1116', 'C', '2733', 'FABRICACION DE DISPOSITIVOS DE CABLEADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1117', 'C', '27330', 'Fabricacion de dispositivos de cableados ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1118', 'C', '2733001', 'Fabricacion de dispositivos de cableados ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1119', 'C', '274', 'FABRICACIÓN DE EQUIPO DE ILUMINACIÓN ELÉCTRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1120', 'C', '2740', 'FABRICACIÓN DE EQUIPO DE ILUMINACIÓN ELÉCTRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1121', 'C', '27400', 'Fabricación de equipo de iluminación eléctrico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1122', 'C', '2740001', 'Fabricación de lámparas eléctricas incluyendo partes, piezas y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1123', 'C', '2740002', 'Fabricación de equipo de iluminación, excepto los usados en bicicletas y vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1124', 'C', '2740003', 'Fabricación   de rótulos y carteles iluminados de neón, eléctricos, electrónicos y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1125', 'C', '275', 'FABRICACIÓN DE APARATOS DE USO DOMÉSTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1126', 'C', '2750', 'FABRICACIÓN DE APARATOS DE USO DOMÉSTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1127', 'C', '27500', 'Fabricación de aparatos de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1128', 'C', '2750001', 'Ensamble de cocinas de gas para uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1129', 'C', '2750002', 'Fabricación de cocinas eléctricas de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1130', 'C', '2750003', 'Ensamble de cocinas eléctricas de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1131', 'C', '2750004', 'Fabricación de refrigeradoras de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1132', 'C', '2750005', 'Ensamble de refrigeradoras de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1133', 'C', '2750006', 'Fabricación de ventiladores eléctricos y aparatos de aire acondicionado  de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1134', 'C', '2750007', 'Ensamble de ventiladores eléctricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1135', 'C', '2750008', 'Fabricación de aparatos eléctricos de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1136', 'C', '2750009', 'Ensamble de aparatos eléctricos de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1137', 'C', '2750010', 'Fabricación de resistencias eléctricas (para el hogar)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1138', 'C', '2750011', 'Fabricación de cocinas ecológicas no eléctricas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1139', 'C', '279', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1140', 'C', '2790', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1141', 'C', '27900', 'Fabricación de equipo eléctrico n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1142', 'C', '7710104', 'Alquiler de motocicletas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1143', 'C', '2790002', 'Fabricación de dispositivos, aparatos y artefactos de control y señalización visual y acústica, de control de tráfico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1144', 'C', '2790003', 'Fabricación de estructuras, dispositivos y mecanismos de sistemas de seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1145', 'C', '2790004', 'Fabricación de dispositivos eléctricos para  limpiaparabrisas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1146', 'C', '2790005', 'Fabricación de dispositivos eléctricos de encendido y arranque para motores de combustión interna de encendido por chispa y por compresión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1147', 'C', '28', 'FABRICACIÓN DE MAQUINARIA Y EQUIPO N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1148', 'C', '281', 'FABRICACIÓN DE MAQUINARIA DE USO GENERAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1149', 'C', '45', 'COMERCIO AL POR MAYOR Y AL POR MENOR Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1150', 'C', 'G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1151', 'C', '46', 'COMERCIO AL POR MAYOR, EXCEPTO EL COMERCIO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1152', 'C', '2812', 'FABRICACIÓN DE EQUIPO HIDRÁULICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1153', 'C', '28120', 'Fabricación de equipo hidráulico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1154', 'C', '2812001', 'Fabricación de equipo hidráulico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1155', 'C', '2813', 'FABRICACIÓN DE OTRAS BOMBAS, COMPRESORES, GRIFOS Y VÁLVULAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1156', 'C', '28130', 'FABRICACIÓN DE OTRAS BOMBAS, COMPRESORES, GRIFOS Y VÁLVULAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1157', 'C', '2813001', 'Fabricación de bombas y compresores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1158', 'C', '2813002', 'Fabricación de grifos y válvulas excepto de caucho vulcanizado no endurecido, de cerámica y de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1159', 'C', '2814', 'FABRICACIÓN DE COJINETES, ENGRANAJES, TRENES DE ENGRANAJES Y PIEZAS DE TRANSMISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1160', 'C', '28140', 'Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1161', 'C', '2814001', 'Fabricación de cojinetes, engranaje, trenes de engranaje y piezas de transmisión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1162', 'C', '2815', 'FABRICACIÓN DE HORNOS Y QUEMADORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1163', 'C', '28150', 'Fabricación de hornos y quemadores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1164', 'C', '2815001', 'Fabricación de hornos y quemadores para uso industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1165', 'C', '2816', 'FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1166', 'C', '28160', 'Fabricación de equipo de elevación y manipulación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1167', 'C', '2816001', 'Fabricación de máquinas y equipo para manipular y levantar materiales, mercancías o personas, de fabricación sencilla o compleja ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1168', 'C', '2817', 'FABRICACIÓN DE MAQUINARIA Y EQUIPO DE OFICINA EXCEPTO EQUIPO DE COMPUTADORAS Y EQUIPO PERIFÉRICO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1169', 'C', '28170', 'Fabricación de maquinaria y equipo de oficina ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1170', 'C', '2818', 'FABRICACIÓN DE HERRAMIENTAS MANUALES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1171', 'C', '28180', 'Fabricacion de herramientas manuales ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1172', 'C', '2819', 'FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA DE USO GENERAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1173', 'C', '28190', 'Fabricación de otros tipos de maquinaria de uso general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1174', 'C', '2819001', 'Fabricación de maquinaria, equipo y accesorios para todo tipo de envasado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1175', 'C', '2819002', 'Fabricación de extinguidores de incendios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1176', 'C', '2819003', 'Fabricación de aparatos y equipo de aire acondicionado, ventilación, refrigeración  para uso no doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1177', 'C', '2819004', 'Fabricación de equipo, piezas y accesorios para impeler, esparcir y asperjar  líquidos, polvos, etc. accionados a mano o no. Excluye equipo agropecuario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1178', 'C', '2819005', 'Fabricación de balanzas y básculas de uso doméstico, comercial, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1179', 'C', '282', 'FABRICACIÓN DE MAQUINARIA DE USO ESPECIAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1180', 'C', '2821', 'FABRICACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1181', 'C', '28210', 'Fabricación de maquinaria agropecuaria y forestal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1182', 'C', '2821001', 'Fabricación de máquinas, piezas y accesorios para uso agrícola, pecuario, forestal y jardinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1183', 'C', '2821002', 'Fabricación de equipo de aspersión y fumigación para uso agropecuario, forestal y jardinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1184', 'C', '2822', 'FABRICACIÓN DE MÁQUINAS PARA CONFORMAR METALES Y MAQUINARIA HERRAMIENTA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1185', 'C', '28220', 'Fabricación de máquinas para conformar metales y maquinaria herramienta');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1186', 'C', '2822001', 'Fabricación de máquinas herramienta, para trabajar metales, piedras, hueso, plástico duro y otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1187', 'C', '2822002', 'Fabricación de máquinas herramienta,  para tornear, fresar, taladrar, perforar, rectificar, cepillar, remachar, engrapar, clavar y otras operaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1188', 'C', '2822003', 'Fabricación de máquinas herramienta piezas y accesorios para equipo industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1189', 'C', '2823', 'FABRICACIÓN DE MAQUINARIA METALÚRGICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1190', 'C', '28230', 'Fabricación de maquinaria metalúrgica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1191', 'C', '2823001', 'Fabricación de máquinas y equipo para el manejo de metales en caliente: lingoteras, calderas de fundición, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1192', 'C', '2824', 'FABRICACIÓN DE MAQUINARIA PARA LA EXPLOTACIÓN DE MINAS Y CANTERAS Y PARA OBRAS DE CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1193', 'C', '28240', 'Fabricación de maquinaria para la explotación de minas y canteras y para obras de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1194', 'C', '2824001', 'Fabricación de maquinaria para la industria de la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1195', 'C', '2824002', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1196', 'C', '2824003', 'Fabricación de maquinaria y equipo para la explotación de minas y canteras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1197', 'C', '2825', 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1198', 'C', '28250', 'Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1199', 'C', '2825001', 'Fabricación y montaje de  hornos para panadería, cocinas (planchas) para tortillerías, pupuserías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1200', 'C', '2825002', 'Fabricación de máquinas para moler cereales y otros  productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1201', 'C', '2825003', 'Fabricación de máquinas, equipo y accesorios para la extracción y refinación de aceites y grasas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1202', 'C', '2825004', 'Fabricación de maquinaria,  equipo y accesorios para la industria de alimentos, incluyendo, ingenios azucareros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1203', 'C', '2826', 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CUEROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1204', 'C', '28260', 'Fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1205', 'C', '2826001', 'Fabricación de maquinaria y equipo para la elaboración de productos textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1206', 'C', '2826002', 'Ensamble de máquinas de coser');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1207', 'C', '2829', 'FABRICACIÓN DE OTROS TIPOS  MAQUINARIA DE USO ESPECIAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1208', 'C', '28291', 'Fabricación de máquinas para imprenta');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1209', 'C', '2829101', 'Fabricación de máquinas, piezas y accesorios  para imprenta');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1210', 'C', '28299', 'Fabricación de maquinaria de uso especial n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1211', 'C', '2829901', 'Fabricación de máquinas y equipo para la elaboración de artículos de hule, plástico y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1212', 'C', '2829902', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1213', 'C', '2829903', 'Fabricación de máquinas y equipo para la industria, excepto los ya especificados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1214', 'C', '29', 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES, REMOLQUES Y SEMIRREMOLQUES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1215', 'C', '291', 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1216', 'C', '2910', 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1217', 'C', '29100', 'Fabricación vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1218', 'C', '2910001', 'Fabricación de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1219', 'C', '2910002', 'Ensamble de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1220', 'C', '292', 'FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES; FABRICACIÓN DE REMOLQUES Y SEMIREMOLQUES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1221', 'C', '2920', 'FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES; FABRICACIÓN DE REMOLQUES Y SEMIREMOLQUES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1222', 'C', '29200', 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semiremolques');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1223', 'C', '2920001', 'Fabricación y montaje de carrocerías, contenedores, remolques y semiremolques elaborados principalmente de metal ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1224', 'C', '2920002', 'Fabricación y montaje de carrocerías , contenedores, remolques y semiremolques elaborados principalmente de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1225', 'C', '293', 'FABRICACIÓN DE PIEZAS Y ACCESORIOS PARA VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1226', 'C', '2930', 'FABRICACIÓN DE PIEZAS Y ACCESORIOS PARA VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1227', 'C', '29300', 'Fabricación de partes, piezas y accesorios para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1228', 'C', '2930001', 'Fabricación de tubos de escape y silenciadores para automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1229', 'C', '2930002', 'Fabricación de vías (stop), silvinas, etc. para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1230', 'C', '2930003', 'Fabricación de piezas y accesorios para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1231', 'C', '2930004', 'Fabricación de piezas para motores de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1232', 'C', '30', 'FABRICACIÓN DE OTROS TIPOS DE TIPOS DE EQUIPO DE TRANSPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1233', 'C', '301', 'CONSTRUCCIÓN DE BUQUES Y OTRAS EMBARCACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1234', 'C', '3011', 'CONSTRUCCIÓN DE BUQUES Y ESTRUCTURAS FLOTANTES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1235', 'C', '30110', 'Fabricación y reparación de buques');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1236', 'C', '3011001', 'Construcción de barcos y buques, secciones de buques y otras estructuras flotantes utilizados para usos múltiples, excepto embarcaciones de recreo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1237', 'C', '3011002', 'Fabricación de lanchas, botes, canoas y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1238', 'C', '3011003', 'Reconstrucción de barcos, buques, secciones de barcos y  de otras estructuras flotantes utilizadas para múltiples usos, excepto de recreo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1239', 'C', '3012', 'CONSTRUCCIÓN DE EMBARCACIONES DE RECREO Y DEPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1240', 'C', '30120', 'Construcción y reparación de embarcaciones de recreo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1241', 'C', '3012001', 'Construcción de embarcaciones de deportes y recreo o partes de embarcaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1242', 'C', '302', 'FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1243', 'C', '3020', 'FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1244', 'C', '30200', 'Fabricación de locomotoras y de material rodante para ferrocarriles y tranvías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1245', 'C', '3020001', 'Construcción de equipo ferroviario  (piezas o partes)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1246', 'C', '3020002', 'Reconstrucción y modificación de equipo ferroviario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1247', 'C', '303', 'FABRICACIÓN DE AERONAVES Y NAVES ESPACIALES Y DE MAQUINARIA CONEXA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1248', 'C', '3030', 'FABRICACIÓN DE AERONAVES Y NAVES ESPACIALES Y DE MAQUINARIA CONEXA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1249', 'C', '30300', 'Fabricación de aeronaves y naves espaciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1250', 'C', '3030001', 'Reconstrucción de aeronaves (helicópteros y aviones)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1251', 'C', '3040', 'FABRICACION DE VEHICULOS MILITARES DE COMBATE ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1252', 'C', '30400', 'Fabricacion de vehiculos militares de combate ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1253', 'C', '3040001', 'Fabricación de vehículos militares de combate ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1254', 'C', '309', 'FABRICACIÓN DE EQUIPO DE TRANSPORTE N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1255', 'C', '47', 'COMERCIO AL POR MENOR, EXCEPTO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1256', 'C', '3091003', 'Ensamble de motocicletas y motonetas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1257', 'C', '3091', 'FABRICACIÓN DE MOTOCICLETAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1258', 'C', '30910', 'Fabricación de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1259', 'C', '3091001', 'Fabricación de motocicletas, motonetas, accesorios y sus motores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1260', 'C', '3092', 'FABRICACIÓN DE BICICLETAS Y SILLONES DE RUEDAS PARA INVÁLIDOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1261', 'C', '30920', 'Fabricación de bicicletas y sillones de ruedas para inválidos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1262', 'C', '3092001', 'Fabricación de toda clase de bicicletas, piezas y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1263', 'C', '3092002', 'Ensamble de bicicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1264', 'C', '3092003', 'Ensamble de triciclos de reparto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1265', 'C', '3092004', 'Fabricación de sillas de ruedas para inválidos.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1266', 'C', '3092005', 'Fabricación de coches para bebés');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1267', 'C', '3099', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO DE TRANSPORTE N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1268', 'C', '30990', 'Fabricación de equipo de transporte n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1269', 'C', '3099001', 'Fabricación de vehículos de propulsión manual y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1270', 'C', '3099002', 'Fabricación de rodos de cualquier material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1271', 'C', '3099003', 'Fabricación de carretas, carretones y carruajes de tracción, manual o animal y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1272', 'C', '31', 'FABRICACIÓN DE MUEBLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1273', 'C', '310', 'FABRICACIÓN DE MUEBLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1274', 'C', '3100', 'FABRICACIÓN DE MUEBLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1275', 'C', '31001', 'Fabricación de colchones y somier');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1276', 'C', '3100101', 'Fabricación de colchones de cualquier material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1277', 'C', '31002', 'Fabricación de muebles y otros productos de madera a medida');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1278', 'C', '3100201', 'Carpintería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1279', 'C', '31008', 'Servicios de maquilado de muebles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1280', 'C', '3100801', 'Maquilado de muebles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1281', 'C', '31009', 'Fabricación de muebles n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1282', 'C', '3100901', 'Fabricación de muebles para oficina, restaurantes, edificios públicos de diversos materiales combinados o no');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1283', 'C', '3100902', 'Fabricación de muebles de fibra de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1284', 'C', '3100903', 'Fabricación de muebles de plástico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1285', 'C', '3100904', 'Fabricación de muebles de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1286', 'C', '3100905', 'Fabricación de estantes  metálicos armables o no');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1287', 'C', '3100906', 'Fabricación de muebles de mimbre y de otros materiales similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1288', 'C', '3100907', 'Fabricación de marcos para sillas principalmente de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1289', 'C', '3100908', 'Fabricación de muebles de diversos materiales (excepto piedra de hormigón y cerámica) y para otros usos no clasificados en ésta clase (excepto muebles para equipo científico, médico y de laboratorio)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1290', 'C', '3100909', 'Fabricación de muebles de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1291', 'C', '3100910', 'Fabricación de muebles para el hogar de diferentes materiales, combinados o no ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1292', 'C', '32', 'OTRAS INDUSTRIAS MANUFACTURERAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1293', 'C', '321', 'FABRICACIÓN DE JOYAS, BISUTERÍA Y ARTÍCULOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1294', 'C', '3211', 'FABRICACIÓN DE JOYAS Y ARTÍCULOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1295', 'C', '32110', 'Fabricación de joyas platerías y joyerías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1296', 'C', '3211001', 'Fabricación de joyas (platerías y joyerías)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1297', 'C', '3211002', 'Ensamble (maquila) de joyas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1298', 'C', '3212', 'FABRICACIÓN DE BISUTERÍA Y ARTÍCULOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1299', 'C', '32120', 'Fabricación de joyas de imitación (fantasía) y artículos conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1300', 'C', '3212001', 'Fabricación de joyas de fantasía y artículos de bisutería (brazaletes de metal, etc. )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1301', 'C', '3212002', 'Ensamble (maquila) de joyas de fantasías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1302', 'C', '322', 'FABRICACIÓN DE INSTRUMENTOS MUSICALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1303', 'C', '3220', 'FABRICACIÓN DE INSTRUMENTOS MUSICALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1304', 'C', '32200', 'Fabricación de instrumentos de música');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1305', 'C', '3220001', 'Fabricación de instrumentos  de cuerda, piezas y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1306', 'C', '3220002', 'Fabricación de instrumentos de música de viento, piezas y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1307', 'C', '3220003', 'Fabricación de instrumentos de percusión, piezas y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1308', 'C', '3220004', 'Fabricación de instrumentos musicales ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1309', 'C', '3220005', 'Fabricación de piezas y accesorios de instrumentos musicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1310', 'C', '3220006', 'Fabricación de instrumentos sonoros de señalización (cuernos, silbatos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1311', 'C', '323', 'FABRICACIÓN DE ARTÍCULOS DE DEPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1312', 'C', '3230', 'FABRICACIÓN DE ARTÍCULOS DE DEPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1313', 'C', '32301', 'Fabricación de artículos de deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1314', 'C', '3230101', 'Fabricación de pelotas para fútbol');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1315', 'C', '3230102', 'Fabricación de otros artículos y equipo para deporte excepto prendas de vestir para deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1316', 'C', '32308', 'Servicio de maquila de productos deportivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1317', 'C', '3230801', 'Ensamble (maquila) de artículos para pesca deportiva');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1318', 'C', '324', 'FABRICACIÓN DE JUEGOS Y JUGUETES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1319', 'C', '3240', 'FABRICACIÓN DE JUEGOS Y JUGUETES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1320', 'C', '32401', 'Fabricación de juegos de mesa y de salón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1321', 'C', '3240101', 'Fabricación de artículos para juegos de mesa y de salón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1322', 'C', '32402', 'Servicio de maquilado de juguetes y juegos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1323', 'C', '3240201', 'Maquilado de juguetes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1324', 'C', '32409', 'Fabricación de juegos y juguetes n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1325', 'C', '3240901', 'Fabricación de juguetes, adornos, muñecos de peluche, felpa, tela, ropa y accesorios para muñecos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1326', 'C', '3240902', 'Fabricación de juegos, estatuillas y  juguetes plásticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1327', 'C', '3240903', 'Fabricación de juegos y juguetes de hule (caucho)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1328', 'C', '3240904', 'Fabricación de muñecos, juguetes y adornos de madera y fibras vegetales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1329', 'C', '3240905', 'Fabricación de juguetes de diversos materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1330', 'C', '3240906', 'Fabricación de juegos recreativos y de ferias ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1331', 'C', '325', 'FABRICACIÓN DE INSTRUMENTOS Y MATERIALES MÉDICOS Y ODONTOLÓGICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1332', 'C', '3250', 'FABRICACIÓN DE INSTRUMENTOS Y MATERIALES MÉDICOS Y ODONTOLÓGICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1333', 'C', '32500', 'Fabricación de instrumentos y suministros médicos y dentales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1334', 'C', '3250001', 'Fabricación de aparatos e instrumentos de uso práctico y científico en medicina, cirugía, odontología y veterinaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1335', 'C', '3250002', 'Fabricación de artículos y materiales para uso médico , quirúrgico, odontológico y otros suministros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1336', 'C', '3250003', 'Fabricación de aparatos y piezas protésicas y ortopédicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1337', 'C', '3250004', 'Fabricación de prótesis dentales ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1338', 'C', '3250005', 'Mecánico dental por cuenta propia (laboratorio dental)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1339', 'C', '3250006', 'Fabricación de muebles y accesorios de uso médico quirúrgicos y odontológicos. Se incluye camas para  hospitales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1340', 'C', '3250007', 'Maquilado de aparatos y suministros médico quirúrgicos y odontológicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1341', 'C', '3250008', 'Fabricación de lentes (anteojos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1342', 'C', '3250009', 'Fabricación de armaduras para anteojos (aros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1343', 'C', '3250010', 'Ensamblado de anteojos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1344', 'C', '3250011', 'Fabricación de calzado ortopédico ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1345', 'C', '329', 'INDUSTRIAS MANUFACTURERAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1346', 'C', '3290', 'INDUSTRIAS MANUFACTURERAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1347', 'C', '32901', 'Fabricación de lápices, bolígrafos, sellos y artículos de librería en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1348', 'C', '3290101', 'Fabricación de lápices de grafito negro y de colores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1349', 'C', '3290102', 'Fabricación de lapiceros de toda clase, mecánicos o no (bolígrafos) y repuestos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1350', 'C', '3290103', 'Fabricación de sellos para fechar, numerar, imprimir y estampar de cualquier material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1351', 'C', '3290104', 'Fabricación de cintas para máquinas de escribir y almohadillas entintadas para sellos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1352', 'C', '32902', 'Fabricación de escobas, cepillos, pinceles y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1353', 'C', '3290201', 'Fabricación de cepillos, escobillas, escobas, plumeros, cepillos de dientes y otros artículos similares a  base de fibras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1354', 'C', '3290202', 'Fabricación de brochas y rodillos para pintar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1355', 'C', '32903', 'Fabricación de artesanías de materiales diversos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1356', 'C', '3290301', 'Fabricación de artesanías de diversos materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1357', 'C', '32904', 'Fabricación de artículos de uso personal y domésticos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1358', 'C', '3290401', 'Fabricación de velas, cirios y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1359', 'C', '3290402', 'Fabricación de árboles de navidad y adornos de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1360', 'C', '3290403', 'Fabricación de artículos de carey, nácar, hueso y de otros productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1361', 'C', '3290404', 'Fabricación de ganchos, broches para  el cabello con o sin adornos, artículos confeccionados con cabello y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1362', 'C', '3290405', 'Fabricación de esponjas de baño (pastes, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1363', 'C', '32905', 'Fabricación de accesorios para las confecciones y la marroquinería n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1364', 'C', '3290501', 'Fabricación de cierres de cremallera (zíppers), ribetes, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1365', 'C', '3290502', 'Fabricación de maniquíes de sastres para vestidos y trajes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1366', 'C', '3290503', 'Fabricación de botones excepto de metales preciosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1367', 'C', '3290504', 'Fabricación de broches, remaches, ganchos de ropa de cualquier material (excepto de metal)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1368', 'C', '32908', 'Servicios de maquila n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1369', 'C', '3290801', 'Maquilado de artesanías de diversos materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1370', 'C', '32909', 'Fabricación de productos manufacturados n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1371', 'C', '3290901', 'Fabricación de flores, frutos y plantas artificiales de cualquier material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1372', 'C', '3290902', 'Fabricación de respaldos de cualquier material para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1373', 'C', '3290903', 'Fabricación de pantallas para lámparas de cualquier material (excepto de metal y vidrio)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1374', 'C', '3290904', 'Fabricación de cintas de fantasía para adornar regalos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1375', 'C', '3290905', 'Fabricación de piñatas y otros accesorios para fiestas infantiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1376', 'C', '3290906', 'Fabricación de recuerdos de diversos materiales para todo tipo de eventos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1377', 'C', '3290907', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1378', 'C', '3290908', 'Fabricación de  ganchos  de metal para  colgar ropa ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1379', 'C', '3290909', 'Elaboracion de productos  de estopa de coco ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1380', 'C', '3290910', 'Fabricación de cajas mortuorias (ataúdes)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1381', 'C', '33', 'REPARACIÓN E INSTALACIÓN DE MAQUINARIA Y EQUIPO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1382', 'C', '331', 'REPARACIÓN Y MANTENIMIENTO DE PRODUCTOS ELABORADOS DE METAL, MAQUINARIA Y EQUIPO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1383', 'C', '3311', 'REPARACIÓN Y MANTENIMIENTO DE PRODUCTOS ELABORADOS DE METAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1384', 'C', '33110', 'Reparación y mantenimiento de productos elaborados de metal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1385', 'C', '3311001', 'Reparación y mantenimiento de tuberías,  depósitos y tanques de metal para almacenamiento y uso industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1386', 'C', '3311002', 'Reparación y mantenimiento de radiadores y recipientes de metal para gas comprimido y gas licuado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1387', 'C', '3311003', 'Reparación de extinguidores de incendios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1388', 'C', '3311004', 'Reparación de bombas (de toda clase), compresores de aire y de gas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1389', 'C', '3311005', 'Reparación y mantenimiento de grifos y válvulas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1390', 'C', '3311006', 'Reparación y mantenimiento de cortinas, portones automáticos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1391', 'C', '3311007', 'Reparación y mantenimiento de armas de fuego');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1392', 'C', '3312', 'REPARACIÓN Y MANTENIMIENTO DE MAQUINARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1393', 'C', '33120', 'Reparación y mantenimiento de maquinaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1394', 'C', '2811001', 'Fabricación de motores y turbinas (excepto para vehículos aeronaves y motocicletas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1395', 'C', '3312002', 'Reparación y mantenimiento de generadores de vapor, excepto calderas de agua caliente para calefacción central');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1396', 'C', '3312003', 'Reparación y mantenimiento de maquinaria, equipo y piezas de máquinas agrícola, pecuaria, forestal y jardinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1397', 'C', '3312004', 'Reparación y mantenimiento de máquinas y equipo de envase y empaque, limpieza de botellas, embotellado, enlatado, sellado y etiquetado, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1398', 'C', '3312005', 'Reparación y mantenimiento de hornos y quemadores para  uso industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1399', 'C', '3312006', 'Reparación de equipo para impeler, asperjar, esparcir, fumigar líquidos, polvos, etc. accionados a mano o no');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1400', 'C', '3312007', 'Reparación y mantenimiento de equipo de aspersión y fumigación para uso agropecuario, forestal y jardinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1401', 'C', '3312008', 'Reparación y mantenimiento de máquinas herramientas para trabajar metales, piedra, hueso, plástico duro, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1402', 'C', '3312009', 'Reparación y mantenimiento de máquinas herramienta para tornear, fresar, taladrar, perforar, rectificar, cepillar, remachar, engrapar, clavar y otras operaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1403', 'C', '3312010', 'Reparación y mantenimiento de prensas para: estampar, imprimir, estrujar, tableros de partículas para la construcción y para la elaboración de otros productos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1404', 'C', '3312011', 'Reparación y mantenimiento de máquinas y equipo para el manejo de metales en caliente: lingoteras, calderas de fundición, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1405', 'C', '3312012', 'Reparación y mantenimiento de máquinas herramientas para equipo industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1406', 'C', '3312013', 'Reparación y mantenimiento de maquinaria y equipo para la explotación de minas y canteras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1407', 'C', '3312014', 'Reparación y mantenimiento de maquinaria  y equipo utilizada en obras  de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1408', 'C', '3312015', 'Reparación y mantenimiento de máquinas para moler granos y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1409', 'C', '3312016', 'Reparación y mantenimiento de máquinas y equipo para extracción y refinación de grasas y aceites');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1410', 'C', '3312017', 'Reparación y mantenimiento de maquinaria, equipo y accesorios para la industria de alimentos, incluyendo, ingenios azucareros y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1411', 'C', '3312018', 'Reparación y mantenimiento de maquinaria  y equipo para la elaboración de productos textiles y prendas de vestir ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1412', 'C', '3312019', 'Reparación y mantenimiento de maquinas y piezas de imprenta');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1413', 'C', '3312020', 'Mantenimiento y reparación de máquinas y equipo utilizado en la fabricación de artículos de plástico, hule y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1414', 'C', '3312021', 'Mantenimiento y reparación de maquinaria y equipo para la industria, excepto las ya especificadas                                   7    INDUSTRIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1415', 'C', '3312022', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1416', 'C', '3312023', 'Reparación y mantenimiento de máquinas y equipo  para manipular y levantar pesos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1417', 'C', '3312024', 'Reparación y mantenimiento de equipo de báscula; cajas registradoras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1418', 'C', '3312025', 'Reparación y mantenimiento de máquinas fotocopiadoras; calculadoras, electrónicas o no y maquinas de escribir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1419', 'C', '3312026', 'Reparación de aparatos y equipo de aire acondicionado,  ventilación, refrigeración y congelación para uso industrial y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1420', 'C', '3312027', 'Reparación de instrumentos y aparatos para verificación y control, excepto el equipo de control de procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1421', 'C', '3312028', 'Reparación de equipo de control de procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1422', 'C', '3312029', 'Reparación de equipo, instrumentos y suministros quirúrgicos, médicos, odontológicos, aparatos ortopédicos y protésicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1423', 'C', '3312030', 'Reparación  y mantenimiento de bombas para gasolinera ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1424', 'C', '3313', 'REPARACIÓN Y MANTENIMIENTO DE EQUIPO ELECTRÓNICO Y ÓPTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1425', 'C', '33130', 'Reparación y mantenimiento de equipo electrónico y óptico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1426', 'C', '3313001', 'Reparación de instrumentos ópticos (binoculares, microscopios, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1427', 'C', '3313002', 'Reparación y mantenimiento de equipo de prueba de emisiones de automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1428', 'C', '3313003', 'Reparación y mantenimiento de instrumentos meteorológicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1429', 'C', '3313004', 'Reparación y mantenimiento de equipo topográfico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1430', 'C', '3313005', 'Reparación y mantenimiento de equipo de resonancia magnética de imágenes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1431', 'C', '3314', 'REPARACIÓN Y MANTENIMIENTO DE EQUIPO ELÉCTRICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1432', 'C', '33140', 'Reparación y mantenimiento de equipo eléctrico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1433', 'C', '3314001', 'Reparación de motores, generadores y transformadores eléctricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1434', 'C', '3314002', 'Reparación y mantenimiento de aparatos de control  y distribución eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1435', 'C', '3314003', 'Reparación y mantenimiento de lámparas y equipo de iluminación eléctrico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1436', 'C', '3315', 'REPARACIÓN Y MANTENIMIENTO DE EQUIPO DE TRANSPORTE, EXCEPTO VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1437', 'C', '33150', 'Reparación y mantenimiento de equipo de transporte, excepto vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1438', 'C', '3315001', 'Reparación de embarcaciones de deporte, recreo o de partes de embarcaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1439', 'C', '3315002', 'Reparación de lanchas, botes,buques, barcos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1440', 'C', '3315003', 'Reparación y mantenimiento de aeronaves');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1441', 'C', '3315004', 'Reparación y mantenimiento de equipo ferroviario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1442', 'C', '3319', 'REPARACIÓN Y MANTENIMIENTO DE OTROS TIPOS DE EQUIPO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1443', 'C', '33190', 'Reparación y mantenimiento de equipos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1444', 'C', '3319001', 'Instalación, reparación y mantenimiento de juegos mecánicos, juegos de feria y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1445', 'C', '3319002', 'Reparación y mantenimiento de cilindros de transporte o barriles y artículos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1446', 'C', '3319003', 'Reparación y mantenimiento de maquinas operadas con monedas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1447', 'C', '3319004', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1448', 'C', '3319005', 'Reparación y mantenimiento de  equipos  de comunicación (torres telefónicas )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1449', 'C', '332', 'INSTALACIÓN DE MAQUINARIA Y EQUIPO INDUSTRIAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1450', 'C', '3320', 'INSTALACIÓN DE MAQUINARIA Y EQUIPO INDUSTRIAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1451', 'C', '33200', 'Instalación de maquinaria y equipo industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1452', 'C', '3320001', 'Servicios de instalación de maquinaria y equipo industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1453', 'C', '3320002', 'Servicios de instalación de equipo de control de procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1454', 'D', 'D', 'SUMINISTROS DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1455', 'D', '35', 'SUMINISTROS DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1456', 'D', '351', 'GENERACIÓN, TRANSMISIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1457', 'D', '3510', 'GENERACIÓN, TRANSMISIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1458', 'D', '35101', 'Generación de energía eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1459', 'D', '3510101', 'Generación de energía eléctrica de origen hidráulico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1460', 'D', '3510102', 'Generación de energía eléctrica de origen geotérmico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1461', 'D', '3510103', 'Generación de energía eléctrica mediante el uso de combustibles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1462', 'D', '3510104', 'Generación de energía eléctrica  solar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1463', 'D', '3510105', 'Generación de energía eléctrica mediante el uso de materia orgánica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1464', 'D', '3510106', 'Generación de energía eléctrica eólica (utilizando la energía del viento)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1465', 'D', '3510107', 'Generación de energía eléctrica de origen mareomotriz (obtenida de la energía de las mareas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1466', 'D', '3510108', 'Planta generadora de energía eléctrica de varias fuentes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1467', 'D', '3510109', 'Planta generadora y distribuidora de energía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1468', 'D', '35102', 'Transmisión de energía Eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1469', 'D', '3510201', 'Transmisión de energía Eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1470', 'D', '35103', 'Distribución de energía Eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1471', 'D', '3510301', 'Distribución de energía Eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1472', 'D', '3510302', 'Comercialización e intermediación bursátil de energía eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1473', 'D', '352', 'FABRICACIÓN DE GAS, DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1474', 'D', '3520', 'FABRICACIÓN DE GAS, DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1475', 'D', '35200', 'Fabricación de gas, distribución de combustible gaseoso por tuberías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1476', 'D', '3520001', 'Fabricación de gas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1477', 'D', '353', 'SUMINISTRO DE VAPOR Y AIRE ACONDICIONADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1478', 'D', '3530', 'SUMINISTRO DE VAPOR Y AIRE ACONDICIONADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1479', 'D', '35300', 'Suministro de vapor y agua caliente');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1480', 'D', '3530001', 'Suministro de vapor y agua caliente');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1481', 'D', '3530002', 'Fabricación de hielo excepto hielo seco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1482', 'E', 'E', 'SUMINISTRO DE AGUA, EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO); GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1483', 'E', '36', 'CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1484', 'E', '360', 'CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1485', 'E', '3600', 'CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1486', 'E', '36000', 'Captación, tratamiento y suministro de agua');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1487', 'E', '3600001', 'Suministro de agua: captación, purificación y distribución');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1488', 'E', '37', 'EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1489', 'E', '370', 'EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1490', 'E', '3700', 'EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1491', 'E', '37000', 'Evacuación de aguas residuales (alcantarillado)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1492', 'E', '3700001', 'Captación y transporte de aguas lluvias y aguas servidas humanas o industriales; a través de redes de alcantarillado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1493', 'E', '38', 'RECOLECCIÓN, TRATAMIENTO Y ELIMINACIÓN DE DESECHOS; RECICLAJE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1494', 'E', '381', 'RECOLECCIÓN DE DESECHOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1495', 'E', '3811', 'RECOLECCIÓN DE DESECHOS NO PELIGROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1496', 'E', '38110', 'Recolección y transporte de desechos sólidos proveniente de hogares y sector urbano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1497', 'E', '3811001', 'Recolección y transporte de desechos sólidos provenientes de hogares y sector urbano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1498', 'E', '3811002', 'Recolección y transporte de desechos sólidos provenientes de la industria y la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1499', 'E', '3812', 'RECOLECCIÓN DE DESECHOS PELIGROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1500', 'E', '38120', 'Recolección de desechos peligrosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1501', 'E', '3812001', 'Recolección de desechos peligrosos provenientes de la industria y agroindustria y especiales (productos químicos, tóxicos, radiactivos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1502', 'E', '3812002', 'Recolección de desechos  de uso médico en hospitales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1503', 'E', '3812003', 'Recolección de desechos provenientes de laboratorios clínicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1504', 'E', '382', 'TRATAMIENTO Y ELIMINACIÓN DE DESECHOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1505', 'E', '3821', 'TRATAMIENTO Y ELIMINACIÓN DE DESECHOS NO PELIGROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1506', 'E', '38210', 'Tratamiento y eliminación de desechos inicuos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1507', 'E', '3821001', 'Tratamiento y eliminación de desechos proveniente de hogares y  sector urbano.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1508', 'E', '3821002', 'Tratamiento y eliminación de desechos proveniente de la industria y la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1509', 'E', '3822', 'TRATAMIENTO Y ELIMINACIÓN DE DESECHOS PELIGROSOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1510', 'E', '38220', 'Tratamiento y eliminación de desechos peligrosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1511', 'E', '3822001', 'Tratamiento y eliminación de desechos sólidos provenientes de la industria y agroindustria (productos químicos, tóxicos, radiactivos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1512', 'E', '3822002', 'Tratamiento y eliminación de desechos  de uso médico en hospitales y laboratorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1513', 'E', '3822003', 'Tratamiento y eliminación de desechos provenientes de laboratorios clínicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1514', 'E', '3822004', 'Tratamiento de desechos líquidos provenientes de la industria, agroindustria y especiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1515', 'E', '3822005', 'Tratamiento de desechos gaseosos que se originan de la maquinaria del transporte rodante');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1516', 'E', '3822006', 'Tratamiento y eliminación de los desechos gaseosos provenientes de la industria y agroindustria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1517', 'E', '383', 'RECICLAJE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1518', 'E', '3830', 'RECICLAJE DE MATERIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1519', 'E', '38301', 'Reciclaje de desperdicios y desechos textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1520', 'E', '3830101', 'Reciclaje de fibras textiles (hilachas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1521', 'E', '38302', 'Reciclaje de desperdicios y desechos de plástico y caucho');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1522', 'E', '3830201', 'Reciclaje de productos de hule o caucho (llantas y otros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1523', 'E', '3830202', 'Reciclaje de productos plástico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1524', 'E', '38303', 'Reciclaje de desperdicios y desechos de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1525', 'E', '3830301', 'Reciclaje de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1526', 'E', '38304', 'Reciclaje de desperdicios y desechos de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1527', 'E', '3830401', 'Reciclaje de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1528', 'E', '3830402', 'Clasificacion de desechos de papel y carton ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1529', 'E', '38305', 'Reciclaje de desperdicios y desechos metálicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1530', 'E', '3830501', 'Reciclaje de desperdicios metálicos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1531', 'E', '38309', 'Reciclaje de desperdicios y desechos no metálicos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1532', 'E', '3830901', 'Reciclaje de varios desperdicios y desechos no metálicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1533', 'E', '39', 'ACTIVIDADES DE SANEAMIENTO Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1534', 'E', '390', 'ACTIVIDADES DE SANEAMIENTO Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1535', 'E', '3900', 'ACTIVIDADES DE SANEAMIENTO Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1536', 'E', '39000', 'Actividades de Saneamiento y otros Servicios de Gestión de Desechos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1537', 'E', '3900001', 'Actividades de Saneamiento y otros Servicios de Gestión de Desechos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1538', 'F', 'F', 'CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1539', 'F', '41', 'CONSTRUCCIÓN DE EDIFICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1540', 'F', '410', 'CONSTRUCCIÓN DE EDIFICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1541', 'F', '4100', 'CONSTRUCCIÓN DE EDIFICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1542', 'F', '41001', 'Construcción de edificios residenciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1543', 'F', '4100101', 'Construcción, ampliación y reforma de edificios, viviendas y otros. (Reparación de viviendas y otras construcciones)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1544', 'F', '4100102', 'Montaje e instalación de viviendas prefabricados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1545', 'F', '41002', 'Construcción de edificios no residenciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1546', 'F', '4100201', 'Construcción de instalaciones industriales y comerciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1547', 'F', '4100202', 'Montaje e instalación de construcciones prefabricados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1548', 'F', '42', 'OBRAS DE INGENIERÍA CIVIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1549', 'F', '421', 'CONSTRUCCIÓN DE CARRETERAS Y LÍNEAS DE FERROCARRIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1550', 'F', '4210', 'CONSTRUCCIÓN DE CARRETERAS Y LÍNEAS DE FERROCARRIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1551', 'F', '42100', 'Construcción de carreteras, calles y caminos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1552', 'F', '4210001', 'Construcción y reparación de carreteras, calles, caminos, puentes, túneles y otras obras de ingeniería civil');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1553', 'F', '4210002', 'Pintado de señales y otras marcas en  carreteras, calles y caminos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1554', 'F', '4210003', 'Instalación de barreras contra impactos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1555', 'F', '422', 'CONSTRUCCIÓN DE PROYECTOS DE SERVICIOS PÚBLICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1556', 'F', '4220', 'CONSTRUCCIÓN DE PROYECTOS DE SERVICIOS PÚBLICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1557', 'F', '42200', 'Construcción de proyectos de servicio público');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1558', 'F', '4220001', 'Construcción de líneas de comunicación y energía (cables) de gran longitud');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1559', 'F', '4220002', 'Perforación de  pozos para la obtención de agua');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1560', 'F', '4220003', 'Perforación de pozos geotérmicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1561', 'F', '4220004', 'Obras de captación, depuración y distribución de agua; sistemas de riego y drenaje.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1562', 'F', '429', 'CONSTRUCCIÓN DE OTRAS OBRAS DE INGENIERÍA CIVIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1563', 'F', '4290', 'CONSTRUCCIÓN DE OTRAS OBRAS DE INGENIERÍA CIVIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1564', 'F', '42900', 'Construcción de obras de ingeniería civil n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1565', 'F', '4290001', 'Construcción de obras de ingeniería hidráulica: presas hidráulicas, obras portuarias, ordenamiento hídrico y diques');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1566', 'F', '4290002', 'Construcción de obras de ingeniería sanitaria para saneamiento y control de la contaminación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1567', 'F', '43', 'ACTIVIDADES ESPECIALIZADAS DE CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1568', 'F', '431', 'DEMOLICIÓN Y PREPARACIÓN DE TERRENOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1569', 'F', '4311', 'DEMOLICIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1570', 'F', '43110', 'Demolición');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1571', 'F', '4311001', 'Demolición de edificios y otras estructuras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1572', 'F', '4312', 'PREPARACIÓN DE TERRENO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1573', 'F', '43120', 'Preparación de terreno');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1574', 'F', '4312001', 'Limpieza, terraplenamiento , nivelación, movimiento de tierra, excavación , construcción  de galerías, drenajes, y demás actividades de preparación de terreno (terracería y urbanización)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1575', 'F', '432', 'INSTALACIONES ELÉCTRICAS, DE FONTANERÍA Y OTRAS INSTALACIONES PARA OBRAS DE CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1576', 'F', '4321', 'INSTALACIONES ELÉCTRICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1577', 'F', '43210', 'Instalaciones eléctricas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1578', 'F', '4321001', 'Instalación de cables y otros dispositivos eléctricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1579', 'F', '4321002', 'Instalaciones eléctricas para: sistemas de alumbrado, diversos equipos, señalización vial, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1580', 'F', '4321003', 'Instalación de equipos eléctricos y electrónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1581', 'F', '4321004', 'Instalación de cableado de redes para computación y televisión por cable');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1582', 'F', '4321005', 'Instalación de sistemas de seguridad y comunicación ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1583', 'F', '4321006', 'Instalación de equipos de alarma contra incendios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1584', 'F', '4321007', 'Instalación de antenas de todo tipo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1585', 'F', '4322', 'INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1586', 'F', '43220', 'Instalación de fontanería, calefacción y aire acondicionado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1587', 'F', '4322001', 'Instalación de calefacción, ventilación y acondicionamiento de aire');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1588', 'F', '4322002', 'Instalación  de sistemas y equipo de refrigeración');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1589', 'F', '4322003', 'Fontanería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1590', 'F', '4329', 'OTRAS INSTALACIONES PARA OBRAS DE CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1591', 'F', '43290', 'Otras instalaciones para obras de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1592', 'F', '4329001', 'Aislamiento térmico, acústico, impermeabilización etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1593', 'F', '4329002', 'Instalación de techos estructurales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1594', 'F', '4329003', 'Instalación de puertas automáticas y giratorias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1595', 'F', '4329004', 'Instalación de pararrayos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1596', 'F', '4329005', 'Instalación  y  mantenimiento de ascensores y escaleras eléctricas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1597', 'F', '433', 'TERMINACIÓN Y ACABADO DE EDIFICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1598', 'F', '4330', 'TERMINACIÓN Y ACABADO DE EDIFICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1599', 'F', '43300', 'Terminación y acabado de edificios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1600', 'F', '4330001', 'Pintura de edificios y de viviendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1601', 'F', '4330002', 'Instalación de cielos falsos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1602', 'F', '4330003', 'Instalación de vidrios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1603', 'F', '4330004', 'Instalación de azulejos y baldosas.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1604', 'F', '4330005', 'Decoración de edificios, casas etc. excepto decoración de interiores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1605', 'F', '4330006', 'Revestimiento de suelo, paredes, empapelado etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1606', 'F', '4330007', 'Instalación de elementos de cocina, armarios empotrados, estructura de almacenaje en casas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1607', 'F', '4330008', 'Diseño y decoración de jardines');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1608', 'F', '4330009', 'Instalación de puertas, ventanas, marcos de puertas y ventanas, escaleras de madera y otros similares en edificios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1609', 'F', '439', 'OTRAS ACTIVIDADES ESPECIALIZADAS DE CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1610', 'F', '4390', 'OTRAS ACTIVIDADES ESPECIALIZADAS DE CONSTRUCCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1611', 'F', '43900', 'Otras actividades especializadas de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1612', 'F', '4390001', 'Alquiler de equipo de construcción y demolición dotado de operarios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1613', 'F', '4390002', 'Construcción y mantenimiento de piscinas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1614', 'F', '4390003', 'Servicios de albañilería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1615', 'C', '2811', 'FABRICACIÓN DE MOTORES Y TURBINAS, EXCEPTO MOTORES PARA AERONAVES, VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1616', 'C', '28110', 'Fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1617', 'G', '451', 'VENTA DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1618', 'G', '4510', 'VENTA DE VEHÍCULOS AUTOMOTORES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1619', 'G', '45100', 'Venta de vehículos automotores ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1620', 'G', '4510001', 'Venta al por mayor de vehículos automotores nuevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1621', 'G', '4510002', 'Venta al por mayor de vehículos automotores usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1622', 'G', '4510003', 'Venta al por menor de vehículos automotores  nuevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1623', 'G', '4510004', 'Venta al por menor de vehículos automotores usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1624', 'G', '452', 'MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1625', 'G', '4520', 'MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1626', 'G', '45201', 'Reparación mecánica de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1627', 'G', '4520101', 'Reparación mecánica automotriz');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1628', 'G', '4520102', 'Reparación de vehículos automotores diesel (laboratorio diesel).');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1629', 'G', '4520103', 'Reparación de frenos de vehículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1630', 'G', '4520104', 'Reparación de clutch de vehículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1631', 'G', '4520105', 'Remolque de vehículos automotores ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1632', 'G', '45202', 'Reparaciones eléctricas del automotor y recarga de baterías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1633', 'G', '4520201', 'Reparación eléctrica de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1634', 'G', '4520202', 'Reparación del sistema de inyección electrónica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1635', 'G', '4520203', 'Instalación y reparación de aire acondicionado en vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1636', 'G', '4520204', 'Reparación y carga de baterías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1637', 'G', '4520205', 'Instalación y reparación  de alarmas en  vehículos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1638', 'G', '4520206', 'Reparación de sistema  computarizado de vehiculo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1639', 'G', '45203', 'Enderezado y pintura de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1640', 'G', '4520301', 'Enderezado y pintura de vehículos automotores (soldadura autógena)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1641', 'G', '45204', 'Reparaciones de radiadores, escapes y silenciadores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1642', 'G', '4520401', 'Reparación de radiadores, escapes y silenciadores de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1643', 'G', '45205', 'Reparación y reconstrucción de vías, stop y otros artículos de fibra de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1644', 'G', '4520501', 'Reparación y reconstrucción de vías, stop y otros artículos de fibra de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1645', 'G', '45206', 'Reparación de llantas de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1646', 'G', '4520601', 'Reparación de llantas de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1647', 'G', '45207', 'Polarizado de vehículos (mediante la adhesión de papel especial a los vidrios)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1648', 'G', '4520701', 'Polarizado de vehículos (mediante la adhesión de papel especial a los vidrios)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1649', 'G', '45208', 'Lavado y pasteado de vehículos (carwash)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1650', 'G', '4520801', 'Lavado y pasteado de vehículos (carwash)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1651', 'G', '45209', 'Reparaciones de vehículos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1652', 'G', '4520901', 'Reparación y rectificación de cilindros y cigüeñales de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1653', 'G', '4520902', 'Reparación,  reconstrucción y rectificación de piezas de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1654', 'G', '4520903', 'Alineado, cambio de aceite,  engrase de vehículos y otros servicios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1655', 'G', '4520904', 'Instalación y reparación de aparatos de sonido en vehículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1656', 'G', '4520905', 'Reparación de contenedores ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1657', 'G', '4520906', 'Impeccion técnica de vehículos (emisión de gases)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1658', 'G', '453', 'VENTA DE PARTES, PIEZAS Y ACCESORIOS PARA VEHÍCULOS AUTOMOTORES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1659', 'G', '4530', 'VENTA DE PARTES, PIEZAS Y ACCESORIOS PARA VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1660', 'G', '45301', 'Venta de partes, piezas y accesorios nuevos para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1661', 'G', '4530101', 'Venta al por mayor de repuestos nuevos para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1662', 'G', '4530102', 'Venta al por mayor de baterías para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1663', 'G', '4530103', 'Venta al por mayor  de llantas y tubos nuevos para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1664', 'G', '4530104', 'Venta al por menor de baterías para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1665', 'G', '4530105', 'Venta al por menor de repuestos nuevos para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1666', 'G', '4530106', 'Venta al por menor de llantas y tubos nuevos para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1667', 'G', '4530107', 'Venta de artículos nuevos para automotores (respaldos, alfombras, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1668', 'G', '4530108', 'Venta de partes, piezas y accesorios nuevos para vehículos automotores n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1669', 'G', '45302', 'Venta de partes, piezas y accesorios usados para vehículos automotores ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1670', 'G', '4530201', 'Venta al por mayor de repuestos usados para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1671', 'G', '4530202', 'Venta al por mayor de llantas y tubos usados para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1672', 'G', '4530203', 'Venta al por menor de repuestos usados para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1673', 'G', '4530204', 'Venta al por menor de llantas y tubos usados para vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1674', 'G', '4530208', 'Venta de partes, piezas y accesorios usados para vehículos automotores n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1675', 'G', '3091002', 'Fabricación de piezas y accesorios de motocicletas y motonetas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1676', 'G', '2790001', 'Fabricación de piezas, equipo de iluminación para vehículos automotores, motocicletas, bicicletas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1677', 'G', '4540301', 'Mantenimiento y reparación  de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1678', 'G', '45403', 'Mantenimiento y reparación de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1679', 'G', '3312001', 'Reparación, mantenimiento y reconstrucción de motores y turbinas (excepto para aeronaves, vehículos y motocicletas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1680', 'G', '4659905', 'Venta al por mayor de equipo, partes y piezas de transporte: acuático, aéreo y otros, excepto automotores, motocicletas y bicicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1681', 'G', '4540102', 'Venta al por mayor de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1682', 'G', '4540201', 'Venta al por mayor de repuestos, piezas y accesorios de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1683', 'G', '4540101', 'Venta al por menor de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1684', 'G', '4540202', 'Venta al por menor de repuestos,  piezas y accesorios para motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1685', 'G', '45401', 'Venta de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1686', 'G', '461', 'VENTA AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1687', 'G', '4610', 'VENTA AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1688', 'G', '46100', 'Venta al por mayor a cambio de retribución o por contrata');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1689', 'G', '4610001', 'Actividades comerciales de distribuidores de mercancías  por comisión o contrata ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1690', 'G', '4610002', 'Actividades de casa de representación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1691', 'G', '4610003', 'Actividades de exportación ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1692', 'G', '4610004', 'Actividades de importación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1693', 'G', '4610005', 'Actividades de subastadores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1694', 'G', '4610006', 'Agencia  o sucursal  comercial (delegación subsidiaria de una empresa, vende con poder de otro o gestiona  un negocio ajeno)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1695', 'G', '4610007', 'Cooperativas de comercialización');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1696', 'G', '4610008', 'Corredores de mercancías y productos básicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1697', 'G', '462', 'VENTA AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS Y ANIMALES VIVOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1698', 'G', '4620', 'VENTA AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS Y ANIMALES VIVOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1699', 'G', '46201', 'Venta al por mayor de materias primas agrícolas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1700', 'G', '4620101', 'Venta al por mayor de granos ( cereales, leguminosas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1701', 'G', '4620102', 'Venta  al por mayor de semillas mejoradas para cultivo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1702', 'G', '4620103', 'Venta  al por mayor de café  uva');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1703', 'G', '4620104', 'Venta  al por mayor de café  oro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1704', 'G', '4620105', 'Venta  al por mayor de cardamomo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1705', 'G', '4620106', 'Venta  al por mayor de copra de coco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1706', 'G', '4620107', 'Venta  al por mayor de caña de azúcar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1707', 'G', '4620108', 'Venta  al por mayor de melaza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1708', 'G', '4620109', 'Venta al por mayor  de cacao en grano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1709', 'G', '4620110', 'Venta  al por mayor de tabaco en bruto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1710', 'G', '4620111', 'Venta al por mayor  de granos o semillas oleaginosas (ajonjolí, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1711', 'G', '4620112', 'Venta al por mayor  de flores y otros productos naturales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1712', 'G', '4620113', 'Venta al por mayor de plantas y otros materiales y productos vegetales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1713', 'G', '4620114', 'Venta al por mayor de materias primas  para la elaboración de alimentos animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1714', 'G', '4620115', 'Venta al por mayor de pastes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1715', 'G', '46202', 'Venta al por mayor de productos de la silvicultura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1716', 'G', '4620201', 'Venta al por mayor de madera en trozas para aserrar.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1717', 'G', '4620202', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1718', 'G', '4620203', 'Venta al por mayor  de bálsamo (sin procesar)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1719', 'G', '4620204', 'Venta  al por mayor de otras savias y resinas naturales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1720', 'G', '46203', 'Venta al por mayor de productos pecuarios y de granja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1721', 'G', '4620301', 'Venta  al por mayor de ganado bovino (vivo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1722', 'G', '4620302', 'Venta al por mayor  de animales porcinos, ovinos, caprino, canículas, apícolas vivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1723', 'G', '4620303', 'Venta al por mayor  de aves de corral vivas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1724', 'G', '4620304', 'Venta al por mayor  de otros animales vivos: peces, pájaros, garrobos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1725', 'G', '463', 'VENTA AL POR MAYOR DE ALIMENTOS, BEBIDAS Y TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1726', 'G', '4630', 'VENTA AL POR MAYOR DE ALIMENTOS, BEBIDAS Y TABACO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1727', 'G', '46301', 'Venta por mayor de Alimentos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1728', 'G', '4630101', 'Venta al por mayor de frutas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1729', 'G', '4630102', 'Venta al por mayor de hortalizas (verduras), legumbres y tubérculos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1730', 'G', '4630103', 'Venta al por mayor de pollos,  gallinas destazadas, pavos y otras aves');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1731', 'G', '4630104', 'Venta al por mayor de carne bovina y porcina');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1732', 'G', '4630105', 'Venta  al por mayor de productos de carne y embutidos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1733', 'G', '4630106', 'Venta al por mayor de manteca de cerdo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1734', 'G', '4630107', 'Venta  al por mayor de huevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1735', 'G', '4630108', 'Venta al por mayor de pescado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1736', 'G', '4630109', 'Venta al por mayor de camarones y langostas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1737', 'G', '4630110', 'Venta al por mayor de moluscos (calamar, caracol, pulpo, etc.) y otros crustáceos y mariscos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1738', 'G', '4630111', 'Venta al por mayor de productos lácteos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1739', 'G', '4630112', 'Venta al por mayor de leche en polvo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1740', 'G', '4630113', 'Venta al por mayor de materias primas de  panadería y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1741', 'G', '4630114', 'Venta al por mayor de productos de panadería (pan dulce, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1742', 'G', '4630115', 'Venta  al por mayor de cakes, repostería, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1743', 'G', '4630116', 'Venta al por mayor de accesorios y adornos para pastelería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1744', 'G', '4630117', 'Venta al por mayor de café molido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1745', 'G', '4630118', 'Venta al por mayor de café soluble');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1746', 'G', '4630119', 'Supermercado mayorista (predomina la venta de productos alimenticios)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1747', 'G', '4630120', 'Tienda mayorista (predomina la venta de productos alimenticios)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1748', 'G', '4630121', 'Venta al por mayor de productos alimenticios vegetales procesados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1749', 'G', '4630122', 'Venta al por mayor de especias,  condimentos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1750', 'G', '4630123', 'Venta al por mayor de dulce de panela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1751', 'G', '4630124', 'Venta  al por mayor de dulces (confiterías, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1752', 'G', '4630125', 'Venta al por mayor de jaleas, mermeladas, frutas deshidratadas y otras similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1753', 'G', '4630126', 'Venta al por mayor de chocolate');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1754', 'G', '4630127', 'Venta al por mayor de aceites y grasas comestibles vegetal y animal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1755', 'G', '4630128', 'Venta  al por mayor de aceites y grasas  de origen vegetal y animal sin refinar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1756', 'G', '4630129', 'Venta al por mayor de pastas alimenticias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1757', 'G', '4630130', 'Venta al por mayor de sal comestible');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1758', 'G', '4630131', 'Venta al por mayor de miel de abeja.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1759', 'G', '4630132', 'Venta al por mayor de sorbetes, helados, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1760', 'G', '4630133', 'Venta al por mayor de vinagre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1761', 'G', '4630134', 'Venta al por mayor de alimento para mascotas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1762', 'G', '4630135', 'Venta al por mayor de leche fresca ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1763', 'G', '4630136', 'Venta al por mayor de azúcar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1764', 'G', '4630137', 'Venta al por mayor de encurtidos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1765', 'G', '46302', 'Venta al por mayor de bebidas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1766', 'G', '4630201', 'Venta al por mayor de abarrotes (vinos, licores,  productos alimenticios envasados, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1767', 'G', '4630202', 'Venta  al por mayor de aguas gaseosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1768', 'G', '4630203', 'Venta al por mayor de agua purificada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1769', 'G', '4630204', 'Venta al por mayor de refrescos y otras bebidas, líquidas o en polvo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1770', 'G', '4630205', 'Venta  al por mayor de cerveza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1771', 'G', '4630206', 'Venta al por mayor de licores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1772', 'G', '4630207', 'Venta al por mayor de hielo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1773', 'G', '46303', 'Venta al por mayor de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1774', 'G', '4630301', 'Venta al por mayor de cigarrillos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1775', 'G', '4630302', 'Venta al por mayor de puros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1776', 'G', '464', 'VENTA AL POR MAYOR DE ENSERES DOMÉSTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1777', 'G', '4641', 'VENTA AL POR MAYOR DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CALZADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1778', 'G', '46411', 'Venta al por mayor de hilados, tejidos y productos textiles de mercería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1779', 'G', '4641101', 'Venta al por mayor de telas y  tejidos en piezas, rollos o bobinas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1780', 'G', '4641102', 'Venta al por mayor de hilos, encajes, botones y otros artículos, materiales de costura (mercería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1781', 'G', '4641103', 'Venta al por mayor de cintas para calzado y otros artículos textiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1782', 'G', '4641104', 'Venta al por mayor de lona de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1783', 'G', '46412', 'Venta al por mayor de artículos textiles excepto confecciones para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1784', 'G', '4641201', 'Venta al por mayor de sacos de henequén y de otras fibras naturales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1785', 'G', '4641202', 'Venta al por mayor de sacos de fibra sintética');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1786', 'G', '4641203', 'Venta al por mayor de cordelería de fibra natural y sintética');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1787', 'G', '4641204', 'Venta al por mayor de artículos de fibras naturales sintéticas, (hamacas etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1788', 'G', '46413', 'Venta al por mayor de confecciones textiles para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1789', 'G', '4641301', 'Venta al por mayor de toallas y otros artículos del mismo material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1790', 'G', '4641302', 'Venta al por mayor de colchas y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1791', 'G', '4641303', 'Venta al por mayor de  ropa de cama');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1792', 'G', '4641304', 'Venta al por mayor de cortinas y alfombras  de diferentes materiales y formas (incluyendo otros materiales y accesorios)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1793', 'G', '46414', 'Venta al por mayor de prendas de vestir y accesorios de vestir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1794', 'G', '4641401', 'Venta al por mayor de ropa de tejido de punto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1795', 'G', '4641402', 'Venta al por mayor de ropa para deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1796', 'G', '4641403', 'Venta al por mayor de calcetas, calcetines, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1797', 'G', '4641404', 'Venta al por mayor de camisas (camisería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1798', 'G', '4641405', 'Venta al por mayor de ropa interior para ambos sexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1799', 'G', '4641406', 'Venta al por mayor de pantalones y otras prendas para hombres');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1800', 'G', '4641407', 'Venta al por mayor de ropa para niños');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1801', 'G', '4641408', 'Venta al por mayor de ropa de vestir para mujeres');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1802', 'G', '4641409', 'Venta al por mayor de prendas de vestir (Almacén de ropa)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1803', 'G', '4641410', 'Venta al por mayor de toda clase  de ropa (bazar), etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1804', 'G', '4641411', 'Venta al por mayor de medias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1805', 'G', '4641412', 'Venta al por mayor de sombreros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1806', 'G', '46415', 'Venta al por mayor de ropa usada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1807', 'G', '4641501', 'Venta al por mayor de ropa usada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1808', 'G', '46416', 'Venta al por mayor de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1809', 'G', '4641601', 'Venta al por mayor de calzado de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1810', 'G', '46417', 'Venta al por mayor de artículos de marroquinería y talabartería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1811', 'G', '4641701', 'Venta al por mayor de maletas, carteras, bolsos y otros artículos similares de cuero natural o sintético y de otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1812', 'G', '4641702', 'Venta al por mayor de otros artículos de talabartería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1813', 'G', '46418', 'Venta al por mayor de artículos de peletería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1814', 'G', '4641801', 'Venta al por mayor de cuero natural, sintético y otros artículos de peletería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1815', 'G', '46419', 'Venta al por mayor de otros artículos textiles n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1816', 'G', '4641901', 'Venta al por mayor de articulos textiles ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1817', 'G', '4649', 'VENTA AL POR MAYOR DE OTROS ENSERES DOMÉSTICOS.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1818', 'G', '46491', 'Venta al por mayor de productos medicinales, cosméticos, perfumería y productos de limpieza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1819', 'G', '4649101', 'Venta al por mayor de productos medicinales: farmacéuticos y naturópatas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1820', 'G', '4649102', 'Venta al por mayor de medicamentos, artículos y otros productos de uso veterinario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1821', 'G', '4649103', 'Venta al por mayor de productos y artículos de belleza  y de  uso personal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1822', 'G', '4649104', 'Venta al por mayor de productos de limpieza, para el hogar: detergente, jabón de lavar etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1823', 'G', '4649105', 'Venta al por mayor de alcohol');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1824', 'G', '4649106', 'Venta al por mayor de otros artículos desechables: pañales, toallas sanitarias etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1825', 'G', '46492', 'Venta al por mayor de relojes y artículos de joyería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1826', 'G', '4649201', 'Venta al por mayor de relojes y artículos de joyería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1827', 'G', '4649202', 'Venta al por mayor de joyas de fantasía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1828', 'G', '46493', 'Venta al por mayor de electrodomésticos y artículos del hogar excepto bazar; artículos de iluminación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1829', 'G', '4649301', 'Venta al por mayor de aparatos electrodomésticos y electrónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1830', 'G', '4649302', 'Venta al por mayor de cocinas de gas y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1831', 'G', '4649303', 'Venta al por mayor de artículos de iluminación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1832', 'G', '4649304', 'Venta al por mayor de instrumentos  musicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1833', 'G', '4649305', 'Venta al por mayor de discos para fonógrafos, cassettes, cintas magnetofónicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1834', 'G', '4649306', 'Venta al por mayor de muebles para diferentes usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1835', 'G', '4649307', 'Venta al por mayor de colchones, almohadas, cojines, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1836', 'G', '46494', 'Venta al por mayor de artículos de bazar y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1837', 'G', '4649401', 'Venta al por mayor de artículos de aluminio para el hogar y para otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1838', 'G', '4649402', 'Venta al por mayor de artículos de lámina y hojalata para el hogar y para otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1839', 'G', '4649403', 'Venta al por mayor de depósitos y otros artículos plásticos para el hogar y otros usos, incluyendo los desechables de durapax  y no desechables');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1840', 'G', '4649404', 'Venta al por mayor de artículos de arcilla corriente o barro,  para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1841', 'G', '4649405', 'Venta al por mayor de artículos de cerámica (arcilla muy fina o porcelana), vajillas  y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1842', 'G', '4649406', 'Venta al por mayor de diversos materiales, objetos de adorno y decoración incluyendo artículos para recubrir pisos, papel tapiz, cuadros y accesorios. etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1843', 'G', '4649407', 'Venta al por mayor de artículos de vidrio y cristalerías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1844', 'G', '4649408', 'Bazar de artículos diversos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1845', 'G', '46495', 'Venta al por mayor de artículos de óptica y fotografía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1846', 'G', '4649501', 'Venta al por mayor de cámaras fotográficas, accesorios y materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1847', 'G', '4649502', 'Venta al por mayor de artículos ópticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1848', 'G', '4649503', 'Venta al por mayor de equipo cinematográfico, accesorios y materiales (cámaras, etc.) y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1849', 'G', '46496', 'Venta al por mayor de revistas, periódicos, libros, artículos de librería y artículos de papel y cartón en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1850', 'G', '4649601', 'Librería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1851', 'G', '4649602', 'Venta al por mayor de revistas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1852', 'G', '4649603', 'Venta al por mayor de periódicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1853', 'G', '4649604', 'Venta al por mayor de papel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1854', 'G', '4649605', 'Venta al por mayor de artículos de papel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1855', 'G', '4649606', 'Venta al por mayor de cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1856', 'G', '4649607', 'Venta al por mayor de artículos de cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1857', 'G', '46497', 'Venta de artículos deportivos, juguetes y rodados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1858', 'G', '4649701', 'Venta al por mayor de juguetes y juegos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1859', 'G', '4649702', 'Venta al por mayor de bicicletas, partes, accesorios y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1860', 'G', '4649703', 'Venta al por mayor de artículos deportivos, (patines, pelotas, raquetas, etc.). Excepto ropa deportiva');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1861', 'G', '46498', 'Venta al por mayor de productos usados para el hogar o el uso personal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1862', 'G', '4649801', 'Venta al por mayor de aparatos y otros artículos usados ( para el hogar)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1863', 'G', '46499', 'Venta al por mayor de enseres domésticos y de uso personal n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1864', 'G', '4649901', 'Venta al por mayor de artículos religiosos y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1865', 'G', '4649902', 'Venta al por mayor de flores artificiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1866', 'G', '4649903', 'Venta al por mayor de escobas, cepillos y filamentos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1867', 'G', '4649904', 'Venta al por mayor de artículos y utensilios para la cocina y la mesa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1868', 'G', '4649905', 'Venta al por mayor de artesanías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1869', 'G', '4649906', 'Venta al por mayor de fósforos y cerillos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1870', 'G', '4649907', 'Venta al por mayor de velas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1871', 'G', '4649908', 'Almacén al por mayor de artículos diversos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1872', 'G', '465', 'VENTA AL POR MAYOR DE MAQUINARIA, EQUIPO Y MATERIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1873', 'G', '4651', 'VENTA AL POR MAYOR DE COMPUTADORAS, EQUIPO INFORMÁTICO PERIFÉRICO Y PROGRAMAS INFORMÁTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1874', 'G', '46510', 'Venta al por mayor de computadoras, equipo informático periférico y programas informáticos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1875', 'G', '4651001', 'Venta al por mayor de equipo (computadoras), accesorios y materiales de uso informático');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1876', 'G', '4651002', 'Venta al por mayor de software');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1877', 'G', '4652', 'VENTA AL POR MAYOR DE EQUIPO, PARTES Y PIEZAS  ELECTRÓNICOS  Y DE TELECOMUNICACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1878', 'G', '46520', 'Venta al por mayor de equipos de comunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1879', 'G', '4652001', 'Venta al por mayor de equipo, aparatos,  accesorios y materiales de comunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1880', 'G', '4652002', 'Venta al por mayor de máquinas y aparatos electrónicos, excluyendo enseres de uso domésticos y otras ya incluidas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1881', 'G', '4652003', 'Venta al por mayor de sistemas, plantas, equipo, aparatos y suministros y accesorios de telecomunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1882', 'G', '4652004', 'Venta al por mayor de tarjetas prepago');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1883', 'G', '4653', 'VENTA AL POR MAYOR DE MAQUINARIA, EQUIPO Y MATERIALES AGROPECUARIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1884', 'G', '46530', 'Venta al por mayor de maquinaria y equipo agropecuario, accesorios, partes y suministros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1885', 'G', '4653001', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la agricultura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1886', 'G', '4653002', 'Venta al por mayor de equipo, accesorios y materiales para riego y drenaje');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1887', 'G', '4653003', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la producción ganadera, bovina, porcina, avicultura, avícola, apícola, y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1888', 'G', '4653004', 'Venta al por mayor de equipo, máquinas, accesorios, materiales y otros artículos para beneficiado y limpieza de granos para agroindustria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1889', 'G', '4653005', 'Venta al por mayor de equipo y accesorios para la pesca y la acuicultura: buques, botes, motores marinos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1890', 'G', '4653006', 'Venta al por mayor de maquinaria, equipo, accesorios, herramientas, otros artículos y materiales  para la agricultura, ganadería, riego y forestal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1891', 'G', '4653007', 'Venta al por mayor de equipo, repuestos y accesorios de fumigación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1892', 'G', '4653008', 'Venta al por mayor de máquinas, equipos, accesorios, artículos,  materiales para la pesca y acuicultura (cultivo y crianza de peces, camarones, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1893', 'G', '4659', 'VENTA AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1894', 'G', '46591', 'Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y sus productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1895', 'G', '4659101', 'Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y  sus  productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1896', 'G', '46592', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para las industria gráfica y del papel, cartón y productos de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1897', 'G', '4659201', 'Venta al por mayor de maquinaria,  equipo, accesorios y materiales para la industria de  papel, cartón y productos de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1898', 'G', '4659202', 'Venta al por mayor de máquinas y equipo, accesorios y materiales para la imprenta y encuadernación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1899', 'G', '46593', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria de productos químicos, plástico y caucho');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1900', 'G', '4659301', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la  industria de  productos químicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1901', 'G', '4659302', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria del plástico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1902', 'G', '46594', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria metálica y de sus productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1903', 'G', '4659401', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria metálica y de sus productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1904', 'G', '46595', 'Venta al por mayor de equipamiento para uso médico, odontológico, veterinario y servicios conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1905', 'G', '4659501', 'Venta al por mayor de aparatos y accesorios médicos, odontológicos y hospitalarios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1906', 'G', '4659502', 'Venta al por mayor de aparatos, equipo, accesorios y materiales para laboratorio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1907', 'G', '4659503', 'Venta al por mayor de instrumentos y dispositivos ortopédicos y quirúrgicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1908', 'G', '4659504', 'Venta al por mayor de equipo, artículos y materiales para uso médico, odontológico, y hospitales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1909', 'G', '4659505', 'Venta al por mayor de equipo y artículos ortopédicos y odontológicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1910', 'G', '46596', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria de la alimentación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1911', 'G', '4659601', 'Venta al por mayor de maquinarias, equipos, accesorios y partes para la industria de la alimentación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1912', 'G', '4659602', 'Venta al por mayor de maquinaria y accesorios para ingenios azucareros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1913', 'G', '46597', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria textil, confecciones y cuero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1914', 'G', '4659701', 'Venta al por mayor de maquinaria, equipos, accesorios y partes para la industria textil, confecciones y cuero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1915', 'G', '4659702', 'Venta al por mayor de maquinaria, equipo, repuestos, accesorios y materiales para la industria textil, incluyendo máquinas de coser');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1916', 'G', '4659703', 'Venta al por mayor de maquinaria para la industria del cuero natural y sintético');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1917', 'G', '46598', 'Venta al por mayor de maquinaria, equipo y accesorios para la construcción y explotación de minas y canteras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1918', 'G', '4659801', 'Venta al por mayor de maquinaria, equipo, herramientas y accesorios para la construcción y explotación de minas y canteras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1919', 'G', '46599', 'Venta al por mayor de otro tipo de maquinaria y equipo con sus accesorios y partes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1920', 'G', '4659901', 'Venta al por mayor de motores plantas generadoras de energía eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1921', 'G', '4659902', 'Venta al por mayor de equipo, aparatos,  accesorios y materiales para refrigeración industrial,  acondicionamiento de aire');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1922', 'G', '4659903', 'Venta al por mayor de sistemas, equipo, aparatos y materiales de aire acondicionado y refrigeración');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1923', 'G', '4659904', 'Venta al por mayor de equipo, aparatos, accesorios y materiales para barberías y salones de belleza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1924', 'G', '45402', 'Venta de repuestos, piezas y accesorios de motocicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1925', 'G', '4659906', 'Venta al por mayor de equipo, accesorios, artículos y materiales para uso profesional: dibujo arquitectónico, ingenierías y otras profesiones conexas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1926', 'G', '4659907', 'Venta al por mayor de purificadores, filtros y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1927', 'G', '4659908', 'Venta al por mayor de maquinaria, equipo,  accesorios y materiales para el comercio y servicio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1928', 'G', '4659909', 'Venta al por mayor de aparatos, equipos, accesorios para medir la contaminación del medio ambiente, generada por los combustibles utilizados en la maquinaria industrial, de transporte, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1929', 'G', '4659910', 'Venta al por mayor de mobiliario, equipo y accesorios de oficina ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1930', 'G', '4659911', 'Venta al por mayor de máquinas y materiales de oficina y contabilidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1931', 'G', '4659912', 'Venta al por mayor de maquinaria, equipo y accesorios para la industria.(excepto  las especificadas en esta clase)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1932', 'G', '4659913', 'Venta al por mayor de materiales, repuestos y accesorios para refrigeración y aire acondicionado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1933', 'G', '4659914', 'Venta al por mayor de básculas, repuestos y accesorios y otros equipos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1934', 'G', '4659915', 'Venta al por mayor de materiales,  repuestos y accesorios para aparatos eléctricos y electrónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1935', 'G', '4659916', 'Venta al por mayor de equipo y accesorios para  gasolineras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1936', 'G', '4659917', 'Venta al por mayor de plantas, motores y accesorios para la generación de energía eléctrica y para otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1937', 'G', '4659918', 'Venta por mayor de ascensores y escaleras eléctricas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1938', 'G', '4659919', 'Venta al por mayor de cajeros automáticos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1939', 'G', '4659920', 'Venta por mayor de repuestos y accesorios para  aeronaves ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1940', 'G', '4659921', 'Venta al por mayor  de equipo  y accesorio para  bombeo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1941', 'G', '466', 'VENTA AL POR MAYOR DE OTROS PRODUCTOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1942', 'G', '4661', 'VENTA AL POR MAYOR DE COMBUSTIBLES SÓLIDOS, LÍQUIDOS Y GASEOSOS Y DE PRODUCTOS CONEXOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1943', 'G', '46610', 'Venta al por mayor de combustibles sólidos, líquidos , gaseosos y de productos conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1944', 'G', '4661001', 'Venta al por mayor de combustibles para automotores, aviones, barcos, maquinaria  y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1945', 'G', '4661002', 'Venta al por mayor de lubricantes, grasas y  otros aceites para automotores, maquinaria  industrial, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1946', 'G', '4661003', 'Venta al por mayor de gas propano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1947', 'G', '4661004', 'Venta al por mayor de combustibles libre de contaminantes ambientales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1948', 'G', '4661005', 'Venta de gas keroseno');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1949', 'G', '4661006', 'Venta al  por mayor  de leña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1950', 'G', '4661007', 'Venta  al por mayor de carbón de leña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1951', 'G', '4662', 'VENTA AL POR MAYOR DE METALES Y MINERALES METALÍFEROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1952', 'G', '46620', 'Venta al por mayor de metales y minerales metalíferos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1953', 'G', '4662001', 'Venta al por mayor de oro, plata y platino en forma mineral (tal como se obtiene de la mina) y en forma primaria (lingote, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1954', 'G', '4662002', 'Venta al por mayor de hierro en forma mineral (tal como se extrae de la mina y venta de hierro y acero en forma primaria (lingote, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1955', 'G', '4662003', 'Venta al por mayor de aluminio en forma mineral  y en forma primaria (lingote, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1956', 'G', '4662004', 'Venta al por mayor de:  níquel, cobre, estaño, plomo, cinc, cromo y otros en forma primaria o mineral');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1957', 'G', '4663', 'VENTA AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA Y EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1958', 'G', '46631', 'Venta al por mayor de puertas, ventanas, vitrinas y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1959', 'G', '4663101', 'Venta al por mayor de puertas, ventanas, vitrinas y otros artículos de vidrio con marcos metálicos de aluminio, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1960', 'G', '4663102', 'Venta al por mayor de puertas y ventanas de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1961', 'G', '4663103', 'Venta al por mayor de puertas, ventanas, persianas y otras estructuras y productos similares de cualquier material.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1962', 'G', '46632', 'Venta al por mayor de artículos de ferretería y pinturerías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1963', 'G', '4663201', 'Venta al por mayor de pinturas, barnices, pegamentos etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1964', 'G', '4663202', 'Venta al por mayor de artículos de ferretería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1965', 'G', '4663203', 'Venta al por mayor de herramientas de mano para la agricultura, jardinería y para otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1966', 'G', '4663204', 'Venta al por mayor de cintas adhesivas, lijas industriales y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1967', 'G', '46633', 'Vidrierías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1968', 'G', '4663301', 'Venta al por mayor de vidrios de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1969', 'G', '46634', 'Venta al por mayor de maderas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1970', 'G', '4663401', 'Venta al por mayor de maderas aserradas, terciada y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1971', 'G', '4663402', 'Venta al por mayor de bambú, vara de castilla y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1972', 'G', '46639', 'Venta al por mayor de materiales para la construcción n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1973', 'G', '4663901', 'Venta al por mayor de piedra, grava, balastro, chispa, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1974', 'G', '4663902', 'Venta al por mayor de arena, escoria volcánica y otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1975', 'G', '4663903', 'Venta al por mayor de cemento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1976', 'G', '4663904', 'Venta al por mayor de cal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1977', 'G', '4663905', 'Venta al por mayor de ladrillo de cemento para pisos, recubierto o no con colorantes, mármol, porcelana (cerámica); y otros materiales de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1978', 'G', '4663906', 'Venta al por mayor de tubos, postes, bloques, tejas, pilas de cemento o concreto y productos de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1979', 'G', '4663907', 'Venta al por mayor de materiales de arcilla o barro para construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1980', 'G', '4663908', 'Venta al por mayor de azulejos y mármol en láminas, columnas, losetas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1981', 'G', '4663909', 'Venta al por mayor de sanitarios de losa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1982', 'G', '4663910', 'Venta al por mayor de productos prefabricados para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1983', 'G', '4663911', 'Venta al por mayor de artículos y productos metálicos para la construcción y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1984', 'G', '4663912', 'Venta al por mayor de  productos de asbesto-cemento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1985', 'G', '4663913', 'Venta al por mayor de productos plásticos para la construcción y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1986', 'G', '4663914', 'Venta al por mayor de productos de aluminio, hierro y acero para  la industria de la construcción, comercio y otros: lámina, saranda, ángulos, perfiles, canales, tubería, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1987', 'G', '4663915', 'Venta al por mayor de alambre y otros productos de alambre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1988', 'G', '4663916', 'Venta al por mayor de productos artificiales: fibrex,  durapanel, fórmica, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1989', 'G', '4663917', 'Venta al por mayor de cables conductores para instalaciones eléctricas, telefónicas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1990', 'G', '4663918', 'Venta al por mayor de medidores de agua');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1991', 'G', '4663919', 'Venta al por mayor de medidores eléctricos (contadores)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1992', 'G', '4669', 'VENTA AL POR MAYOR DE  DESPERDICIOS, DESECHOS, CHATARRA Y OTROS PRODUCTOS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1993', 'G', '46691', 'Venta al por mayor de sal industrial sin yodar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1994', 'G', '4669101', 'Venta al por mayor de sal industrial (cloruro de sodio) sin yodar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1995', 'G', '46692', 'Venta al por mayor de productos intermedios y desechos de origen textil');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1996', 'G', '4669201', 'Venta al por mayor de borra de algodón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1997', 'G', '4669202', 'Venta al por mayor de hilazas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1998', 'G', '4669203', 'Venta al por mayor de fibra de henequén');
INSERT INTO `sac_clasificacion_institucion` VALUES ('1999', 'G', '4669204', 'Venta al por mayor de fibra de kenaf');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2000', 'G', '4669205', 'Venta al por mayor de otras fibras naturales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2001', 'G', '4669206', 'Venta al por mayor de fibras artificiales (excepto hilos, cables, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2002', 'G', '4669207', 'Venta de algodón en oro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2003', 'G', '4669208', 'Venta de algodón en rama ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2004', 'G', '46693', 'Venta al por mayor de productos intermedios y desechos de origen metálico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2005', 'G', '4669301', 'Venta al por mayor de chatarra metálica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2006', 'G', '46694', 'Venta al por mayor de productos intermedios y desechos de papel y cartón');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2007', 'G', '4669401', 'Venta al por mayor de papel y cartón usado para reciclaje');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2008', 'G', '46695', 'Venta al por mayor fertilizantes, abonos, agroquímicos y productos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2009', 'G', '4669501', 'Venta al por mayor de fertilizantes y abonos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2010', 'G', '4669502', 'Venta al por mayor de insecticidas, fungicidas, herbicidas y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2011', 'G', '4669503', 'Venta al por mayor de insecticidas, fungicidas, herbicidas, fertilizantes, abonos de origen mineral y orgánico (agro servicios, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2012', 'G', '46696', 'Venta al por mayor de productos intermedios y desechos de origen plástico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2013', 'G', '4669601', 'Venta al por mayor de envases, bolsas y otros desechos plásticos para reciclaje');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2014', 'G', '4669602', 'Venta al por mayor de materiales plásticos en forma primaria (materia prima)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2015', 'G', '46697', 'Venta al por mayor de tintas para imprenta, productos curtientes y materias y productos colorantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2016', 'G', '4669701', 'Venta al por mayor de materias y productos colorantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2017', 'G', '4669702', 'Venta al por mayor de tinta para imprenta y tipografía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2018', 'G', '4669703', 'Venta al por mayor de sustancias o productos curtientes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2019', 'G', '46698', 'Venta de productos intermedios y desechos de origen químico y de caucho');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2020', 'G', '4669801', 'Venta al por mayor de oxigeno y gases industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2021', 'G', '4669802', 'Venta al por mayor de materias primas, químicas, básicas para la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2022', 'G', '4669803', 'Venta al por mayor de reactivos para laboratorio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2023', 'G', '4669804', 'Venta al por mayor de aceites esenciales de origen vegetal (cítricos, geranio, etc.) utilizados como perfumes y otros usos.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2024', 'G', '4669805', 'Venta al por mayor de pólvora (materia prima).');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2025', 'G', '4669806', 'Venta al por mayor de carbón activado para la industria (de origen vegetal)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2026', 'G', '4669807', 'Venta al por mayor de  productos químicos de acción modificadora utilizados en el proceso de fabricación industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2027', 'G', '4669808', 'Venta al por mayor de  productos o aditivos  para el  control o disminución de la contaminación ambiental, generada en los  procesos  productivos  y  por otras actividades');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2028', 'G', '4669809', 'Venta al por mayor de productos utilizados en el tratamiento, saneamiento y control de la contaminación ambiental');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2029', 'G', '4669810', 'Venta al por mayor de grasas y aceites para la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2030', 'G', '4669811', 'Venta al por mayor de productos químicos, materias primas y otros productos para la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2031', 'G', '4669812', 'Venta al por mayor de baterías secas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2032', 'G', '46699', 'Venta al por mayor de productos intermedios y desechos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2033', 'G', '4669901', 'Venta al por mayor  de cueros y pieles crudas (sin procesar)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2034', 'G', '4669902', 'Venta al por mayor de envases usados (plásticos, vidrio, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2035', 'G', '4669903', 'Venta al por mayor de productos intermedios y desechos ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2036', 'G', '469', 'VENTA AL POR MAYOR NO ESPECIALIZADA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2037', 'G', '4690', 'VENTA AL POR MAYOR NO ESPECIALIZADA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2038', 'G', '46900', 'Venta al por mayor de otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2039', 'G', '4690001', 'Venta al por mayor de armas de fuego, municiones y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2040', 'G', '4690002', 'Venta al por mayor de cohetes y otros productos pirotécnicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2041', 'G', '4690003', 'Venta al por mayor de toldos y tiendas de campaña de cualquier material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2042', 'G', '4690004', 'Venta al por mayor de exhibidores publicitarios y rótulos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2043', 'G', '4690005', 'Venta al por mayor de artículos diversos para consumo humano ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2044', 'G', '4690006', 'Venta al por mayor de artículos promociónales  diversos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2045', 'G', '4690007', 'Venta de etiquetas  de cualquier material ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2046', 'G', '4690008', 'Venta al por mayor de explosivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2047', 'G', '454', 'VENTA, MANTENIMIENTO Y REPARACIÓN DE MOTOCICLETAS Y SUS PARTES, PIEZAS Y ACCESORIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2048', 'G', '471', 'VENTA AL POR MENOR EN COMERCIOS NO ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2049', 'G', '4711', 'VENTA AL POR MENOR EN COMERCIOS NO ESPECIALIZADOS CON PREDOMINO DE LA VENTA DE ALIMENTOS, BEBIDAS O TABACO.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2050', 'G', '47111', 'Venta en supermercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2051', 'G', '4711101', 'Supermercados y almacenes surtidos con productos alimenticios y no alimenticios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2052', 'G', '4711102', 'Cooperativas de consumo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2053', 'G', '47112', 'Venta en tiendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2054', 'G', '4711201', 'Venta de artículos de primera necesidad (Tienda)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2055', 'G', '4711202', 'Chalet (venta al por menor en almacenes no especializados con surtido compuesto principalmente de alimentos, bebidas y tabaco)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2056', 'G', '4719', 'OTRAS ACTIVIDADES DE VENTA AL POR MENOR EN COMERCIOS NO ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2057', 'G', '47190', 'Venta al por menor de otros productos en almacenes no especializados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2058', 'G', '4719001', 'Almacenes (venta de diversos artículos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2059', 'G', '4719002', 'Bazares (venta de diversos artículos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2060', 'G', '4719003', 'Almacén para niños (venta de ropa, juguetes y otros artículos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2061', 'G', '472', 'VENTA AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2062', 'G', '4721', 'VENTA AL POR MENOR DE ALIMENTOS EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2063', 'G', '47211', 'Venta al por menor de frutas y hortalizas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2064', 'G', '4721101', 'Frutería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2065', 'G', '4721102', 'Verdulería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2066', 'G', '47212', 'Venta al por menor de carnes, embutidos y productos de granja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2067', 'G', '4721201', 'Venta al por menor de aves de corral destazadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2068', 'G', '4721202', 'Venta al por menor de huevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2069', 'G', '4721203', 'Venta  al por menor de toda clase de carnes y de productos cárnicos (excepto  embutidos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2070', 'G', '4721204', 'Venta al por menor de jamón y embutidos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2071', 'G', '47213', 'Venta al por menor de pescado y mariscos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2072', 'G', '4721301', 'Venta al por menor de pescado, camarones y otros mariscos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2073', 'G', '47214', 'Venta al por menor de productos lácteos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2074', 'G', '4721401', 'Venta al por menor de leche fresca');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2075', 'G', '4721402', 'Venta al por menor de productos lácteos y otros derivados de la leche');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2076', 'G', '47215', 'Venta al por menor de productos de panadería, repostería y galletas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2077', 'G', '4721501', 'Venta  al por menor de pan de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2078', 'G', '4721502', 'Venta al por menor de cakes y repostería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2079', 'G', '47219', 'Venta al por menor de alimentos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2080', 'G', '4721901', 'Venta al por menor  de granos básicos y otros.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2081', 'G', '4721902', 'Venta al por menor de harinas, levaduras, polvo para hornear');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2082', 'G', '4721903', 'Venta al por menor de dulces, chocolates, etc. (confiterías)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2083', 'G', '4721904', 'Venta al por menor de miel de abeja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2084', 'G', '4721905', 'Venta al por menor de alimentos dietéticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2085', 'G', '4721906', 'Venta al por menor de condimentos y especies');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2086', 'G', '4721907', 'Venta al por menor de café tostado, molido y soluble');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2087', 'G', '4721908', 'Venta al por menor de encurtidos y vinagre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2088', 'G', '4721909', 'Venta al por menor de extractos, esencias y concentrados de frutas y hortalizas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2089', 'G', '4721910', 'Venta al por menor de jaleas, mermeladas, frutas deshidratadas y otras similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2090', 'G', '4721911', 'Venta al por menor de sal ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2091', 'G', '4721912', 'Venta al por menor de azúcar (de caña) ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2092', 'G', '4721913', 'Venta al por menor de chocolate en tablilla');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2093', 'G', '4722', 'VENTA DE AL POR MENOR DE BEBIDAS EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2094', 'G', '47221', 'Venta al por menor de hielo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2095', 'G', '4722101', 'Venta al por menor de hielo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2096', 'G', '47222', 'Venta al por menor de bebidas (no para el consumo en el lugar de venta)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2097', 'G', '4722201', 'Venta al por menor de bebidas alcohólicas (expendios)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2098', 'G', '4722202', 'Venta al por menor de aguas gaseosas y cerveza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2099', 'G', '4722203', 'Venta al por menor de agua purificada y jugos envasados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2100', 'G', '4722204', 'Abarrotería al por menor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2101', 'G', '4722205', 'Venta al por menor de cerveza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2102', 'G', '4722206', 'Venta al por menor de aguas gaseosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2103', 'G', '4723', 'VENTA AL POR MENOR DE PRODUCTOS DE TABACO EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2104', 'G', '47230', 'Venta al por menor de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2105', 'G', '4723001', 'Venta al por menor de puros y cigarros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2106', 'G', '473', 'VENTA AL POR MENOR DE COMBUSTIBLES PARA VEHÍCULOS AUTOMOTORES EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2107', 'G', '4730', 'VENTA AL POR MENOR DE COMBUSTIBLES PARA VEHÍCULOS AUTOMOTORES EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2108', 'G', '47300', 'Venta de combustibles, lubricantes y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2109', 'G', '4730001', 'Venta al por menor de combustibles, lubricantes y otros. (gasolineras)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2110', 'G', '4730002', 'Venta al por menor  de aceites grasas y lubricantes para automotores y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2111', 'G', '4730003', 'Venta al por menor de aceites, grasas y lubricantes para maquinaria industrial, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2112', 'G', '4730004', 'Venta al por menor de combustible libre de contaminantes ambientales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2113', 'G', '474', 'VENTA AL POR MENOR DE  EQUIPO DE INFORMACIÓN Y DE COMUNICACIONES EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2114', 'G', '4741', 'VENTA AL POR MENOR DE COMPUTADORAS, EQUIPO PERIFÉRICO, PROGRAMAS INFORMÁTICOS Y EQUIPO DE TELECOMUNICACIONES EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2115', 'G', '47411', 'Venta al por menor de computadoras y equipo periférico ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2116', 'G', '4741101', 'Venta  al por menor de computadoras y equipo periférico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2117', 'G', '47412', 'Venta de equipo y accesorios de telecomunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2118', 'G', '4741201', 'Venta al por menor de equipo, accesorios de comunicación  (como antenas y otros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2119', 'G', '4741202', 'Venta al por menor  de equipo de comunicación (radio comunicador,  teléfonos  y beepers)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2120', 'G', '4741203', 'Venta al por menor de tarjeta prepago y accesorios de telefonía móvil');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2121', 'G', '4741204', 'Venta al por menor de juegos de video');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2122', 'G', '4742', 'VENTA AL POR MENOR DE EQUIPO DE AUDIO Y VIDEO EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2123', 'G', '47420', 'Venta al por menor de equipo de audio y video');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2124', 'G', '4742001', 'Venta al por menor de equipo de audio y video (radio, televisor , equipo stereo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2125', 'G', '4742002', 'Venta  al por menor equipo reproductores y grabadores de CD y DVD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2126', 'G', '475', 'VENTA AL POR MENOR DE OTROS ENSERES DOMESTICOS EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2127', 'G', '4751', 'VENTA AL POR MENOR DE PRODUCTOS TEXTILES EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2128', 'G', '47510', 'Venta al por menor de hilados, tejidos y productos textiles de mercería ; confecciones para el hogar y textiles n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2129', 'G', '4751001', 'Venta al por menor de telas de toda clase, hilos e hilazas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2130', 'G', '4751002', 'Venta al por menor de colchas, perrajes etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2131', 'G', '4751003', 'Venta al por menor de artículos y materiales para la confección de prendas de vestir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2132', 'G', '4751004', 'Venta al por menor de artículos de fibras de henequén y de otras fibras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2133', 'G', '4752', 'VENTA AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2134', 'G', '47521', 'Venta al por menor de productos de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2135', 'G', '4752101', 'Venta al por menor de madera aserrada y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2136', 'G', '4752102', 'Venta al por menor de artículos de madera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2137', 'G', '47522', 'Venta al por menor de artículos de ferretería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2138', 'G', '4752201', 'Ferretería al por menor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2139', 'G', '4752202', 'Venta al por menor de extintores de incendios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2140', 'G', '4752203', 'Venta al por menor de purificadores, filtros y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2141', 'G', '47523', 'Venta al por menor de productos de pinturerías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2142', 'G', '4752301', 'Venta al por menor de pinturas , lacas, barnices, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2143', 'G', '47524', 'Venta al por menor en vidrierías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2144', 'G', '4752401', 'Venta al por menor de vidrios, espejos, marcos, molduras, (Vidriería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2145', 'G', '47529', 'Venta al por menor de materiales de construcción y artículos conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2146', 'G', '4752901', 'Venta al por menor de estructuras de aluminio y vidrio para ventanas, solaire, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2147', 'G', '4752902', 'Venta al por menor de artículos de lamina y hojalata');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2148', 'G', '4752903', 'Venta al por menor de materiales de construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2149', 'G', '4752904', 'Venta al por menor de artículos prefabricados para la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2150', 'G', '4752905', 'Venta al por menor de equipo y accesorios para cisternas y piscinas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2151', 'G', '4753', 'VENTA AL POR MENOR DE TAPICES, ALFOMBRAS Y REVESTIMIENTOS DE PAREDES Y PISOS EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2152', 'G', '47530', 'Venta al por menor de tapices, alfombras y revestimientos de paredes y pisos en comercios  especializados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2153', 'G', '4753001', 'Venta al por menor de cortinas venecianas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2154', 'G', '4753002', 'Venta al por menor de alfombras y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2155', 'G', '4759', 'VENTA AL POR MENOR DE ELECTRODOMÉSTICOS, MUEBLES, EQUIPO DE ILUMINACIÓN Y OTROS ENSERES DOMÉSTICOS EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2156', 'G', '47591', 'Venta al por menor de muebles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2157', 'G', '4759101', 'Venta al por menor de muebles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2158', 'G', '4759102', 'Venta al por menor de colchones, cojines almohadas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2159', 'G', '47592', 'Venta al por menor de artículos de bazar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2160', 'G', '4759201', 'Venta al por menor de artículos plásticos para el hogar y otros usos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2161', 'G', '4759202', 'Venta al por menor de vajillas y otros artículos para la cocina y el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2162', 'G', '4759203', 'Venta al por menor de artículos de barro para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2163', 'G', '4759204', 'Venta al por menor de artículos de losa para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2164', 'G', '4759205', 'Venta al por menor de artículos de vidrio y cristalería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2165', 'G', '47593', 'Venta al por menor de electrodomésticos, instrumentos musicales y similares de uso personal o doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2166', 'G', '4759301', 'Venta al por menor de aparatos electrodomésticos, repuestos y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2167', 'G', '4759302', 'Venta al por menor de instrumentos musicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2168', 'G', '47594', 'Venta al por menor de artículos eléctricos y de iluminación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2169', 'G', '4759401', 'Venta al por menor de artículos de iluminación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2170', 'G', '4759402', 'Venta al por menor de materiales, artículos y accesorios eléctricos para el hogar y la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2171', 'G', '476', 'VENTA AL POR MENOR DE PRODUCTOS CULTURALES Y RECREATIVOS EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2172', 'G', '4761', 'VENTA AL POR MENOR DE LIBROS, PERIÓDICOS Y ARTÍCULOS DE PAPELERÍA EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2173', 'G', '47610', 'Venta al por menor de libros, periódicos y artículos de papelería en comercios especializados ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2174', 'G', '4761001', 'Librería y papelería al por menor ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2175', 'G', '4761002', 'Venta y distribución al por menor de enciclopedias, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2176', 'G', '4761003', 'Venta al por menor de revistas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2177', 'G', '4761004', 'Venta al por menor de periódicos (agencias)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2178', 'G', '4761005', 'Venta al por menor de artículos y materiales de diseño, dibujo y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2179', 'G', '4762', 'VENTA AL POR MENOR DE GRABACIONES MUSICALES Y DE VÍDEO EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2180', 'G', '47620', 'Venta al por menor de discos láser, cassettes, cintas de video y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2181', 'G', '4762001', 'Venta al por menor de discos láser, cassettes, cintas de video y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2182', 'G', '4763', 'VENTA AL POR MENOR DE EQUIPO DE DEPORTE EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2183', 'G', '47630', 'Venta al por menor de productos y equipos de deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2184', 'G', '4763001', 'Venta al por menor de bicicletas, accesorios y repuestos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2185', 'G', '4763002', 'Venta al por menor de artículos deportivos (patinetas, patines, equipo deportivo, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2186', 'G', '4764', 'VENTA AL POR MENOR DE JUEGOS Y JUGUETES EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2187', 'G', '47640', 'Venta al por menor de juegos y juguetes  en comercios especializados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2188', 'G', '4764001', 'Venta al por menor de juguetes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2189', 'G', '4764002', 'Venta al por menor de piñatas y otros artículos para fiesta ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2190', 'G', '477', 'VENTA AL POR MENOR DE OTROS PRODUCTOS EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2191', 'G', '4771', 'VENTA AL POR MENOR DE PRENDAS DE VESTIR, CALZADO Y ARTICULO DE CUERO EN COMERCIOS ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2192', 'G', '47711', 'Venta al por menor de prendas de vestir y accesorios de vestir');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2193', 'G', '4771101', 'Boutique al por menor ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2194', 'G', '4771102', 'Venta al por menor de ropa de punto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2195', 'G', '4771103', 'Venta al por menor de ropa para niños');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2196', 'G', '4771104', 'Venta al por menor de ropa interior para ambos sexos y otras prendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2197', 'G', '4771105', 'Venta al por menor de camisas para caballeros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2198', 'G', '4771106', 'Venta al por menor de ropa para caballeros (pantalones, trajes, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2199', 'G', '4771107', 'Venta al por menor ropa de vestir femenina');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2200', 'G', '4771108', 'Venta al por menor de ropa para deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2201', 'G', '4771109', 'Venta al por menor de uniformes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2202', 'G', '4771110', 'Venta al por menor de ropa de toda clase y otros artículos de tela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2203', 'G', '4771111', 'Venta al por menor de sombreros de todo material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2204', 'G', '4771112', 'Venta al por menor de viseras, gorras de cualquier material y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2205', 'G', '47712', 'Venta al por menor de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2206', 'G', '4771201', 'Venta al por menor de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2207', 'G', '47713', 'Venta al por menor de artículos de marroquinería y talabartería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2208', 'G', '4771301', 'Venta al por menor de carteras, maletas, maletines, bolsos y otros artículos similares de cuero y de otros materiales ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2209', 'G', '4771302', 'Venta al por menor de vainas para machete, monturas y otros artículos similares de cuero y de otros materiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2210', 'G', '4772', 'VENTA AL POR MENOR DE PRODUCTOS FARMACÉUTICOS Y  MEDICINALES, COSMÉTICOS Y ARTÍCULOS DE TOCADOR EN COMERCIOS ESPECIALIZADOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2211', 'G', '47721', 'Venta al por menor de medicamentos farmacéuticos y otros materiales y artículos de uso médico, odontológico y veterinario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2212', 'G', '4772101', 'Venta al por menor de medicamentos farmacéuticos y otros materiales y artículos de uso médico, odontológico (farmacia)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2213', 'G', '4772102', 'Venta al por menor de medicinas ( productos naturales) y otras no certificadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2214', 'G', '4772103', 'Venta al por menor de medicamentos y otros productos veterinarios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2215', 'G', '47722', 'Venta al por menor de productos cosméticos y de tocador');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2216', 'G', '4772201', 'Venta al por menor de perfumes, cosméticos y artículos de tocador');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2217', 'G', '4772202', 'Venta al por menor de productos pédicos (pies)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2218', 'G', '4773', 'VENTA AL POR MENOR  DE OTROS PRODUCTOS NUEVOS EN COMERCIOS  ESPECIALIZADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2219', 'G', '47731', 'Venta al por menor de productos de joyería, bisutería, óptica, relojería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2220', 'G', '4773101', 'Joyería al por menor ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2221', 'G', '4773102', 'Venta al por menor de joyas de fantasía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2222', 'G', '4773103', 'Relojería al por menor ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2223', 'G', '4773104', 'Ventas al por menor de aros, anteojos y otros artículos ópticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2224', 'G', '4773105', 'Venta al por menor de cámaras fotográficas, cinematográficas materiales y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2225', 'G', '47732', 'Venta al por menor de plantas, semillas, animales y artículos conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2226', 'G', '4773201', 'Venta al por menor de plantas y semillas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2227', 'G', '4773202', 'Venta al por menor de flores y arreglos florales (floristería, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2228', 'G', '4773203', 'Venta al por menor de animales domésticos, excepto mascotas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2229', 'G', '4773204', 'Venta al por menor de mascotas y accesorios (pájaros, perros, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2230', 'G', '4773205', 'Venta al por menor de alimentos para animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2231', 'G', '4773206', 'Venta al por menor de aves de corral vivas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2232', 'G', '4773207', 'Venta al por menor de productos de agroservicios ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2233', 'G', '47733', 'Venta al por menor de combustibles de uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2234', 'G', '4773301', 'Venta al por menor de gas licuado (kerosén), combustible para uso de la cocina');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2235', 'G', '4773302', 'Venta al por menor de gas propano (combustible para la cocina)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2236', 'G', '4773303', 'Venta al por menor de leña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2237', 'G', '47734', 'Venta al por menor de artesanías, artículos cerámicos y recuerdos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2238', 'G', '4773401', 'Venta al por menor de artesanías de cualquier material');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2239', 'G', '4773402', 'Venta al por menor de artículos de cerámica o porcelana (arcilla fina)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2240', 'G', '4773403', 'Venta al por menor de recuerdos de cualquier material para diferentes ocasiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2241', 'G', '47735', 'Venta al por menor de ataúdes, lápidas y cruces, trofeos, artículos religiosos en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2242', 'G', '4773501', 'Venta al por menor de ataúdes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2243', 'G', '4773502', 'Venta al por menor de lápidas y cruces');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2244', 'G', '4773503', 'Venta al por menor de artículos religiosos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2245', 'G', '4773504', 'Venta al por menor de velas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2246', 'G', '4773505', 'Venta al por menor de placas, trofeos y otros artículos bañados de bronce, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2247', 'G', '47739', 'Venta al por menor de otros productos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2248', 'G', '4773901', 'Venta al por menor de jabón para lavar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2249', 'G', '4773902', 'Venta al por menor de cuadros en general y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2250', 'G', '4773903', 'Venta al por menor de productos de fibra de vidrio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2251', 'G', '4773904', 'Venta al por menor de toldos y tiendas de campaña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2252', 'G', '4773905', 'Venta al por menor de armas de fuego, municiones y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2253', 'G', '4773906', 'Venta al por menor de artículos de cohetería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2254', 'G', '4773907', 'Venta de escobas, cepillos y filamentos.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2255', 'G', '4773908', 'Venta al por menor de artículos desechables de uso personal y doméstico (servilletas, papel higiénico, pañales, toallas sanitarias, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2256', 'G', '4773909', 'Venta de artículos y equipo de seguridad.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2257', 'G', '4774', 'VENTA AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2258', 'G', '47741', 'Venta al por menor de artículos usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2259', 'G', '4774101', 'Venta al por menor de muebles, electrodomésticos y otros artículos usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2260', 'G', '47742', 'Venta al por menor de textiles y confecciones usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2261', 'G', '4774201', 'Venta al por menor de ropa usada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2262', 'G', '47743', 'Venta al por menor de libros, revistas, papel y cartón usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2263', 'G', '4774301', 'Venta al por menor de revistas y libros usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2264', 'G', '4774302', 'Venta al por menor de papel y cartón usados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2265', 'G', '47749', 'Venta al por menor de productos usados n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2266', 'G', '4774901', 'Venta al por menor de antigüedades y artículos de colección');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2267', 'G', '4774902', 'Venta al por menor de artículos provenientes de casas de empeño');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2268', 'G', '478', 'VENTA AL POR MENOR EN PUESTOS DE VENTA Y MERCADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2269', 'G', '4781', 'VENTA AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN PUESTOS DE VENTA Y MERCADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2270', 'G', '47811', 'Venta al por menor de frutas, verduras y hortalizas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2271', 'G', '4781101', 'Venta al por menor de frutas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2272', 'G', '4781102', 'Venta al por menor de verduras y hortalizas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2273', 'G', '4781103', 'Venta al por menor de frutas, verduras, hortalizas y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2274', 'G', '47812', 'Venta al por menor de carnes, embutidos y productos de granja');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2275', 'G', '4781201', 'Venta al por menor de carne de res, cerdo, manteca de cerdo, chicharrones, chorizos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2276', 'G', '4781202', 'Venta al por menor de gallinas y otras aves destazadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2277', 'G', '4781203', 'Venta al por menor de huevos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2278', 'G', '47813', 'Venta al por menor de pescado y mariscos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2279', 'G', '4781301', 'Venta al por menor de pescado, camarones y otros mariscos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2280', 'G', '47814', 'Venta al por menor de productos lácteos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2281', 'G', '4781401', 'Venta al por menor de productos lácteos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2282', 'G', '47815', 'Venta al por menor de productos de panadería, galletas y similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2283', 'G', '4781501', 'Venta al por menor de pan');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2284', 'G', '4781502', 'Venta al por menor de barquillos y desperdicios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2285', 'G', '47816', 'Venta al por menor de bebidas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2286', 'G', '4781601', 'Venta de bebidas: refrescos, aguas gaseosas, jugos de frutas, agua, etc. En locales de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2287', 'G', '47817', 'Venta al por menor de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2288', 'G', '4781701', 'Venta al por menor de tabaco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2289', 'G', '47818', 'Venta al por menor en tiendas de mercado y puestos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2290', 'G', '4781801', 'Tienda (en puesto de mercado) al por menor ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2291', 'G', '4781802', 'Venta de granos básicos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2292', 'G', '47819', 'Venta al por menor de alimentos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2293', 'G', '4781901', 'Venta al por menor de especies,  condimentos y semillas (puesto de mercado)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2294', 'G', '4781902', 'Venta al por menor de café y chocolate en tablillas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2295', 'G', '4781903', 'Venta al por menor de encurtidos y vinagre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2296', 'G', '4781904', 'Venta al por menor de alimentos para animales (mascotas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2297', 'G', '4782', 'VENTA AL POR MENOR DE PRODUCTOS TEXTILES , PRENDAS DE VESTIR Y CALZADO EN PUESTOS DE VENTA Y  MERCADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2298', 'G', '47821', 'Venta al por menor de hilados, tejidos y productos textiles de mercería en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2299', 'G', '4782101', 'Venta al por menor de telas y otros artículos de tela para cualquier uso');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2300', 'G', '4782102', 'Venta al por menor de botones, encajes, hilos y otros artículos (mercería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2301', 'G', '47822', 'Venta al por menor de artículos textiles excepto confecciones para el hogar en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2302', 'G', '4782201', 'Venta al por menor de hamacas y otros productos de fibras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2303', 'G', '47823', 'Venta al por menor de confecciones textiles para el hogar en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2304', 'G', '4782301', 'Venta al por menor de colchas, toallas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2305', 'G', '47824', 'Venta al por menor de prendas de vestir, accesorios de vestir y similares en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2306', 'G', '4782401', 'Venta al por menor de ropa de vestir para mujer');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2307', 'G', '4782402', 'Venta al por menor de ropa de vestir para caballero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2308', 'G', '4782403', 'Venta al por menor de ropa de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2309', 'G', '4782404', 'Venta al por menor de vestidos, trajes y accesorios para novias, fiesta rosa, primera comunión, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2310', 'G', '4782405', 'Venta al por menor de toda clase de ropa interior');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2311', 'G', '4782406', 'Venta al por menor de ropa, juguetes y otros artículos para niños y bebés');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2312', 'G', '4782407', 'Venta al por menor de gorras, vísceras y sombreros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2313', 'G', '4782408', 'Venta al por menor de accesorios para el cabello');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2314', 'G', '47825', 'Venta al por menor de ropa usada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2315', 'G', '4782501', 'Venta al por menor de ropa usada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2316', 'G', '47826', 'Venta al por menor de calzado, artículos de marroquinería y talabartería en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2317', 'G', '4782601', 'Venta al por menor de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2318', 'G', '47827', 'Venta al por menor de artículos de marroquinería y talabartería en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2319', 'G', '4782701', 'Venta al por menor de maletines, carteras, bolsones, cinchos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2320', 'G', '47829', 'Venta al por menor de artículos textiles ncp en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2321', 'G', '4789', 'VENTA AL POR MENOR DE OTROS PRODUCTOS EN PUESTOS DE VENTA Y MERCADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2322', 'G', '47891', 'Venta al por menor de animales, flores y productos conexos en puestos de feria y mercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2323', 'G', '4789101', 'Venta al por menor de flores y arreglos florales naturales y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2324', 'G', '4789102', 'Venta al por menor de plantas, flores y arreglos florales artificiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2325', 'G', '4789103', 'Venta al por menor de animales vivos: pájaros, garrobos, codornices, conejos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2326', 'G', '4789104', 'Venta al por menor de alimentos para animales (mascotas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2327', 'G', '47892', 'Venta al por menor de productos medicinales, cosméticos, de tocador y de limpieza en puestos de ferias y mercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2328', 'G', '4789201', 'Venta al por menor de medicina');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2329', 'G', '4789202', 'Venta al por menor de medicina natural obtenida de animales, plantas, y flores para uso doméstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2330', 'G', '4789203', 'Venta al por menor de cosméticos y perfumes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2331', 'G', '47893', 'Venta al por menor de artículos de bazar en puestos de ferias y mercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2332', 'G', '4789301', 'Venta al por menor de artículos plásticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2333', 'G', '4789302', 'Venta al por menor de artículos de lámina: sartenes, latas para pan, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2334', 'G', '4789303', 'Venta al por menor de artículos de palma, vara de castilla y bambú, fibra de henequén, nylon, tule y otros materiales vegetales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2335', 'G', '4789304', 'Venta al por menor de artesanías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2336', 'G', '4789305', 'Venta al por menor de artículos de barro barnizado (loza) o sin barnizar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2337', 'G', '4789306', 'Venta al por menor de recuerdos de cualquier material para primera comunión, bodas, fiesta rosa, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2338', 'G', '4789307', 'Bazar al por menor ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2339', 'G', '47894', 'Venta al por menor de artículos de papel, envases, libros, revistas y conexos en puestos de feria y mercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2340', 'G', '4789401', 'Venta al por menor de artículos desechables de uso personal y doméstico (servilletas, papel higiénico, pañales, toallas sanitarias, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2341', 'G', '4789402', 'Venta al por menor de envases de toda clase usados (botellas de vidrio, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2342', 'G', '4789403', 'Venta al por menor de papel, listón para regalos y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2343', 'G', '4789404', 'Venta al por menor de libros, nuevos y usados, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2344', 'G', '4789405', 'Venta al por menor de piñatas, dulces y accesorios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2345', 'G', '4789406', 'Venta al por menor de tarjetas, revistas, póster, cuadros, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2346', 'G', '47895', 'Venta al por menor de materiales de construcción, electrodomésticos, accesorios para autos y similares en puestos de feria y mercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2347', 'G', '4789501', 'Venta al por menor de electrodomésticos, repuestos, accesorios y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2348', 'G', '4789502', 'Venta al por menor de artículos de ferretería y construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2349', 'G', '4789503', 'Venta al por menor de accesorios para vehículos y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2350', 'G', '47896', 'Venta al por menor de equipos accesorios para las comunicaciones en puestos de feria y mercados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2351', 'G', '4789601', 'Venta al por menor de artículos usados como accesorios, para teléfono fijo celulares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2352', 'G', '47899', 'Venta al por menor en puestos de ferias y mercados n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2353', 'G', '4789901', 'Venta al por menor de carbón de origen vegetal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2354', 'G', '4789902', 'Venta al por menor de leña');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2355', 'G', '4789903', 'Venta al por menor de  productos esotéricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2356', 'G', '4789904', 'Venta al por menor de joyas de fantasía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2357', 'G', '4789905', 'Venta al por menor de diversos artículos y productos, sombrillas y paraguas, relojes, anteojos, cuadros, cassettes grabados, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2358', 'G', '4789909', 'Venta al por menor en puestos de ferias y mercados de otros artículos ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2359', 'G', '479', 'VENTA AL POR MENOR NO REALIZADA EN COMERCIOS, PUESTOS DE VENTA O MERCADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2360', 'G', '4791', 'VENTA  AL POR MENOR POR CORREO O INTERNET');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2361', 'G', '47910', 'Venta al por menor por correo o Internet');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2362', 'G', '4791001', 'Venta al por menor mediante pedidos por catalogo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2363', 'G', '4791002', 'Venta al por menor de productos a través de Internet');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2364', 'G', '4791003', 'venta al por menor de producto a través de la televisión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2365', 'G', '4799', 'OTRAS ACTIVIDADES DE VENTA AL POR MENOR NO REALIZADAS EN COMERCIOS, PUESTOS DE VENTA O MERCADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2366', 'G', '47990', 'Otros tipos de venta al por menor no realizada, en almacenes, puestos de venta o mercado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2367', 'G', '4799001', 'Venta al por menor realizada por vendedores a domicilio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2368', 'G', '4799002', 'Venta al por menor de agua potable realizada a domicilio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2369', 'G', '4799003', 'Venta al por menor realizada por máquinas expendedoras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2370', 'H', 'H', 'TRANSPORTE Y ALMACENAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2371', 'H', '49', 'TRANSPORTE POR VÍA TERRESTRE Y  TRANSPORTE POR TUBERÍAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2372', 'H', '491', 'TRANSPORTE POR FERRROCARRIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2373', 'H', '4911', 'TRANSPORTE INTERURBANO DE PASAJEROS POR FERROCARRIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2374', 'H', '49110', 'Transporte interurbano de pasajeros  por ferrocarril');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2375', 'H', '4911001', 'Transporte de pasajeros por vía férrea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2376', 'H', '4912', 'TRANSPORTE DE CARGA POR FERROCARRIL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2377', 'H', '49120', 'Transporte de carga por ferrocarril');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2378', 'H', '4912001', 'Transporte de carga por vía férrea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2379', 'H', '492', 'OTRAS ACTIVIDADES DE TRANSPORTE POR VÍA TERRESTRE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2380', 'H', '4921', 'TRANSPORTE   URBANO Y SUBURBANO  DE PASAJEROS POR VÍA TERRESTRE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2381', 'H', '49211', 'Transporte de pasajeros urbanos e interurbano mediante buses y microbuses');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2382', 'H', '4921101', 'Transporte de pasajeros urbanos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2383', 'H', '4921102', 'Transporte de pasajeros interurbanos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2384', 'H', '49212', 'Transporte de pasajeros interdepartamental mediante buses y microbuses');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2385', 'H', '4921201', 'Transporte de pasajeros ínter departamentales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2386', 'H', '4922', 'OTRAS ACTIVIDADES DE TRANSPORTE  DE PASAJEROS POR VÍA TERRESTRE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2387', 'H', '49221', 'Transporte internacional de pasajeros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2388', 'H', '4922101', 'Transporte internacional de pasajeros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2389', 'H', '49222', 'Transporte de pasajeros mediante taxis y autos con chofer');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2390', 'H', '4922201', 'Servicio de taxis');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2391', 'H', '4922202', 'Alquiler de automóviles con conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2392', 'H', '49229', 'Transporte de pasajeros por vía terrestre n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2393', 'H', '4922901', 'Transporte escolar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2394', 'H', '4922902', 'Transporte de pasajeros para excursiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2395', 'H', '4922903', 'Alquiler de buses con conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2396', 'H', '4922904', 'Servicios de transporte de personal ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2397', 'H', '4923', 'TRASPORTE DE CARGA POR CARRETERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2398', 'H', '49231', 'Transporte de carga urbano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2399', 'H', '4923101', 'Transporte de carga urbano');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2400', 'H', '49232', 'Transporte nacional de carga');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2401', 'H', '4923201', 'Transporte de carga dentro del territorio nacional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2402', 'H', '49233', 'Transporte de carga internacional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2403', 'H', '4923301', 'Transporte de carga  internacional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2404', 'H', '49234', 'Servicios de mudanza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2405', 'H', '4923401', 'Servicios de mudanza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2406', 'H', '49235', 'Alquiler de vehículos de carga con conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2407', 'H', '4923501', 'Alquiler de camiones con conductor (transporte de carga )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2408', 'H', '493', 'TRANSPORTE POR TUBERÍAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2409', 'H', '4930', 'TRANSPORTE POR TUBERÍAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2410', 'H', '49300', 'Transporte por oleoducto o gasoducto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2411', 'H', '4930001', 'Transporte por oleoducto o gasoconducto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2412', 'H', '50', 'TRANSPORTE POR VÍA ACUÁTICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2413', 'H', '501', 'TRANSPORTE MARÍTIMO Y DE CABOTAJE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2414', 'H', '5011', 'TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2415', 'H', '50110', 'Transporte de pasajeros marítimo y de cabotaje');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2416', 'H', '5011001', 'Transporte marítimo de pasajeros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2417', 'H', '5012', 'TRANSPORTE DE CARGA MARÍTIMO Y DE CABOTAJE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2418', 'H', '50120', 'Transporte de carga marítimo y de cabotaje');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2419', 'H', '5012001', 'Transporte marítimo de carga (ferries, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2420', 'H', '502', 'TRANSPORTE POR VÍAS DE NAVEGACIÓN INTERIORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2421', 'H', '5021', 'TRANSPORTE DE PASAJEROS POR VÍAS DE NAVEGACIÓN INTERIORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2422', 'H', '50211', 'Transporte de pasajeros por vías de navegación interiores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2423', 'H', '5021101', 'Transporte de pasajeros por ríos, esteros, bahías, canales y puertos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2424', 'H', '5021102', 'Transporte de pasajeros por vía lacustre (lagos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2425', 'H', '50212', 'Alquiler de equipo de transporte de pasajeros por vías de navegación interior con conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2426', 'H', '5021201', 'Alquiler de equipo de transporte por vía marítima con conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2427', 'H', '5022', 'TRANSPORTE DE CARGA POR VÍAS DE NAVEGACIÓN INTERIORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2428', 'H', '50220', 'Transporte de carga por vías de navegación interiores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2429', 'H', '5022001', 'Transporte de carga por ríos, esteros, bahías, canales y puertos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2430', 'H', '5022002', 'Transporte de carga por vía lacustre (lagos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2431', 'H', '51', 'TRANSPORTE POR VÍA AÉREA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2432', 'H', '511', 'TRANSPORTE DE PASAJEROS POR VÍA AÉREA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2433', 'H', '5110', 'TRANSPORTE DE PASAJEROS POR VÍA AÉREA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2434', 'H', '51100', 'Transporte aéreo de pasajeros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2435', 'H', '5110001', 'Transporte aéreo de pasajeros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2436', 'H', '512', 'TRANSPORTE DE CARGA POR VÍA AÉREA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2437', 'H', '5120', 'TRANSPORTE DE CARGA POR VÍA AÉREA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2438', 'H', '51201', 'Transporte de carga por vía aérea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2439', 'H', '5120101', 'Transporte de carga vía aérea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2440', 'H', '5120102', 'Transporte no regular de carga por vía aérea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2441', 'H', '51202', 'Alquiler de equipo de aerotransporte con operadores para el propósito de transportar carga');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2442', 'H', '5120201', 'Servicio de alquiler de aviones, helicópteros y otros medios de transporte aéreo con conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2443', 'H', '52', 'ALMACENAMIENTO Y ACTIVIDADES DE APOYO AL TRANSPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2444', 'H', '521', 'ALMACENAMIENTO Y DEPOSITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2445', 'H', '5210', 'ALMACENAMIENTO Y DEPOSITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2446', 'H', '52101', 'Alquiler de instalaciones de almacenamiento en zonas francas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2447', 'H', '5210101', 'Alquiler de instalaciones de almacenamiento en zonas francas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2448', 'H', '52102', 'Alquiler de silos para conservación y almacenamiento de granos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2449', 'H', '5210201', 'Alquiler de silos para conservación y almacenamiento de granos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2450', 'H', '52103', 'Alquiler de instalaciones con refrigeración para almacenamiento y conservación de alimentos y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2451', 'H', '5210301', 'Alquiler de instalaciones con refrigeración para almacenamiento y conservación de alimentos y otros productos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2452', 'H', '52109', 'Alquiler de bodegas para almacenamiento y depósito n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2453', 'H', '5210901', 'Alquiler de bodegas para almacenamiento de mercancías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2454', 'H', '522', 'ACTIVIDADES DE APOYO AL TRANSPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2455', 'H', '5221', 'ACTIVIDADES DE SERVICIOS VINCULADAS AL TRANSPORTE TERRESTRE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2456', 'H', '52211', 'Servicio de garaje y estacionamiento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2457', 'H', '5221101', 'Estacionamiento de vehículos (parqueos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2458', 'H', '52212', 'Servicios de terminales para el transporte por vía terrestre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2459', 'H', '5221201', 'Estaciones ferroviarias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2460', 'H', '5221202', 'Estaciones terminales de buses');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2461', 'H', '5221203', 'Terminales para camiones y otros automotores de carga');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2462', 'H', '52219', 'Servicios para el transporte por vía terrestre n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2463', 'H', '5221901', 'Agencias tramitadoras de tránsito');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2464', 'H', '5221902', 'Agencia de venta de pasajes y encomiendas por vía terrestre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2465', 'H', '5222', 'ACTIVIDADES DE SERVICIOS VINCULADAS AL TRANSPORTE ACUÁTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2466', 'H', '52220', 'Servicios para el transporte acuático');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2467', 'H', '5222001', 'Mantenimiento y explotación de muelles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2468', 'H', '5222002', 'Servicios de hangares para lanchas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2469', 'H', '5223', 'ACTIVIDADES DE SERVICIOS VINCULADAS AL TRANSPORTE AÉREO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2470', 'H', '52230', 'Servicios para el transporte aéreo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2471', 'H', '5223001', 'Explotación y mantenimiento de aeropuertos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2472', 'H', '5223002', 'Servicio de guías para estacionamiento de aeronaves');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2473', 'H', '5224', 'MANIPULACIÓN DE CARGA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2474', 'H', '52240', 'Manipulación de carga');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2475', 'H', '5224001', 'Carga y descarga de mercancías y equipaje incluyendo actividades de estiba  y  desestiba  independiente del medio de transporte utilizado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2476', 'H', '5229', 'OTRAS ACTIVIDADES DE APOYO AL TRANSPORTE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2477', 'H', '52290', 'Servicios para el transporte ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2478', 'H', '5229001', 'Agencia de transporte marítimo de carga y  pasajeros  (comisionistas y otros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2479', 'H', '5229002', 'Agencias de tramitaciones aduanales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2480', 'H', '5229003', 'Embalaje de artículos y otras mercancías para el transporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2481', 'H', '5229004', 'Actividades intermediarias relacionadas con el transporte (comisionista)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2482', 'H', '53', 'ACTIVIDADES POSTALES Y DE MENSAJERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2483', 'H', '531', 'ACTIVIDADES POSTALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2484', 'H', '5310', 'ACTIVIDADES POSTALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2485', 'H', '53100', 'Servicios de correo nacional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2486', 'H', '5310001', 'Servicios de correo nacional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2487', 'H', '532', 'ACTIVIDADES DE MENSAJERIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2488', 'H', '5320', 'ACTIVIDADES DE MENSAJERIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2489', 'H', '53200', 'Actividades de correo distintas a las actividades postales nacionales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2490', 'H', '5320001', 'Agencia privada de correo y encomiendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2491', 'I', 'I', 'ACTIVIDADES DE ALOJAMIENTO Y DE SERVICIO DE COMIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2492', 'I', '55', 'ACTIVIDADES DE ALOJAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2493', 'I', '551', 'ACTIVIDADES DE ALOJAMIENTO PARA ESTANCIAS CORTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2494', 'I', '5510', 'ACTIVIDADES DE ALOJAMIENTO PARA ESTANCIAS CORTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2495', 'I', '5510001', 'Hoteles ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2496', 'I', '5510002', 'Moteles ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2497', 'I', '5510003', 'Casa de huéspedes ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2498', 'I', '5510004', 'hostal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2499', 'I', '5510005', 'Hospedaje (pensiones)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2500', 'I', '552', 'ACTIVIDADES DE CAMPAMENTOS, PARQUES DE VEHÍCULOS DE RECREO Y PARQUES DE CARAVANAS.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2501', 'I', '5520', 'ACTIVIDADES DE CAMPAMENTOS, PARQUES DE VEHÍCULOS DE RECREO Y PARQUES DE CARAVANAS.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2502', 'I', '55200', 'Actividades de campamentos, parques de vehículos de recreo y parques de caravanas.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2503', 'I', '5520001', 'Alojamiento en Camping');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2504', 'I', '559', 'OTRAS ACTIVIDADES DE ALOJAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2505', 'I', '5590', 'OTRAS ACTIVIDADES DE ALOJAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2506', 'I', '55900', 'Alojamiento n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2507', 'I', '5590001', 'Villas deportivas (alojamiento para deportistas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2508', 'I', '5590002', 'Tiempo compartido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2509', 'I', '5590003', 'Refugios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2510', 'I', '5590004', 'Casa de retiros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2511', 'I', '56', 'ACTIVIDADES DE SERVICIO DE COMIDAS Y BEBIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2512', 'I', '561', 'ACTIVIDADES DE RESTAURANTES Y DE SERVICIO MÓVIL DE COMIDAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2513', 'I', '5610', 'ACTIVIDADES DE RESTAURANTES Y DE SERVICIO MÓVIL DE COMIDAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2514', 'I', '5610001', 'Pizzerías (pizzas y otros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2515', 'I', '5610002', 'Venta de hamburguesas y otros alimentos preparados para consumo inmediato');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2516', 'I', '5610003', 'Venta de pollos rostizados, empanizados, fritos, asados, etc. y otros alimentos preparados para consumo inmediato');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2517', 'I', '5610004', 'Venta de tacos y otros alimentos similares preparados para consumo inmediato');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2518', 'I', '5610005', 'Comedor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2519', 'I', '5610006', 'Cafetería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2520', 'I', '5610007', 'Merenderos, puestos de refrigerio, venta de sopas y otros alimentos similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2521', 'I', '5610008', 'Venta de panes rellenos, sándwiches, hot dog, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2522', 'I', '5610009', 'Chalet  en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2523', 'I', '5610010', 'Comedor. en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2524', 'I', '5610011', 'Venta de encurtidos, verduras cocidas y ensaladas en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2525', 'I', '5610012', 'Venta de conchas, ostras y otros mariscos, alimentos preparados y bebidas en puestos de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2526', 'I', '5610013', 'Pupusería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2527', 'I', '5610014', 'Tamales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2528', 'I', '5610015', 'Empanadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2529', 'I', '5610016', 'Chilaterías y venta de atoles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2530', 'I', '5610017', 'Restaurantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2531', 'I', '5610018', 'Venta de conchas, ostras y otros mariscos, alimentos preparados y bebidas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2532', 'I', '5610019', 'Venta de productos helados con o sin leche de diferentes sabores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2533', 'I', '562', 'SUMINISTRO DE COMIDAS POR ENCARGO Y OTRAS ACTIVIDADES DE SERVICIO DE COMIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2534', 'I', '5621', 'SUMINISTRO DE COMIDAS POR ENCARGO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2535', 'I', '56210', 'Preparación de comida para eventos especiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2536', 'I', '5621001', 'Alimentos preparados a domicilio por encargo o para eventos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2537', 'I', '5629', 'OTRAS ACTIVIDADES DE SERVICIO DE COMIDAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2538', 'I', '56291', 'Servicios de provisión de comidas por contrato ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2539', 'I', '5629101', 'Servicios de comida por contrata ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2540', 'I', '56292', 'Servicios de concesión de cafetines y chalet en empresas e instituciones ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2541', 'I', '5629201', 'Servicios de concesión de cafetines y chalet en empresas e instituciones ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2542', 'I', '56299', 'Servicios de preparación de comidas n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2543', 'I', '5629901', 'Servicios de preparación de comidas n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2544', 'I', '563', 'ACTIVIDADES DE SERVICIO DE BEBIDAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2545', 'I', '5630', 'ACTIVIDADES DE SERVICIO DE BEBIDAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2546', 'I', '56301', 'Servicio de expendio de bebidas en salones y bares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2547', 'I', '5630101', 'Cervecería (salón)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2548', 'I', '5630102', 'Bares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2549', 'I', '56302', 'Servicio de expendio de bebidas en puestos callejeros, mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2550', 'I', '5630201', 'Venta de bebidas refrescantes (refresquerías, venta de jugos naturales, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2551', 'I', '5630202', 'Venta de bebidas: café, atoles, chilaterias,etc. En locales  de mercados y ferias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2552', 'I', '5630203', 'Servicio de expendio de bebidas por vendedores ambulantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2553', 'J', 'J', 'INFORMACION Y COMUNICACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2554', 'J', '58', 'ACTIVIDADES DE EDICIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2555', 'J', '581', 'EDICION DE LIBROS Y PUBLICACIONES PERIÓDICAS Y OTRAS ACTIVIDADES DE EDICIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2556', 'J', '5811', 'EDICIÓN DE LIBROS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2557', 'J', '58110', 'Edicion de libros, folletos, partituras y otras ediciones distintas a estas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2558', 'J', '5811001', 'Edición de libros, folletos,  partituras y otras ediciones distintas a estas enciclopedias, diccionarios, panfletos, brochoures, enciclopedias en CD, mapas, guías telefónicas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2559', 'J', '5812', 'EDICIÓN DE DIRECTORIOS Y LISTAS DE CORREOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2560', 'J', '58120', 'Edición de directorios y listas de correos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2561', 'J', '5812001', 'Edición de libros telefónicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2562', 'J', '5813', 'EDICIÓN DE PERIODICOS, REVISTAS Y OTRAS PUBLICACIONES PERIODICAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2563', 'J', '58130', 'Edición de periódicos, revistas y otras publicaciones periódicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2564', 'J', '5813001', 'Edición de periódicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2565', 'J', '5813002', 'Edición de revista y otras publicaciones periódicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2566', 'J', '5819', 'OTRAS ACTIVIDADES DE EDICIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2567', 'J', '58190', 'Otras actividades de edición');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2568', 'J', '5819001', 'Edición de grabado, tarjetas postales, reproducción obras de arte y otras impresiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2569', 'J', '5819002', 'Edición de talonarios de cheques, billetes de banco, sellos de correo, estampillas postales, timbres fiscales, certificados de bonos, valores y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2570', 'J', '582', 'EDICIÓN DE PROGRAMAS INFORMÁTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2571', 'J', '5820', 'EDICIÓN DE PROGRAMAS INFORMÁTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2572', 'J', '58200', 'Edición de programas informáticos (software)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2573', 'J', '5820001', 'Edición de programas informáticos software');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2574', 'J', '59', 'ACTIVIDADES DE PRODUCCION DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y PROGRAMAS DE TELEVISIÓN, GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2575', 'J', '591', 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEO Y PROGRAMAS DE TELEVISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2576', 'J', '5911', 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEO Y PROGRAMAS DE TELEVISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2577', 'J', '59110', 'Actividades de producción cinematográfica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2578', 'J', '5911001', 'Producción de películas cinematográficas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2579', 'J', '5911002', 'Producción de anuncios  comerciales   para televisión , cines ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2580', 'J', '5912', 'ACTIVIDADES DE POST PRODUCCION DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y PROGRAMAS DE TELEVISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2581', 'J', '59120', 'Actividades de post produccion de peliculas, videos y programas de television ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2582', 'J', '5912001', 'Laboratorio de revelado de películas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2583', 'J', '5912002', 'Edición de anuncios comerciales para cines ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2584', 'J', '5913', 'ACTIVIDADES DE DISTRIBUCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y PROGRAMAS DE TELEVISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2585', 'J', '59130', 'Actividades de distribución de películas cinematográficas, videos y programas de televisión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2586', 'J', '5913001', 'Distribución de películas, videos y programas de televisión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2587', 'J', '5913002', 'Agencia de contratación de películas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2588', 'J', '5914', 'ACTIVIDADES DE EXHIBICIÓN DE PELÍCULAS CINEMATOGRÁFICAS Y CINTAS DE VÍDEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2589', 'J', '59140', 'Actividades de exhibición de películas cinematográficas y cintas de vídeo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2590', 'J', '5914001', 'Exhibición de películas (salas de cine)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2591', 'J', '592', 'ACTIVIDADES DE GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2592', 'J', '5920', 'ACTIVIDADES DE GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2593', 'J', '59200', 'Actividades de edición y grabación de música  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2594', 'J', '5920001', 'Edición de grabaciones de discos gramofónicos, casetes y otros.  Se incluye grabaciones de sonido para  filmes y videocintas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2595', 'J', '5920002', 'Grabación de discos gramofónicos, cintas magnetofónicas, casetes, videos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2596', 'J', '60', 'ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2597', 'J', '601', 'TRANSMISIONES DE RADIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2598', 'J', '6010', 'TRANSMISIONES DE RADIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2599', 'J', '60100', 'Servicios de difusiones de radio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2600', 'J', '6010001', 'Estaciones de radiodifusión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2601', 'J', '6010002', 'Producción de programas de radio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2602', 'J', '6010003', 'Servicios de música ambiental ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2603', 'J', '602', 'PROGRAMACIÓN Y TRANSMISIONES DE TELEVISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2604', 'J', '6020', 'PROGRAMACIÓN Y TRANSMISIONES DE TELEVISIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2605', 'J', '60201', 'Actividades de programación y difusión de televisión abierta');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2606', 'J', '6020101', 'Estaciones de televisión por canal abierto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2607', 'J', '60202', 'Actividades de suscripción y difusión de televisión por cable y/o suscripción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2608', 'J', '6020201', 'Televisión  vía cable (por suscripción)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2609', 'J', '6020202', 'Televisión  vía microonda (por suscripción)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2610', 'J', '61', 'TELECOMUNICACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2611', 'J', '611', 'ACTIVIDAD  DE TELECOMUNICACIONES ALÁMBRICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2612', 'J', '6110', 'ACTIVIDAD  DE TELECOMUNICACIONES ALÁMBRICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2613', 'J', '61101', 'Servicio de telefonía fija');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2614', 'J', '6110101', 'Telefonía básica (teléfono fijo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2615', 'J', '6110102', 'Servicio de mantenimiento de redes y equipo de telecomunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2616', 'J', '61102', 'SERVICIO DE INTERNET');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2617', 'J', '6110201', 'Servicio de proveedores de Internet');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2618', 'J', '61109', 'Servicio de Internet n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2619', 'J', '6110901', 'Servicio de Internet (cibercafe, correo electronico etc)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2620', 'J', '612', 'ACTIVIDADES DE TELECOMUNICACIONES INALÁMBRICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2621', 'J', '6120', 'ACTIVIDADES DE TELECOMUNICACIONES INALÁMBRICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2622', 'J', '61201', 'Servicios de telefonía celular');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2623', 'J', '6120101', 'Telefonía celular');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2624', 'J', '61202', 'Servicios de Internet inalámbrico ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2625', 'J', '6120201', 'Servicios de Internet inalámbrico ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2626', 'J', '61209', 'Servicios de telecomunicaciones inalámbrico n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2627', 'J', '6120901', 'Servicios de radio búsqueda ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2628', 'J', '6120902', 'Servicios de beeper');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2629', 'J', '6120903', 'Servicios de  mensajes por telefonía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2630', 'J', '613', 'ACTIVIDADES DE TELECOMUNICACIONES  POR SATÉLITE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2631', 'J', '6130', 'ACTIVIDADES DE TELECOMUNICACIONES  POR SATÉLITE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2632', 'J', '61301', 'Telecomunicaciones  satelitales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2633', 'J', '6130101', 'Internet satelital ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2634', 'J', '6130102', 'Televisión satelital ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2635', 'J', '6130103', 'Telecomunicaciones  satelitales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2636', 'J', '61309', 'Comunicación vía satélite n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2637', 'J', '6130901', 'Comunicación vía satélite n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2638', 'J', '619', 'OTRAS ACTIVIDADES DE TELECOMUNICACIONES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2639', 'J', '6190', 'OTRAS ACTIVIDADES DE TELECOMUNICACIONES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2640', 'J', '61900', 'Actividades de telecomunicación n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2641', 'J', '6190001', 'Estaciones de radar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2642', 'J', '6190002', 'Radiofaros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2643', 'J', '6190003', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2644', 'J', '6190004', 'Radiocomunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2645', 'J', '6190005', 'Radiocomunicación por canal compartido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2646', 'J', '6190006', 'Servicios de recarga electrónica de teléfono ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2647', 'J', '62', 'PROGRAMACIÓN INFORMÁTICA, CONSULTORÍA INFORMÁTICA Y ACTIVIDADES CONEXAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2648', 'J', '620', 'ACTIVIDADES DE PROGRAMACIÓN INFORMATICA Y DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES CONEXAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2649', 'J', '6201', 'ACTIVIDADES DE PROGRAMACIÓN INFORMÁTICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2650', 'J', '62010', 'Programación Informática');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2651', 'J', '6201001', 'Elaboración de software');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2652', 'J', '6201002', 'Servicios de mantenimiento (soporte) de sistemas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2653', 'J', '6202', 'ACTIVIDADES DE CONSULTORÍA DE INFORMÁTICA Y GESTIÓN DE INSTALACIONES INFORMÁTICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2654', 'J', '62020', 'Consultorias y gestión de servicios informáticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2655', 'J', '6202001', 'Servicios de consultoría y asesoría en programas de informática');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2656', 'J', '6202002', 'Servicios de gestión de instalaciones de informática');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2657', 'J', '6202003', 'Servicios de consultoría y asesoría en equipos de informática');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2658', 'J', '6202004', 'Otros servicios de consultoría en informática');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2659', 'J', '6209', 'OTRAS ACTIVIDADES  DE TECNOLOGIA  DE LA INFORMACION  Y  DE SERVICIOS INFORMÁTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2660', 'J', '62090', 'Otras actividades  de tecnologia  de informacion y servicios  de computadora ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2661', 'J', '6209001', 'Instalación de software (incluye solo la instalación no elaboración)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2662', 'J', '6209002', 'Recuperación de archivos dañados ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2663', 'J', '6209003', 'Arrendamiento de software');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2664', 'J', '63', 'ACTIVIDADES DE SERVICIOS DE INFORMACION');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2665', 'J', '631', 'PROCESAMIENTO DE DATOS, HOSPEDAJES Y ACTIVIDADES CONEXAS; PORTALES WEB');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2666', 'J', '6311', 'PROCESAMIENTO DE DATOS, HOSPEDAJES Y ACTIVIDADES CONEXAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2667', 'J', '63110', 'Procesamiento de datos, Hospedajes y Actividades Relacionadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2668', 'J', '6311001', 'Servicios de procesamiento de datos comprende: procesamiento, tabulación, preparación de informe de resultados, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2669', 'J', '6311002', 'Actividades relacionadas con base de datos comprende: preparación, almacenamiento y suministro de datos financieros, económicos, estadísticos, técnicos, etc. para el usuario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2670', 'J', '6311003', 'Actividades relacionadas con bases de datos correspondientes a:  Registro y emisión de documentos de identificación de personas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2671', 'J', '6311004', 'Otras actividades de informática (trabajos hechos por computadora, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2672', 'J', '6311005', 'Servicios de transmisión de datos, hosting  y otras actividades relacionadas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2673', 'J', '6312', 'PORTALES WEB');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2674', 'J', '63120', 'Portales WEB');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2675', 'J', '639', 'OTRAS ACTIVIDADES DE SERVICIOS DE INFORMACIÓN');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2676', 'J', '6391', 'ACTIVIDADES  DE AGENCIAS DE NOTICIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2677', 'J', '63910', 'Servicios de Agencias de Noticias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2678', 'J', '6391001', 'Agencias de información y de noticias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2679', 'J', '6399', 'OTROS SERVICIOS DE INFORMACION N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2680', 'J', '63990', 'Otros servicios de  informacion  n.c.p. ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2681', 'J', '6399001', 'Servicio de información de datos a nivel nacional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2682', 'K', 'K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2683', 'K', '64', 'ACTIVIDADES DE SERVICIOS FINANCIEROS EXCEPTO LAS DE SEGUROS Y FONDOS DE PENSIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2684', 'K', '641', 'INTERMEDIACIÓN MONETARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2685', 'K', '6411', 'BANCO CENTRAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2686', 'K', '64110', 'Servicios provistos por el Banco Central de El salvador ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2687', 'K', '6411001', 'Banco Central');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2688', 'K', '6419', 'OTROS TIPOS DE INTERMEDIACIÓN MONETARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2689', 'K', '64190', 'Servicio de bancos comerciales e intermediarios monetarios autorizados a recibir depósitos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2690', 'K', '6419001', 'Bancos  comerciales (autorizados para captar depósitos y otras actividades)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2691', 'K', '6419002', 'Otras entidades de intermediación monetaria (Financiera Calpia S.A., Federación de Cajas de Crédito, Banco de los Trabajadores, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2692', 'K', '6419003', 'Entidades dedicadas al envió de remesas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2693', 'K', '642', 'ACTIVIDADES  DE SOCIEDADES DE CARTERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2694', 'K', '6420', 'ACTIVIDADES  DE SOCIEDADES DE CARTERA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2695', 'K', '64200', 'Actividades de sociedades de cartera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2696', 'K', '6420001', 'Actividades de sociedades de control (holding)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2697', 'K', '643', 'FONDOS Y SOCIEDADES DE INVERSIÓN Y ENTIDADES FINANCIERAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2698', 'K', '6430', 'FONDOS Y SOCIEDADES DE INVERSIÓN Y ENTIDADES FINANCIERAS SIMILARES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2699', 'K', '64300', 'Fideicomisos, fondos y otras fuentes de financiamiento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2700', 'K', '6430001', 'Fideicomisos, fondos y otros instrumentos financieros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2701', 'K', '649', 'OTRAS ACTIVIDADES DE SERVICIOS FINANCIEROS, EXCEPTO LAS DE SEGUROS Y FONDO DE  PENSIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2702', 'K', '6491', 'ARRENDAMIENTO FINANCIERO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2703', 'K', '64910', 'Arrendamiento financieros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2704', 'K', '6491001', 'Arrendamiento financiero (leasing) ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2705', 'K', '6492', 'OTRAS ACTIVIDADES DE CONCESIÓN DE CRÉDITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2706', 'K', '64920', 'Tipos de crédito ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2707', 'K', '6492001', 'Entidades representantes de bancos extranjeros que realizan intermediación financiera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2708', 'K', '6492002', 'Banco de segundo piso (Banco que presta a Bancos) Banco Multisectorial de inversiones (BMI)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2709', 'K', '6492003', 'Instituciones no depositarias que otorgan crédito para viviendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2710', 'K', '6492004', 'Entidades de crédito para el fomento y desarrollo de actividades relacionadas con la producción e inversión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2711', 'K', '6492005', 'Asociaciones cooperativas de ahorro y crédito dedicadas a la intermediación financiera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2712', 'K', '6492006', 'Prestamistas y casas de empeño');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2713', 'K', '6492007', 'Instituciones de créditos ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2714', 'K', '6492008', 'Instituciones emisoras de tarjetas de crédito y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2715', 'K', '6499', 'OTRAS ACTIVIDADES DE SERVICIOS FINANCIEROS, EXCEPTO LAS DE SEGUROS Y FONDO DE PENSIONES N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2716', 'K', '64990', 'Actividades de servicios financieros, excepto la financiación de planes de seguros y de pensiones n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2717', 'K', '6499001', 'Inversionistas financieros (acciones, títulos, títulos valores)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2718', 'K', '6499002', 'Servicios de factoraje (factoring)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2719', 'K', '6499003', 'Servicios financieros n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2720', 'K', '65', 'SEGUROS, REASEGUROS Y FONDOS DE PENSIONES, EXCEPTO PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2721', 'K', '651', 'SEGUROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2722', 'K', '6511', 'SEGUROS DE VIDA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2723', 'K', '65110', 'Planes de seguros de vida ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2724', 'K', '6511001', 'Seguros de vida (compañías de seguro)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2725', 'K', '6512', 'SEGUROS GENERALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2726', 'K', '65120', 'Planes de seguro excepto de vida');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2727', 'K', '6512001', 'Seguros generales de todo tipo (Compañías de Seguros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2728', 'K', '6512002', 'Casas de fianza (compañías emisoras de fianzas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2729', 'K', '652', 'REASEGUROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2730', 'K', '6520', 'REASEGUROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2731', 'K', '65200', 'Planes se seguro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2732', 'K', '653', 'FONDOS DE PENSIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2733', 'K', '6530', 'FONDOS DE PENSIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2734', 'K', '65300', 'Planes de pensiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2735', 'K', '6530001', 'Pensión jubilatoria de afiliación no obligatoria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2736', 'K', '66', 'ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2737', 'K', '661', 'ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS, EXCEPTO LAS DE SEGUROS Y FONDOS DE PENSIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2738', 'K', '6611', 'ADMINISTRACIÓN DE MERCADOS FINANCIEROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2739', 'K', '66110', 'Administración de mercados financieros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2740', 'K', '6611001', 'Bolsa de valores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2741', 'K', '6612', 'CORRETAJE DE VALORES Y DE CONTRATOS DE PRODUCTOS BASICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2742', 'K', '66120', 'Actividades bursátiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2743', 'K', '6612001', 'Corredores de bolsa (Casas de corredores de bolsa)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2744', 'K', '6619', 'OTRAS ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2745', 'K', '66190', 'Actividades auxiliares  de la intermediación financiera n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2746', 'K', '6619001', 'Servicios asesoría y consultoría  financiera y de valuos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2747', 'K', '6619002', 'Casas de cambio (compra, venta de divisas)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2748', 'K', '6619003', 'Servicios  por comisión de usos de POS  y cajeros  automáticos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2749', 'K', '662', 'ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SEGUROS Y FONDOS DE PENSIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2750', 'K', '6621', 'EVALUACIÓN DE RIESGOS Y DAÑOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2751', 'K', '66210', 'Evaluación de riesgos y daños');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2752', 'K', '6621001', 'Evaluación y liquidación de reclamos de seguros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2753', 'K', '6622', 'ACTIVIDADES DE AGENTES  Y CORREDORES DE SEGUROS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2754', 'K', '66220', 'Actividades  de agentes  y corredores de seguros  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2755', 'K', '6622001', 'Agentes corredores de seguros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2756', 'K', '6629', 'OTRAS ACTIVIDADES  AUXILIARES DE LAS ACTIVIDADES DE SEGUROS Y FONDOS DE PENSIONES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2757', 'K', '66290', 'Otras Actividades auxiliares  de seguros y  fondos de pensiones ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2758', 'K', '6629001', 'Actividades  Auxiliares de seguros y de pensiones ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2759', 'K', '6629002', 'Asesoría y consultoría en seguros y pensiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2760', 'K', '663', 'ACTIVIDADES DE ADMINISTRACION DE FONDOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2761', 'K', '6630', 'ACTIVIDADES DE ADMINISTRACION DE FONDOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2762', 'K', '66300', 'Actividades de administración de fondos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2763', 'K', '6630001', 'Instituciones Administradoras de Fondo de Pensiones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2764', 'L', 'L', 'ACTIVIDADES INMOBILIARIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2765', 'L', '68', 'ACTIVIDADES INMOBILIARIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2766', 'L', '681', 'ACTIVIDADES INMOBILIARIAS REALIZADAS CON BIENES PROPIOS O ARRENDADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2767', 'L', '6810', 'ACTIVIDADES INMOBILIARIAS REALIZADAS CON BIENES PROPIOS O ARRENDADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2768', 'L', '68101', 'Servicio de alquiler y venta de lotes en cementerios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2769', 'L', '6810101', 'Urbanización y venta de lotes o nichos en cementerios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2770', 'L', '6810102', 'Arrendamiento o alquiler de nichos en cementerios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2771', 'L', '68109', 'Actividades inmobiliarias realizadas con bienes propios o arrendados n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2772', 'L', '6810901', 'Arrendamiento y venta de inmuebles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2773', 'L', '6810902', 'Lotificación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2774', 'L', '6810903', 'Arrendamiento o alquiler de apartamentos y viviendas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2775', 'L', '6810904', 'Arrendamiento o alquiler  de edificios no residenciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2776', 'L', '6810905', 'Alquiler de stand para eventos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2777', 'L', '682', 'ACTIVIDADES INMOBILIARIAS REALIZADAS A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2778', 'L', '6820', 'ACTIVIDADES INMOBILIARIAS REALIZADAS A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2779', 'L', '68200', 'Actividades Inmobiliarias Realizadas a Cambio de una Retribución o por Contrata');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2780', 'L', '6820001', 'Arrendamiento o alquiler  y venta de bienes inmuebles a cambio de una retribución por contrata: bienes raíces');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2781', 'L', '6820002', 'Asesoria sobre  bienes inmuebles ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2782', 'L', '6820003', 'Administración de bienes  inmobiliarios ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2783', 'M', 'M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2784', 'M', '69', 'ACTIVIDADES JURÍDICAS Y CONTABLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2785', 'M', '691', 'ACTIVIDADES JURÍDICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2786', 'M', '6910', 'ACTIVIDADES JURÍDICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2787', 'M', '69100', 'Actividades jurídicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2788', 'M', '6910001', 'Asesoramiento y representación jurídica en las diferentes esferas del derecho');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2789', 'M', '6910002', 'Asesoramiento en Agentes de marcas, licencias y patentes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2790', 'M', '692', 'ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS Y AUDITORIA; CONSULTORIA FISCAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2791', 'M', '6920', 'ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS Y AUDITORIA; CONSULTORIA FISCAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2792', 'M', '69200', 'Actividades de contabilidad, teneduría de libros y auditoria; asesoramiento en materia de impuestos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2793', 'M', '6920001', 'Actividades de contabilidad (despachos contables)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2794', 'M', '6920002', 'Auditoria y consultoría (en contabilidad)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2795', 'M', '6920003', 'Asesoramiento en materia de impuesto');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2796', 'M', '70', 'ACTIVIDADES DE OFICINAS CENTRALES; ACTIVIDADES DE CONSULTORIA EN GESTIÓN EMPRESARIAL ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2797', 'M', '701', 'ACTIVIDADES DE OFICINAS CENTRALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2798', 'M', '7010', 'ACTIVIDADES  DE OFICINAS CENTRALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2799', 'M', '70100', 'Actividades de oficinas centrales de sociedades de cartera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2800', 'M', '7010001', 'Actividades de apoyo de las oficinas centrales a las unidades  auxiliares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2801', 'M', '702', 'ACTIVIDADES DE CONSULTORIA EN  GESTIÓN EMPRESARIAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2802', 'M', '7020', 'ACTIVIDADES  DE ADMINISTRACION DE EMPRESAS  Y DE CONSULTORIA  SOBRE ADMINISTRACION DE EMPRESAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2803', 'M', '70200', 'Actividades de consultoria en gestión empresarial ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2804', 'M', '7020001', 'Servicios de consultoría y auditoría en  gestión  de salud ocupacional ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2805', 'M', '7020002', 'Servicios de asesoría y consultoría en gestión general. Incluye: asistencia , estrategia y normativa de sociedades; planificación, estructuración y supervisión de una organización');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2806', 'M', '7020003', 'Servicios de asesoría y consultoría en gestión financiera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2807', 'M', '7020004', 'Servicios de asesoría y consultoría  en gestión de recursos humanos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2808', 'M', '7020005', 'Servicios  de asesoría y consultoría en gestión de la comercialización');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2809', 'M', '7020006', 'Asesoría y consultoría en gestión de la producción agrícola, pecuaria, forestal y otras afines');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2810', 'M', '7020007', 'Asesoría y consultoría en gestión de la producción  de peces , crustáceos, moluscos y otros animales acuáticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2811', 'M', '7020008', 'Asesoría  y consultoría en gestión de la producción de la industria manufacturera');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2812', 'M', '7020009', 'Servicios de asesoría y consultoría en gestión prestados a las empresas. Incluye: relaciones públicas, servicios de desarrollo, regionales industriales o de turismo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2813', 'M', '7020010', 'Otros servicios de asesoría y consultoría en gestión. Incluye: servicios de consultoría logística.(Administrativa)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2814', 'M', '7020011', 'Servicios de asesoría y consultoría económica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2815', 'M', '71', 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA; ENSAYOS Y ANÁLISIS TÉCNICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2816', 'M', '711', 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA Y ACTIVIDADES CONEXAS DE CONSULTORÍA TÉCNICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2817', 'M', '7110', 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA Y ACTIVIDADES CONEXAS DE CONSULTORÍA TÉCNICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2818', 'M', '71101', 'Servicios de arquitectura y planificación urbana y servicios conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2819', 'M', '7110101', 'Diseño arquitectónico, planificación urbana, arquitectura paisajista y  otros servicios de arquitectura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2820', 'M', '71102', 'Servicios de ingeniería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2821', 'M', '7110201', 'Consultoría, asesoría técnica y dirección de obras de ingeniería civil');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2822', 'M', '7110202', 'Servicios integrados de ingeniería para la construcción de plantas y procesos industriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2823', 'M', '7110203', 'Asesoría y consultoría en ingeniería hidráulica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2824', 'M', '7110204', 'Asesoría, consultoría y dirección de obras de sistemas de ingeniería sanitaria (para el saneamiento y control de la contaminación.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2825', 'M', '7110205', 'Servicios de gestión de proyectos para la construcción de obras de ingeniería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2826', 'M', '7110206', 'Consultoría, asesoría técnica y dirección de actividades de ingeniería eléctrica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2827', 'M', '7110207', 'Consultoría y asesoría técnica y dirección de actividades de ingeniería electrónica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2828', 'M', '7110208', 'Consultoría, asesoría técnica y dirección de actividades de ingeniería industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2829', 'M', '7110209', 'Consultaría técnica y otras actividades de ingeniería mecánica y comunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2830', 'M', '7110210', 'Consultoría, asesoría técnica y otras actividades de la ingeniería química y ramas afines');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2831', 'M', '7110211', 'Asesoría, consultoría y actividades de ingeniería  de sistemas de refrigeración acondicionamiento de aire y calefacción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2832', 'M', '71103', 'Servicios de agrimensura, topografía, cartografía, prospección y geofísica y servicios conexos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2833', 'M', '7110301', 'Actividades de agrimensura, topografía, cartografía y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2834', 'M', '7110302', 'Asesoría, consultoría y servicios de prospección geológica y geofísica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2835', 'M', '712', 'ENSAYOS Y ANÁLISIS TÉCNICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2836', 'M', '7120', 'ENSAYOS Y ANÁLISIS TÉCNICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2837', 'M', '71200', 'Ensayos y análisis técnicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2838', 'M', '7120001', 'Ensayos y análisis de todo tipo de materiales y productos para determinar, clasificar y definir su composición, pureza y fiabilidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2839', 'M', '7120002', 'Ensayo y análisis para determinar las propiedades físicas de productos y materiales  en cuanto a su resistencia, espesor , durabilidad, ductibilidad, conductividad eléctrica, radioactividad etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2840', 'M', '7120003', 'Ensayos y análisis  de sistemas mecánicos y eléctricos integrados. Calificación y  fiabilidad, certificación de productos, análisis de defectos, la evaluación de materiales. etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2841', 'M', '7120004', 'Consultoras y certificadoras de normas ISO y otras normas técnicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2842', 'M', '7120005', 'Servicios de control de calidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2843', 'M', '72', 'INVESTIGACIÓN CIENTÍFICA Y DESARROLLO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2844', 'M', '721', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2845', 'M', '7210', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2846', 'M', '72100', 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2847', 'M', '7210001', 'Investigación y desarrollo experimental en ingeniería y tecnología');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2848', 'M', '7210002', 'Investigación y desarrollo experimental en agricultura, ganadería y silvicultura');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2849', 'M', '7210003', 'Investigación y desarrollo experimental en pesca: crianza, cultivo y reproducción de peces, crustáceos, moluscos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2850', 'M', '7210004', 'Investigación y desarrollo experimental en ciencias naturales: biología y química');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2851', 'M', '7210005', 'Investigación y desarrollo experimental en ciencias médicas y farmacia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2852', 'M', '722', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2853', 'M', '7220', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2854', 'M', '72200', 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2855', 'M', '7220001', 'Investigación y desarrollo experimental en el campo de las ciencias sociales y humanidades');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2856', 'M', '73', 'PUBLICIDAD Y ESTUDIOS DE MERCADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2857', 'M', '731', 'PUBLICIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2858', 'M', '7310', 'PUBLICIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2859', 'M', '73100', 'Publicidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2860', 'M', '7310001', 'Agencias de publicidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2861', 'M', '7310002', 'Agencias de representación de editoriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2862', 'M', '7310003', 'Servicios de promoción comercial anunciadoras, preparación de ofertas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2863', 'M', '7310004', 'Decoración de escaparate, vitrinas, sala de exhibición y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2864', 'M', '7310005', 'Alquiler de espacios  y mantenimientos  en vallas publicitarias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2865', 'M', '7310006', 'Alquiler de espacio publicitario en salas de cine');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2866', 'M', '732', 'ESTUDIOS DE MERCADO Y DE ENCUESTAS DE OPINIÓN PÚBLICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2867', 'M', '7320', 'ESTUDIOS DE MERCADO Y DE ENCUESTAS DE OPINIÓN PÚBLICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2868', 'M', '73200', 'Investigación de mercados y realización de encuestas de opinión pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2869', 'M', '7320001', 'Investigación de mercado y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2870', 'M', '7320002', 'Investigación sociopolíticas y encuestas de opinión pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2871', 'M', '7320003', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2872', 'M', '7320004', 'Monitoreo de publicidad ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2873', 'M', '74', 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2874', 'M', '741', 'ACTIVIDADES ESPECIALIZADAS DE DISEÑO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2875', 'M', '7410', 'ACTIVIDADES ESPECIALIZADAS DE DISEÑO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2876', 'M', '74100', 'Actividades de diseño especializado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2877', 'M', '7410001', 'Actividades de diseño industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2878', 'M', '7410002', 'Estudio o agencia de diseño gráfico (arte comercial)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2879', 'M', '742', 'ACTIVIDADES DE FOTOGRAFÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2880', 'M', '7420', 'ACTIVIDADES DE FOTOGRAFÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2881', 'M', '74200', 'Actividades de fotografía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2882', 'M', '7420001', 'Estudios fotográficos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2883', 'M', '7420002', 'Fotografía comercial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2884', 'M', '7420003', 'Revelado de películas excepto filme');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2885', 'M', '7420004', 'Servicios de microfilmación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2886', 'M', '749', 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2887', 'M', '7490', 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2888', 'M', '74900', 'Servicios profesionales y científicos n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2889', 'M', '7490001', 'Asesoría y consultoría del medio ambiente y ecología');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2890', 'M', '7490002', 'Servicios metereológicos y de predicción del tiempo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2891', 'M', '7490003', 'Otros servicios de asesoría y consultoría científica y técnica n.c.p.  prestados por: matemáticos, estadísticos etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2892', 'M', '7490004', 'Agencias de contratación de espectáculos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2893', 'M', '7490005', 'Servicios de traducción y de interpretes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2894', 'M', '7490006', 'Servicios de consultoría y asesoria en seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2895', 'M', '7490007', 'Servicios  de asesoria migratoria ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2896', 'M', '7490008', 'Catadores  y clasificadores de alimentos y bebidas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2897', 'M', '75', 'ACTIVIDADES VETERINARIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2898', 'M', '750', 'ACTIVIDADES VETERINARIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2899', 'M', '7500', 'ACTIVIDADES VETERINARIAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2900', 'M', '75000', 'Actividades veterinarias');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2901', 'M', '7500001', 'Hospital veterinario y otros servicios para animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2902', 'M', '7500002', 'Clínica veterinaria y otros servicios para animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2903', 'N', 'N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2904', 'N', '77', 'ACTIVIDADES DE ALQUILER Y ARRENDAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2905', 'N', '771', 'ALQUILER Y ARRENDAMIENTO DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2906', 'N', '7710', 'ALQUILER Y ARRENDAMIENTO DE VEHÍCULOS AUTOMOTORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2907', 'N', '77101', 'Alquiler de equipo de transporte terrestre');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2908', 'N', '7710101', 'Alquiler de automóviles sin conductor (carros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2909', 'N', '7710102', 'Alquiler de autobuses sin conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2910', 'N', '7710103', 'Alquiler de transporte de carga sin conductor (camiones, pick-up, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2911', 'N', '4540', 'VENTA, MANTENIMIENTO Y REPARACIÓN DE MOTOCICLETAS Y SUS PARTES, PIEZAS Y ACCESORIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2912', 'N', '77102', 'Alquiler de equipo de transporte acuático');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2913', 'N', '7710201', 'Alquiler de equipo de transporte por vía acuática sin conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2914', 'N', '77103', 'Alquiler de equipo de transporte por vía aérea');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2915', 'N', '7710301', 'Alquiler de aviones y helicópteros sin conductor');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2916', 'N', '772', 'ALQUILER Y ARRENDAMIENTO DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2917', 'N', '7721', 'ALQUILER Y ARRENDAMIENTO DE EQUIPO DE RECREO Y DEPORTIVO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2918', 'N', '77210', 'Alquiler y arrendamiento de equipo de recreo y deportivo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2919', 'N', '7721001', 'Alquiler de bicicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2920', 'N', '7721002', 'Alquiler de equipo y artículos de deporte y esparcimiento  incluyendo los deportes acuáticos (ski acuático, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2921', 'N', '7721003', 'Alquiler de caballos de montar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2922', 'N', '7721004', 'Alquiler de lanchas, canoas, barcos y otros equipos de recreo y deportivo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2923', 'N', '7722', 'ALQUILER DE CINTAS DE VIDEO Y DISCOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2924', 'N', '77220', 'Alquiler de cintas de video y discos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2925', 'N', '7722001', 'Alquiler de videocintas o películas (renta videos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2926', 'N', '7729', 'ALQUILER Y ARRENDAMIENTO DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS NCP');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2927', 'N', '77290', 'Alquiler efectos personales y enseres domésticos ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2928', 'N', '7729001', 'Alquiler de cristalería, mesas, sillas y otros artículos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2929', 'N', '7729002', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2930', 'N', '7729003', 'Alquiler de prendas de vestir y accesorios  para ocasiones especiales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2931', 'N', '7729004', 'Alquiler de aparatos y equipos de música para amenizar fiestas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2932', 'N', '7729005', 'Alquiler de muebles de oficina');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2933', 'N', '7729006', 'Alquiler de enseres, artículos decorativos plantas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2934', 'N', '773', 'ALQUILER Y ARRENDAMIENTO DE MAQUINARIA, EQUIPO Y BIENES MATERIALES NCP');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2935', 'N', '7730', 'ALQUILER DE MAQUINARIA Y EQUIPO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2936', 'N', '77300', 'Alquiler de maquinaria y equipo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2937', 'N', '7730001', 'Alquiler o arrendamiento de maquinaria y equipo agropecuario sin operarios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2938', 'N', '7730002', 'Alquiler de maquinaria y  equipo de construcción e ingeniería civil');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2939', 'N', '7730003', 'Alquiler de equipo de informática (computadoras, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2940', 'N', '7730004', 'Alquiler de equipo de oficina (máquinas de escribir, contabilidad, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2941', 'N', '7730005', 'Alquiler de maquinaria y equipo utilizados en las actividades de producción industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2942', 'N', '7730006', 'Alquiler de equipo de  radio y televisión');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2943', 'N', '7730007', 'Alquiler de equipo de comunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2944', 'N', '7730008', 'Alquiler de equipo y mobiliario de uso médico, quirúrgico, ortopédico, odontológico y hospitalario');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2945', 'N', '7730009', 'Alquiler de maquinaria, equipo y mobiliario de uso profesional y científico para medir, contar, etc. (Exceptuando el de uso profesional, médico, odontológico y de ingeniería civil)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2946', 'N', '7730010', 'Alquiler de maquinaria, equipo y mobiliario para el comercio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2947', 'N', '7730011', 'Alquiler de red  eléctrica ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2948', 'N', '7730012', 'Alquiler de rocola');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2949', 'N', '7730013', 'Alquiler de maquinas de video juego');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2950', 'N', '7030014', 'Alquiler de antenas para  telefonía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2951', 'N', '7030015', 'Alquiler de equipo audiovisuales (proyectores de películas, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2952', 'N', '774', 'ARRENDAMIENTO DE ACTIVOS NO FINANCIEROS INTANGIBLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2953', 'N', '7740', 'ARRENDAMIENTO DE ACTIVOS NO FINANCIEROS INTANGIBLES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2954', 'N', '77400', 'Arrendamiento de activos no financieros intangibles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2955', 'N', '7740001', 'Servicio de patentes, marcas, franquicias y otros alquileres de activos intangibles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2956', 'N', '78', 'ACTIVIDADES DE EMPLEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2957', 'N', '781', 'ACTIVIDADES DE LAS AGENCIAS DE EMPLEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2958', 'N', '7810', 'ACTIVIDADES DE LAS AGENCIAS DE EMPLEO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2959', 'N', '78100', 'Obtención y dotación de personal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2960', 'N', '7810001', 'Agencias de empleo (contratación de personal)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2961', 'N', '7810002', 'Subcontratación de mano de obra');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2962', 'N', '7810003', 'Agencias de contratación de personal doméstico de todo tipo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2963', 'N', '7810004', 'Servicios de dotación de modelos (agencia de modelajes)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2964', 'N', '782', 'ACTIVIDADES DE LAS AGENCIAS DE TRABAJO TEMPORAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2965', 'N', '7820', 'ACTIVIDADES DE LAS AGENCIAS DE TRABAJO TEMPORAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2966', 'N', '78200', 'Actividades de las agencias de trabajo temporal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2967', 'N', '783', 'OTROS SUMINISTROS DE RECURSOS HUMANOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2968', 'N', '7830', 'OTROS SUMINISTROS DE RECURSOS HUMANOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2969', 'N', '78300', 'Dotación de recursos humanos y gestión; gestión de las funciones de recursos humanos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2970', 'N', '7830001', 'Suministro de recursos humanos para diferentes areas (  (outsourcing)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2971', 'N', '79', 'ACTIVIDADES DE AGENCIAS DE VIAJES, OPERADORES TURÍSTICOS Y OTROS SERVICIOS DE RESERVA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2972', 'N', '791', 'ACTIVIDADES DE AGENCIAS DE VIAJES, OPERADORES TURÍSTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2973', 'N', '7911', 'ACTIVIDADES DE AGENCIAS DE VIAJES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2974', 'N', '79110', 'Actividades de agencias de viajes y organizadores de viajes ; actividades de asistencia a turistas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2975', 'N', '7911001', 'Agencia de viajes aéreos (venta de boletos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2976', 'N', '7911002', 'Asesoría y consultaría en turismo a viajeros ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2977', 'N', '7911003', 'Servicios de  turismo. Incluye información, planificación, organización  y realización de viajes turísticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2978', 'N', '7911004', 'Servicios de guías de turismo Prestados por agencias de turismo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2979', 'N', '7911005', 'Agencia de viajes terrestre  (venta de boletos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2980', 'N', '7912', 'ACTIVIDADES DE OPERADORES TURISTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2981', 'N', '79120', 'Actividades de los operadores turísticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2982', 'N', '7912001', 'Actividades de los operadores turísticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2983', 'N', '7990', 'OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2984', 'N', '7990', 'OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2985', 'N', '79900', 'Otros servicios de reservas y actividades relacionadas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2986', 'N', '7990001', 'Otros servicios de reservas y actividades relacionadas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2987', 'N', '80', 'ACTIVIDADES DE INVESTIGACIÓN Y SEGURIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2988', 'N', '801', 'SERVICIOS DE SEGURIDAD PRIVADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2989', 'N', '8010', 'SERVICIOS DE SEGURIDAD PRIVADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2990', 'N', '80100', 'Servicios de seguridad privados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2991', 'N', '8010001', 'Agencias de seguridad: vigilancia, patrullajes, guardaespaldas, detectives, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2992', 'N', '8010002', 'Agencias de Seguridad (protección de valores)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2993', 'N', '8010003', 'Servicios de comprobación de antecedentes penales (robos, desfalcos, etc.); detector de mentiras e identificación  dactilográfica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2994', 'N', '802', 'ACTIVIDADES DE SERVICIOS DE SISTEMAS DE SEGURIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2995', 'N', '8020', 'ACTIVIDADES DE SERVICIOS DE SISTEMAS DE SEGURIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2996', 'N', '80201', 'Actividades de servicios de sistemas de seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2997', 'N', '8020101', 'Instalación, reparación, reconstrucción y ajuste de dispositivos de seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2998', 'N', '8020102', 'Monitoreo de sistemas de seguridad (alarmas contra incendio, robo, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('2999', 'N', '80202', 'Actividades para la prestación de sistemas de seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3000', 'N', '8020201', 'Actividades para la prestación de sistemas de seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3001', 'N', '803', 'ACTIVIDADES DE INVESTIGACION');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3002', 'N', '8030', 'ACTIVIDADES DE INVESTIGACION');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3003', 'N', '80300', 'Actividades de investigación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3004', 'N', '8030001', 'Detectives privados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3005', 'N', '81', 'ACTIVIDADES DE SERVICIOS A EDIFICIOS Y PAISAJES (JARDINES, AREAS VERDES )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3006', 'N', '811', 'ACTIVIDADES COMBINADAS DE APOYO A INSTALACIONES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3007', 'N', '8110', 'ACTIVIDADES COMBINADAS DE APOYO A INSTALACIONES ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3008', 'N', '81100', 'Actividades combinadas de mantenimiento de edificios e instalaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3009', 'N', '8110001', 'Actividades de mantenimiento de instalaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3010', 'N', '812', 'ACTIVIDADES DE LIMPIEZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3011', 'N', '8121', 'LIMPIEZA GENERAL DE EDIFICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3012', 'N', '81210', 'Limpieza general de edificios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3013', 'N', '8121001', 'Limpieza de todo tipo de edificios y otros artículos u objetos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3014', 'N', '8121002', 'Actividades de Ordenanzas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3015', 'N', '8129', 'ACTIVIDADES COMBINADAS DE MANTENIMIENTO DE EDIFICIOS E INSTALACIONES NCP');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3016', 'N', '81290', 'Actividades combinadas de mantenimiento de edificios e instalaciones ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3017', 'N', '8129001', 'Limpieza y mantenimiento de piscinas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3018', 'N', '8129002', 'Limpieza de maquinaria industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3019', 'N', '8129003', 'Otras actividades de limpieza de edificios e industrial');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3020', 'N', '8129004', 'Actividades de exterminio y desinfección');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3021', 'N', '8129005', 'Limpieza de cisterna ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3022', 'N', '8129006', 'Limpieza de aviones ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3023', 'N', '813', 'ACTIVIDADES DE CUIDADO Y MANTENIMIENTO DE JARDINES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3024', 'N', '8130', 'ACTIVIDADES DE CUIDADO Y MANTENIMIENTO DE JARDINES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3025', 'N', '81300', 'Servicio de jardinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3026', 'N', '8130001', 'Plantación, cuidado y mantenimiento de jardines y engramados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3027', 'N', '8130002', 'Servicios de limpieza por medio de buceo ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3028', 'N', '82', 'SERVICIOS ADMINISTRATIVOS Y DE APOYO DE OFICINAS, EMPRESAS Y OTROS NEGOCIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3029', 'N', '821', 'SERVICIOS ADMINISTRATIVOS Y DE APOYO DE OFICINAS, EMPRESAS Y OTROS NEGOCIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3030', 'N', '8211', 'SERVICIOS DE ADMINISTRACIÓN DE OFICINAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3031', 'N', '82110', 'Servicios administrativos de oficinas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3032', 'N', '8211001', 'Servicios secretariales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3033', 'N', '8211002', 'Actividades empresariales administrativas (de la Empresa privada)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3034', 'N', '8211003', 'Actividades de redacción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3035', 'N', '8211004', 'Lectura reparación e instalación de medidores de energía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3036', 'N', '8211005', 'Lectura, reparación e instalación de medidores de agua');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3037', 'N', '8211006', 'Lectura y facturación de medidores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3038', 'N', '8211007', 'Servicio de Elaboracion de planilla');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3039', 'N', '8211008', 'Servicios de impresión  y ensobrado de estados  de cuenta ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3040', 'N', '8219', 'FOTOCOPIADO, PREPARACIÓN DE DOCUMENTOS Y OTRAS ACTIVIDADES ESPECIALIZADAS DE APOYO ADMINISTRATIVO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3041', 'N', '82190', 'Servicio de fotocopiado y similares, excepto en imprentas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3042', 'N', '8219001', 'Reproducción, impresión heliográfica, fotocopia y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3043', 'N', '8219002', 'Procesamiento de textos o edición');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3044', 'N', '8219003', 'Trascripción de documentos y otros servicios secretariales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3045', 'N', '822', 'ACTIVIDADES DE LAS CENTRALES DE LLAMADAS (CALL CENTER)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3046', 'N', '8220', 'ACTIVIDADES DE LAS CENTRALES DE LLAMADAS (CALL CENTER)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3047', 'N', '82200', 'Actividades de las centrales de llamadas (call center)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3048', 'N', '8220001', 'Centro de llamadas (Call Center)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3049', 'N', '823', 'ORGANIZACIÓN DE CONVENCIONES Y FERIAS DE NEGOCIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3050', 'N', '8230', 'ORGANIZACIÓN DE CONVENCIONES Y FERIAS DE NEGOCIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3051', 'N', '82300', 'Organización de convenciones y ferias de negocios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3052', 'N', '8230001', 'Organización de ferias de exposición y exhibición de muestras económicas y de otra naturaleza, reuniones culturales, congresos científicos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3053', 'N', '829', 'ACTIVIDADES DE SERVICIOS DE APOYO A EMPRESAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3054', 'N', '8291', 'ACTIVIDADES DE AGENCIAS DE COBRO Y OFICINAS DE CRÉDITO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3055', 'N', '82910', 'Actividades de agencias de cobro y oficinas de crédito');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3056', 'N', '8291001', 'Agencia de cobranza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3057', 'N', '8292', 'ACTIVIDADES DE EMBALAJE');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3058', 'N', '82921', 'Servicios de envase y empaque de productos alimenticios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3059', 'N', '8292101', 'Envasado de leche en polvo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3060', 'N', '8292102', 'Envasado de bebidas alcohólicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3061', 'N', '8292103', 'Envasado de productos vegetales procesados: aceitunas, alcaparras, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3062', 'N', '8292104', 'Envasado de miel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3063', 'N', '8292105', 'Empacado de mariscos frescos tratados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3064', 'N', '8292106', 'Envasado de bebidas refrescantes y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3065', 'N', '8292107', 'Envasado de verduras, legumbres, hortalizas, tubérculos frescos (no procesados)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3066', 'N', '8292108', 'Envasado de frutas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3067', 'N', '8292109', 'Envasado  de productos lácteos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3068', 'N', '8292110', 'Empaque de especies sal y granos básicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3069', 'N', '8292199', 'Envasado de otros productos alimenticios ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3070', 'N', '82922', 'Servicios de envase y empaque de productos medicinales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3071', 'N', '8292201', 'Envasado de productos farmacéuticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3072', 'N', '82929', 'Servicio de envase y empaque ncp');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3073', 'N', '8292901', 'Envasado de fertilizantes e insecticidas, fungicidas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3074', 'N', '8292902', 'Empaque de productos de consumo humano ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3075', 'N', '8299', 'OTRAS ACTIVIDADES DE SERVICIOS DE APOYO A LAS EMPRESAS N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3076', 'N', '82990', 'Actividades de apoyo empresarial n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3077', 'N', '8299001', 'Actividades de intermediación en la industria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3078', 'N', '8299002', 'Organización de eventos  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3079', 'N', '8299003', 'Actividades de intermediación en los servicios ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3080', 'O', 'O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3081', 'O', '84', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3082', 'O', '841', 'ADMINISTRACIÓN DEL ESTADO Y APLICACIÓN DE LA POLÍTICA ECONÓMICA Y SOCIAL DE LA COMUNIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3083', 'O', '8411', 'ACTIVIDADES DE LA ADMINISTRACIÓN PÚBLICA EN GENERAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3084', 'O', '84110', 'Actividades de la administración pública en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3085', 'O', '8411001', 'Actividades de administración pública (Ministerio de Hacienda, Corte de Cuentas,  etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3086', 'O', '8412', 'REGULACIÓN DE LAS ACTIVIDADES DE ORGANISMOS QUE PRESTAN SERVICIOS SANITARIOS, EDUCATIVOS, CULTURALES Y OTROS SERVICIOS SOCIALES, EXCEPTO SEGURIDAD SOCIAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3087', 'O', '84120', 'Regulación de las actividades de prestación de servicios sanitarios, educativos, culturales y otros servicios sociales, excepto seguridad social');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3088', 'O', '8412001', 'Administración y regulación de las actividades de los organismos que prestan servicios educativos  y culturales (Ministerio de  Educación)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3089', 'O', '8412002', 'Administración y regulación de las actividades de los organismos que prestan servicios sanitarios (Ministerio de Salud)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3090', 'O', '8412003', 'Administración y regulación de las actividades de los organismos que prestan otros servicios sociales, excepto servicios de seguridad social');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3091', 'O', '8413', 'REGULACIÓN Y FACILITACIÓN DE LA ACTIVIDAD ECONÓMICA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3092', 'O', '84130', 'Regulación y facilitación de la actividad económica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3093', 'O', '8413001', 'Servicios de administración, regulación, facilitación de las actividades económicas, comerciales y laborales (Ministerio de Economía, Ministerio de Trabajo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3094', 'O', '8413002', 'Servicio de administración, regulación y facilitación de las actividades del sector agropecuario forestal, pesquero y otros similares (Ministerio de Agricultura)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3095', 'O', '8413003', 'Servicios administrativos de mantenimiento y fomento de las actividades relacionadas con el turismo.(Ministerio de Turismo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3096', 'O', '8413004', 'Servicios administrativos relacionados con los combustibles y la energía');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3097', 'O', '8413005', 'Regulación y administración de actividades relacionadas con el transporte, las comunicaciones y otras actividades afines');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3098', 'O', '8413006', 'Regulación y administración de actividades relacionadas con los recursos minerales, la industria manufacturera y la construcción');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3099', 'O', '8413007', 'Actividades de administración y funcionamiento de instituciones de servicios auxiliares para la administración pública en general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3100', 'O', '842', 'PRESTACIÓN DE SERVICIOS A LA COMUNIDAD EN GENERAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3101', 'O', '8421', 'RELACIONES EXTERIORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3102', 'O', '84210', 'Relaciones exteriores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3103', 'O', '8421001', 'Actividades de administración y funcionamiento del Ministerio de Relaciones Exteriores y de las misiones diplomáticas y consulares en el extranjero y ante organismos internacionales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3104', 'O', '8422', 'ACTIVIDADES DE DEFENSA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3105', 'O', '84220', 'Actividades de defensa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3106', 'O', '8422001', 'Actividades de administración y funcionamiento  de los organismos del Ministerio de Defensa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3107', 'O', '8423', 'ACTIVIDADES DE MANTENIMIENTO DEL ORDEN PÚBLICO Y DE SEGURIDAD');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3108', 'O', '84230', 'Actividades de mantenimiento del orden público y de seguridad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3109', 'O', '8423001', 'Actividades de mantenimiento del orden público y seguridad  (P.N.C.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3110', 'O', '8423002', 'Actividades contra incendios (Cuerpo de Bomberos)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3111', 'O', '8423003', 'Servicios correccionales (encarcelamiento y readaptación)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3112', 'O', '8423004', 'Actividades de asistencia en desastres, inundaciones, accidentes, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3113', 'O', '843', 'ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3114', 'O', '8430', 'ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3115', 'O', '84300', 'Actividades de planes de seguridad social de afiliación obligatoria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3116', 'O', '8430001', 'Seguros de salud de afiliación obligatoria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3117', 'P', 'P', 'ENSEÑANZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3118', 'P', '85', 'ENSEÑANZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3119', 'P', '851', 'ENSEÑANZA PREESCOLAR Y PRIMARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3120', 'P', '8510', 'ENSEÑANZA PREESCOLAR Y PRIMARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3121', 'P', '85101', 'Guardería educativa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3122', 'P', '8510101', 'Guardería educativa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3123', 'P', '85102', 'Enseñanza preescolar o parvularia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3124', 'P', '8510201', 'Enseñanza preescolar pública (jardines infantiles)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3125', 'P', '8510202', 'Enseñanza preescolar privada (jardines infantiles)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3126', 'P', '85103', 'Enseñanza primaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3127', 'P', '8510301', 'Educación primaria pública (de 1° a 6° grado)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3128', 'P', '8510302', 'Educación primaria privada (de 1° a 6° grado)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3129', 'P', '8510305', 'Educación primaria y básica especial para niños ciegos, sordomudos  y otros ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3130', 'P', '85104', 'Servicio de educación preescolar y primaria integrada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3131', 'P', '8510401', 'Servicio de educación preescolar y primaria integrada pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3132', 'P', '8510402', 'Servicio de educación preescolar y primaria integrada privada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3133', 'P', '852', 'ENSEÑANZA SECUNDARIA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3134', 'P', '8521', 'ENSEÑANZA SECUNDARIA DE FORMACIÓN GENERAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3135', 'P', '85211', 'Enseñanza secundaria tercer ciclo (7°, 8° y 9° )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3136', 'P', '8521101', 'Enseñanza secundaria publica tercer ciclo (7°, 8° y 9° )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3137', 'P', '8521102', 'Enseñanza secundaria privada tercer ciclo (7°, 8° y 9° )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3138', 'P', '85212', 'Enseñanza secundaria de formación general bachillarato');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3139', 'P', '8521201', 'Educación secundaria pública de bachillerato general  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3140', 'P', '8521202', 'Educación secundaria privada  de bachillerato general  ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3141', 'P', '8522', 'ENSEÑANZA SECUNDARIA DE FORMACIÓN TÉCNICA Y PROFESIONAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3142', 'P', '85221', 'Enseñanza secundaria de formación técnica y profesional');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3143', 'P', '8522101', 'Enseñanza secundaria pública, de formación técnica y profesional  (bachillerato vocacional )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3144', 'P', '8522102', 'Enseñanza secundaria privada, de formación técnica y profesional  (bachillerato vocacional )');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3145', 'P', '8522103', 'Escuela de cosmetología y peluquería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3146', 'P', '8522104', 'Academia de corte y confección');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3147', 'P', '85222', 'Enseñanza secundaria de formación técnica y profesional integrada con enseñanza primaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3148', 'P', '8522201', 'Enseñanza secundaria de formación técnica y profesional integrada con enseñanza primaria pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3149', 'P', '8522202', 'Enseñanza secundaria de formación técnica y profesional integrada con enseñanza primaria privada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3150', 'P', '853', 'ENSEÑANZA SUPERIOR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3151', 'P', '8530', 'ENSEÑANZA SUPERIOR');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3152', 'P', '85301', 'Enseñanza superior universitaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3153', 'P', '8530101', 'Enseñanza superior universitaria (pública)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3154', 'P', '8530102', 'Enseñanza superior universitaria (privada)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3155', 'P', '85302', 'Enseñanza superior no universitaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3156', 'P', '8530201', 'Enseñanza técnica superior no universitaria (pública)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3157', 'P', '8530202', 'Enseñanza técnica superior no universitaria (privada)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3158', 'P', '85303', 'Enseñanza superior integrada a educación secundaria y/o primaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3159', 'P', '8530301', 'Enseñanza superior integrada a educación secundaria y/o primaria, pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3160', 'P', '8530302', 'Enseñanza superior integrada a educación secundaria y/o primaria, privada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3161', 'P', '854', 'OTROS TIPOS DE ENSEÑANZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3162', 'P', '8541', 'ENSEÑANZA DEPORTIVA Y RECREATIVA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3163', 'P', '85410', 'Educación deportiva y recreativa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3164', 'P', '8541001', 'Escuela de deporte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3165', 'P', '8542', 'ENSEÑANZA CULTURAL');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3166', 'P', '85420', 'Educación cultural');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3167', 'P', '8542001', 'Enseñanza de instrumentos musicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3168', 'P', '8542002', 'Academia de enseñanza de dibujo, pintura y otras actividades artísticas similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3169', 'P', '8542003', 'Escuela de danza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3170', 'P', '8542004', 'Enseñanza profesional en arte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3171', 'P', '8549', 'OTROS TIPOS DE ENSEÑANZA N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3172', 'P', '85490', 'Otros tipos de enseñanza n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3173', 'P', '8549001', 'Escuela de manejo de vehículos automotores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3174', 'P', '8549002', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3175', 'P', '8549003', 'Centros de capacitación en áreas diversas vocacionales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3176', 'P', '8549004', 'Escuela de aviación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3177', 'P', '8549005', 'Academia de modelaje');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3178', 'P', '8549006', 'Servicios de profesores particulares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3179', 'P', '8549007', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3180', 'P', '8549008', 'Academia de enseñanza de idiomas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3181', 'P', '8549009', 'Academias o centros de computación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3182', 'P', '8549010', 'Seminario  y capacitaciones a empresas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3183', 'P', '855', 'ACTIVIDADES DE APOYO A LA ENSEÑANZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3184', 'P', '8550', 'ACTIVIDADES DE APOYO A LA ENSEÑANZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3185', 'P', '85500', 'Servicios de apoyo a la enseñanza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3186', 'P', '8550001', 'Asesoría y consultoría educativa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3187', 'Q', 'Q', 'SERVICIOS SOCIALES Y RELACIONADO CON LA SALUD HUMANA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3188', 'Q', '86', 'ACTIVIDADES RELACIONADAS CON LA SALUD HUMANA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3189', 'Q', '861', 'ACTIVIDADES DE HOSPITALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3190', 'Q', '8610', 'ACTIVIDADES DE HOSPITALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3191', 'Q', '86100', 'Actividades de hospitales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3192', 'Q', '8610001', 'Hospitales públicos generales, especializados y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3193', 'Q', '8610002', 'Hospitales públicos de maternidad');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3194', 'Q', '8610003', 'Hospitales públicos para niños');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3195', 'Q', '8610004', 'Hospitales  privados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3196', 'Q', '8610005', 'Hospitales  privados de ginecología');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3197', 'Q', '8610006', 'Hospitales  privados de pediatría');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3198', 'Q', '862', 'ACTIVIDADES DE MÉDICOS Y ODONTÓLOGOS.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3199', 'Q', '8620', 'ACTIVIDADES DE MÉDICOS Y ODONTÓLOGOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3200', 'Q', '86201', 'Clínicas médicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3201', 'Q', '8620101', 'Clínicas de medicina general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3202', 'Q', '8620102', 'Clínicas médicas especializadas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3203', 'Q', '8620103', 'Clínicas médicas ginecológicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3204', 'Q', '8620104', 'Clínicas médicas pediátricas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3205', 'Q', '8620105', 'Clínicas de cardiólogos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3206', 'Q', '8620106', 'Clínicas de cirujanos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3207', 'Q', '8620107', 'Clínica de ortopedia y traumatología ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3208', 'Q', '86202', 'Servicios de Odontología');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3209', 'Q', '8620201', 'Clínicas de odontología general');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3210', 'Q', '8620202', 'Clínicas de odontología especializada');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3211', 'Q', '8620203', 'Clínicas de cirujanos dentales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3212', 'Q', '8620204', 'Ortodoncistas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3213', 'Q', '869', 'OTRAS ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3214', 'Q', '8690', 'OTRAS ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3215', 'Q', '86901', 'Servicios de análisis y estudios de diagnóstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3216', 'Q', '8690101', 'Laboratorio clínico de análisis y diagnóstico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3217', 'Q', '8690102', 'Laboratorios de rayos X y de diagnóstico por imágenes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3218', 'Q', '8690103', 'Laboratorio de banco de sangre privado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3219', 'Q', '86902', 'Servicio de fisioterapia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3220', 'Q', '8690201', 'Servicios de fisioterapia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3221', 'Q', '8690202', 'Servicio de ambulancias y emergencias médicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3222', 'Q', '8690203', 'Servicios de ambulancia, incluyendo auxilio de paramédico y enfermero (a)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3223', 'Q', '86909', 'Servicio relacionados con la salud n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3224', 'Q', '8690901', 'Parteras por cuenta propia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3225', 'Q', '8690902', 'Enfermeras por cuenta propia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3226', 'Q', '8690903', 'Clínicas  naturópatas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3227', 'Q', '8690904', 'Clínicas psicológicas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3228', 'Q', '8690905', 'Servicios de asistencia medica domiciliaria');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3229', 'Q', '8690906', 'Servicios de terapias de lenguaje ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3230', 'Q', '87', 'INSTITUCIONES RESIDENCIALES DE CUIDADO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3231', 'Q', '871', 'INSTALACIONES DE RESIDENCIAS DE CUIDADO DE ENFERMOS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3232', 'Q', '8710', 'Instalaciones de residencias de cuidado de enfermos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3233', 'Q', '87100', 'Servios de enfermería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3234', 'Q', '8710001', 'Cuidados de enfermería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3235', 'Q', '872', 'INSTITUCIONES DEDICADAS AL TRATAMIENTO DEL RETRASO MENTAL, PROBLEMAS DE SALUD MENTAL Y EL USO INDEBIDO DE SUSTANCIAS NOCIVAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3236', 'Q', '8720', 'INSTITUCIONES DEDICADAS AL TRATAMIENTO DEL RETRASO MENTAL, PROBLEMAS DE SALUD MENTAL Y EL USO INDEBIDO DE SUSTANCIAS NOCIVAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3237', 'Q', '87200', 'Instituciones dedicadas al tratamiento del retraso mental, problemas de salud mental y el uso indebido de sustancias nocivas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3238', 'Q', '8720001', 'Asistencia a personas con retraso mental y/o problemas de salud mental');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3239', 'Q', '8720002', 'Centros de rehabilitación para personas adictas a estupefacientes, alcohol y otras drogas (sin tratamiento médico)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3240', 'Q', '873', 'INSTITUCIONES AL CUIDADO DE ANCIANOS Y DISCAPACITADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3241', 'Q', '8730', 'INSTITUCIONES AL CUIDADO DE ANCIANOS Y DISCAPACITADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3242', 'Q', '87300', 'Instituciones dedicadas al cuidado de ancianos y discapacitados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3243', 'Q', '8730001', 'Asistencia para ancianos (asilos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3244', 'Q', '8730002', 'Asistencia para discapacitados físicos (sordos, mudos, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3245', 'Q', '879', 'OTRAS ACTIVIDADES DE ATENCION EN INSTITUCIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3246', 'Q', '8790', 'OTRAS ACTIVIDADES DE ATENCION EN INSTITUCIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3247', 'Q', '87900', 'Servicios de asistencia a niños y jóvenes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3248', 'Q', '8790001', 'Asistencia  para  niños: en orfanatos, hogares y albergues infantiles y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3249', 'Q', '8790002', 'Asistencia en centros correccionales para jóvenes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3250', 'Q', '88', 'SERVICIOS SOCIALES SIN ALOJAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3251', 'Q', '881', 'SERVICIOS SOCIALES SIN ALOJAMIENTO PARA ADULTO MAYOR Y DISCAPACITADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3252', 'Q', '8810', 'SERVICIOS SOCIALES SIN ALOJAMIENTO PARA ADULTO MAYOR Y DISCAPACITADOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3253', 'Q', '88100', 'Servicios sociales sin alojamiento para ancianos y discapacitados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3254', 'Q', '8810001', 'Servicios sociales sin alojamiento para los ancianos y los discapacitados');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3255', 'Q', '889', 'OTRAS ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3256', 'Q', '8890', 'OTRAS ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3257', 'Q', '88900', 'Otras Actividades de asistencia social sin alojamiento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3258', 'Q', '8890001', 'Guarderías infantiles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3259', 'Q', '8890002', 'Actividades realizadas por dependencias y organizaciones de socorro a victimas de desastres, refugiados, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3260', 'R', 'R', 'ARTE, ESPARCIMIENTO Y OCIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3261', 'R', '90', 'ACTIVIDADES CREATIVAS ARTÍSTICAS Y DE ESPARCIMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3262', 'R', '900', 'ACTIVIDADES CREATIVAS ARTÍSTICAS Y DE ESPARCIMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3263', 'R', '9000', 'ACTIVIDADES CREATIVAS ARTÍSTICAS Y DE ESPARCIMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3264', 'R', '90000', 'Actividades creativas artísticas y de esparcimiento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3265', 'R', '9000001', 'Producción de obras de teatro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3266', 'R', '9000002', 'Presentación de obras de teatro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3267', 'R', '9000003', 'Actividades de autores y compositores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3268', 'R', '9000004', 'Pintores y escultores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3269', 'R', '9000005', 'Orquestas para bailes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3270', 'R', '9000006', 'Orquesta Sinfónica');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3271', 'R', '9000007', 'Mariachis y tríos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3272', 'R', '9000008', 'Maestros de ceremonia, locutores y otras actividades similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3273', 'R', '91', 'BIBLIOTECAS, ARCHIVOS, MUSEOS Y OTRAS ACTIVIDADES CULTURALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3274', 'R', '910', 'BIBLIOTECAS, ARCHIVOS, MUSEOS Y OTRAS ACTIVIDADES CULTURALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3275', 'R', '9101', 'ACTIVIDADES DE BIBLIOTECAS Y ARCHIVOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3276', 'R', '91010', 'Actividades de bibliotecas y archivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3277', 'R', '9101001', 'Servicios de bibliotecas y archivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3278', 'R', '9102', 'ACTIVIDADES DE MUSEOS Y PRESERVACIÓN DE LUGARES Y EDIFICIOS HISTÓRICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3279', 'R', '91020', 'Actividades de museos y preservación de lugares y edificios históricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3280', 'R', '9102001', 'Museos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3281', 'R', '9102002', 'Galerías de arte');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3282', 'R', '9102003', 'Sitios arqueológicos de exhibición pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3283', 'R', '9102004', 'Preservación de lugares y edificios históricos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3284', 'R', '9103', 'ACTIVIDADES DE JARDINES BOTÁNICOS, ZOOLÓGICOS Y DE PARQUES NATURALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3285', 'R', '91030', 'Actividades de jardines botánicos, zoológicos y de parques naturales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3286', 'R', '9103001', 'Jardines botánicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3287', 'R', '9103002', 'Zoológicos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3288', 'R', '9103003', 'Reservas naturales, incluyendo la conservación de la flora y la fauna (Parques Nacionales)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3289', 'R', '92', 'ACTIVIDADES DE JUEGOS Y APUESTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3290', 'R', '920', 'ACTIVIDADES DE JUEGOS Y APUESTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3291', 'R', '9200', 'ACTIVIDADES DE JUEGOS Y APUESTAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3292', 'R', '92000', 'Actividades de juegos y apuestas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3293', 'R', '9200001', 'Juegos de azar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3294', 'R', '9200002', 'Apuestas; incluye corredores de apuestas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3295', 'R', '9200003', 'Centros y salas de diversión y entretenimiento con máquinas, aparatos y equipos de juegos  electrónicos  de azar  accionados con monedas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3296', 'R', '9200004', 'Salas de billar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3297', 'R', '9200005', 'Clubes y casinos recreativos y sociales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3298', 'R', '9200006', 'Venta de billetes de lotería (agencia)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3299', 'R', '93', 'ACTIVIDADES DEPORTIVAS, DE DIVERSIÓN Y ESPARCIMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3300', 'R', '931', 'ACTIVIDADES DEPORTIVAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3301', 'R', '9311', 'GESTIÓN DE INSTALACIONES DEPORTIVAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3302', 'R', '93110', 'Gestión de instalaciones deportivas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3303', 'R', '9311001', 'Explotación de  estadios y canchas de football');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3304', 'R', '9311002', 'Explotación de instalaciones deportivas de football  rápido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3305', 'R', '9311003', 'Explotación de gimnasios deportivos multiusos y otras instalaciones deportivas bajo techo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3306', 'R', '9311004', 'Instalaciones deportivas al aire libre y bajo techo (polideportivo)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3307', 'R', '9311005', 'Canchas de golf');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3308', 'R', '9311006', 'Pistas deportivas para autos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3309', 'R', '9311007', 'Pistas deportivas para motos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3310', 'R', '9311008', 'Hipódromo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3311', 'R', '9312', 'ACTIVIDADES DE CLUBES DEPORTIVOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3312', 'R', '93120', 'Actividades de clubes deportivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3313', 'R', '9312001', 'Club  y federación de deporte público');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3314', 'R', '9312002', 'Club y federación de fútbol privado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3315', 'R', '9312003', 'Club y federación de baloncesto y otras');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3316', 'R', '9312004', 'Actividades deportivas de: árbitros, entrenadores, deportistas, profesores, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3317', 'R', '9312005', 'Polígono de tiro');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3318', 'R', '9312006', 'Otros clubes deportivos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3319', 'R', '9319', 'OTRAS ACTIVIDADES DEPORTIVAS ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3320', 'R', '93190', 'Otras Actividades deportivas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3321', 'R', '9319001', 'Actividades deportivas de: jueces, árbitros, atletas, deportistas, etc. por cuenta propia');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3322', 'R', '932', 'OTRAS ACTIVIDADES DE DIVERSION Y ESPARCIMIENTO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3323', 'R', '9321', 'ACTIVIDADES DE PARQUES DE ATRACCIONES Y PARQUES TEMÁTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3324', 'R', '93210', 'Actividades de parques de atracciones y parques temáticos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3325', 'R', '9321001', 'Juegos mecánicos y eléctricos que se instalan en ferias ambulantes o en fiestas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3326', 'R', '9321002', 'Actividades de entretenimiento en los parques ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3327', 'R', '9329', 'OTRAS ACTIVIDADES DE DIVERSIÓN Y ESPARCIMIENTO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3328', 'R', '93291', 'Discotecas y salas de baile');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3329', 'R', '9329101', 'Discotecas y salas de baile');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3330', 'R', '93299', 'Actividades de esparcimiento n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3331', 'R', '9329901', 'Organización y presentación de espectáculos recreativos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3332', 'R', '9329902', 'Pesca de recreo y entretenimiento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3333', 'R', '9329903', 'Espectáculos de circo, títeres y otros similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3334', 'R', '9329904', 'Salas de té y recepciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3335', 'R', '9329905', 'Parques de recreo, diversión y entretenimiento');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3336', 'R', '9329906', 'Sala de bolerama');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3337', 'R', '9329907', 'Club nocturno (barra show)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3338', 'R', '9329908', 'Club de playa ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3339', 'R', '9329909', 'Suprimido');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3340', 'R', '9329910', 'Alquiler de cabañas de playa, guardarropa, sillas, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3341', 'R', '9329911', 'Centros y salas de diversión,  entretenimiento con máquinas, aparatos, equipos de juego y otros para niños y adultos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3342', 'R', '9329912', 'Servicios de parqueo  de embarcaciones deportivas ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3343', 'S', 'S', 'OTRAS ACTIVIDADES DE SERVICIOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3344', 'S', '94', 'ACTIVIDADES DE ASOCIACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3345', 'S', '941', 'ACTIVIDADES DE ASOCIACIONES EMPRESARIALES, PROFESIONALES Y DE EMPLEADORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3346', 'S', '9411', 'ACTIVIDADES DE ASOCIACIONES EMPRESARIALES Y DE EMPLEADORES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3347', 'S', '94110', 'Actividades de organizaciones empresariales y de empleadores');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3348', 'S', '9411001', 'Asociaciones empresariales y comerciales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3349', 'S', '9411002', 'Federación de Asociaciones');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3350', 'S', '9412', 'ACTIVIDADES DE ORGANIZACIONES PROFESIONALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3351', 'S', '94120', 'Actividades de organizaciones profesionales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3352', 'S', '9412001', 'Asociaciones profesionales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3353', 'S', '942', 'ACTIVIDADES DE SINDICATOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3354', 'S', '9420', 'ACTIVIDADES DE SINDICATOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3355', 'S', '94200', 'Actividades de sindicatos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3356', 'S', '9420001', 'Asociaciones de sindicatos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3357', 'S', '949', 'ACTIVIDADES DE OTRAS ASOCIACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3358', 'S', '9491', 'ACTIVIDADES DE ORGANIZACIONES RELIGIOSAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3359', 'S', '94910', 'Actividades de organizaciones religiosas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3360', 'S', '9491001', 'Organizaciones religiosas (incluye solamente actividades de monasterios, ceremonias religiosas y atención a feligreses)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3361', 'S', '9492', 'ACTIVIDADES DE ORGANIZACIONES POLÍTICAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3362', 'S', '94920', 'Actividades de organizaciones políticas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3363', 'S', '9492001', 'Organizaciones políticas (asociaciones)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3364', 'S', '9499', 'ACTIVIDADES DE ASOCIACIONES N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3365', 'S', '94990', 'Actividades de asociaciones n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3366', 'S', '9499001', 'Asociaciones de apoyo y servicios comunitarios y sociales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3367', 'S', '9499002', 'Asociaciones de jóvenes (scouts, estudiantes y otros)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3368', 'S', '9499003', 'Asociaciones de protección y mejoramiento de determinados grupos  étnicos, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3369', 'S', '9499004', 'Asociaciones (cristianas o no) para facilitar el contacto con otras personas con fines similares');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3370', 'S', '9999005', 'Asociaciones o clubes culturales de arte, música y poesía, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3371', 'S', '95', 'REPARACIÓN DE COMPUTADORAS Y DE EFECTOS PERSONALES  Y ENSERES DOMÉSTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3372', 'S', '951', 'REPARACIÓN DE COMPUTADORAS Y EQUIPO DE COMUNICACIONES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3373', 'S', '9511', 'REPARACIÓN DE COMPUTADORAS Y EQUIPO PERIFÉRICO ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3374', 'S', '95110', 'Reparación de computadoras y equipo periférico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3375', 'S', '9511001', 'Mantenimiento y reparación de maquinaria y equipo de informática: computadoras, impresoras y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3376', 'S', '9511002', 'Mantenimiento y reparación de terminales de computadoras y similares (cajeros automáticos, puntos de venta, etc.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3377', 'S', '9512', 'REPARACIÓN DE EQUIPO DE COMUNICACIONES (ESTO INCLUYE: EQUIPO DE VIDEO COMERCIAL Y DE TV.)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3378', 'S', '95120', 'Reparación de equipo de comunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3379', 'S', '9512001', 'Reparación de equipo de telefonía y otros aparatos de comunicación');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3380', 'S', '952', 'REPARACIÓN DE EFECTOS PERSONALES Y ENSERES DOMESTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3381', 'S', '9521', 'REPARACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3382', 'S', '95210', 'Reparación de aparatos electrónicos de consumo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3383', 'S', '9521001', 'Reparación de televisores, VHS, aparatos de sonido, radio grabadoras, y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3384', 'S', '9522', 'REPARACIÓN DE APARATOS DE USO DOMÉSTICO Y EQUIPO DOMESTICO Y DE JARDINERÍA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3385', 'S', '95220', 'Reparación de aparatos doméstico y equipo de hogar y jardín');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3386', 'S', '9522001', 'Reparación de refrigeradoras, lavadoras, secadoras, cocinas y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3387', 'S', '9522002', 'Reparación de licuadoras, planchas, ventiladores y otros electrodomésticos y aparatos de uso personal');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3388', 'S', '9523', 'REPARACIÓN DE CALZADO Y ARTÍCULOS DE CUERO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3389', 'S', '95230', 'Reparación de calzado y artículos de cuero');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3390', 'S', '9523001', 'Reparación de calzado de toda clase');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3391', 'S', '9523002', 'Reparación de artículos de cuero natural y sintético');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3392', 'S', '9524', 'REPARACIÓN DE MUEBLES Y ACCESORIOS DOMESTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3393', 'S', '95240', 'Reparación de muebles y accesorios para el hogar');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3394', 'S', '9524001', 'Reparación de muebles (tapicería)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3395', 'S', '9529', 'REPARACIÓN DE OTROS EFECTOS PERSONALES Y ENSERES DOMÉSTICOS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3396', 'S', '95291', 'Reparación de Instrumentos musicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3397', 'S', '9529101', 'Reparación y afinamiento de pianos y órganos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3398', 'S', '9529102', 'Reparación de instrumentos musicales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3399', 'S', '95292 ', 'Servicios de cerrajería y copiado de llaves');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3400', 'S', '9529201', 'Cerrajería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3401', 'S', '95293', 'Reparación de joyas y relojes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3402', 'S', '9529301', 'Reparación de joyas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3403', 'S', '9529302', 'Reparación de relojes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3404', 'S', '9529303', 'Reparación de lentes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3405', 'S', '95294', 'Reparación de bicicletas, sillas de ruedas y rodados n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3406', 'S', '9529401', 'Reparación de bicicletas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3407', 'S', '9529402', 'Reparación de sillas de ruedas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3408', 'S', '95299', 'Reparaciones de enseres personales n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3409', 'S', '9529901', 'Reparación de juguetes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3410', 'S', '9529902', 'Reparación  de paraguas, sombrillas, bastones y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3411', 'S', '9529903', 'Reparación de cámaras fotográficas, cinematográficas, gemelos y otros equipos fotográficos');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3412', 'S', '9529904', 'Reparación y afiladura de herramientas y utensilios cortantes');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3413', 'S', '9529999', 'Reparación de otros enseres  domésticos  no eléctricos ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3414', 'S', '96', 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3415', 'S', '960', 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3416', 'S', '9601', 'LAVADO Y LIMPIEZA DE PRENDAS DE TELA Y DE PIEL, INCLUIDA LA LIMPIEZA EN SECO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3417', 'S', '96010', 'Lavado y limpieza de prendas de tela y de piel, incluso la limpieza en seco');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3418', 'S', '9601001', 'Limpieza y planchado en seco de prendas de vestir y otros artículos de tela incluyendo la recolección y distribución de ropa');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3419', 'S', '9601002', 'Lavado y secado de prendas de vestir y otros artículos de tela');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3420', 'S', '9601003', 'Lavado y limpieza de cortinas, alfombras , tapices y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3421', 'S', '9601004', 'Agencia de Dry Cleaning');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3422', 'S', '9602', 'PELUQUERÍA Y OTROS TRATAMIENTOS DE BELLEZA');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3423', 'S', '96020', 'Peluquería y otros tratamientos de belleza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3424', 'S', '9602001', 'Tratamientos de belleza (salones)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3425', 'S', '9602002', 'Peluquerías y barberías');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3426', 'S', '9603', 'POMPAS FÚNEBRES Y ACTIVIDADES CONEXAS');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3427', 'S', '96030', 'Pompas fúnebres y actividades conexas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3428', 'S', '9603001', 'Servicios fúnebres y actividades conexas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3429', 'S', '9603002', 'Cementerios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3430', 'S', '9609', 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES N.C.P.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3431', 'S', '96091', 'Servicios de sauna y otros servicios para la estética corporal n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3432', 'S', '9609101', 'Gimnasios para la reducción de peso, desarrollo y fortalecimiento del cuerpo');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3433', 'S', '9609102', 'Clínicas de reducción de peso, masajes, lozanía física y estética');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3434', 'S', '9609103', 'Actividades de servicio personal realizadas por máquinas que proporcionan datos de valor y  medida de: estatura,  peso,  tensión, etc.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3435', 'S', '9609104', 'Tatuajes de todo tipo y perforaciones en la piel');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3436', 'S', '96092', 'Servicios n.c.p.');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3437', 'S', '9609201', 'Actividades de astrología, espiritismo, adivinos y otros');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3438', 'S', '9609202', 'Limpieza y lustre de calzado');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3439', 'S', '9609203', 'Alquiler de servicios sanitarios fijos o móviles');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3440', 'S', '9609204', 'Casas de cita (prostitución)');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3441', 'S', '9609205', 'Servicio de personas en la vía pública');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3442', 'S', '9609206', 'Adiestramiento de perros y otros animales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3443', 'S', '9609207', 'Emisores de matriculas de automóviles y licencias para conductores ');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3444', 'S', '9609208', 'Sala de estética y otros servicios para mascotas');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3445', 'T', 'T', 'ACTIVIDADES DE LOS HOGARES COMO EMPLEADORES, ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3446', 'T', '97', 'ACTIVIDAD DE LOS HOGARES EN CALIDAD DE EMPLEADORES DE PERSONAL DOMESTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3447', 'T', '970', 'ACTIVIDAD DE LOS HOGARES COMO EMPLEADORES DE PERSONAL DOMESTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3448', 'T', '9700', 'ACTIVIDAD DE LOS HOGARES COMO EMPLEADORES DE PERSONAL DOMESTICO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3449', 'T', '97000', 'Actividad de los hogares en calidad de empleadores de personal domestico');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3450', 'T', '9700001', 'Servicio de jardinería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3451', 'T', '9700002', 'Servicio de lavandería');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3452', 'T', '9700003', 'Servicio de cuidado de niños en domicilios');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3453', 'T', '9700004', 'Servicio de limpieza');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3454', 'T', '98', 'ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3455', 'T', '981', 'ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3456', 'T', '9810', 'ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3457', 'T', '98100', 'Actividades indiferenciadas de producción de bienes de los hogares privados para uso propio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3458', 'T', '9810001', 'Actividades indiferenciadas de producción de bienes de los hogares privados para uso propio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3459', 'T', '982', 'ACTIVIDADES INDIFERENCIADA DE PRODUCCIÓN DE SERVICIOS DE LOS HOGARES PARA USO PROPIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3460', 'T', '9820', 'ACTIVIDADES INDIFERENCIADA DE PRODUCCIÓN DE SERVICIOS DE LOS HOGARES PARA USO PROPIO');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3461', 'T', '98200', 'Actividades indiferenciada de producción de servicios de los hogares privados para uso propio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3462', 'T', '9820001', 'Actividades indiferenciada de producción de servicios de los hogares privados para uso propio');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3463', 'U', 'U', 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3464', 'U', '99', 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3465', 'U', '990', 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3466', 'U', '9900', 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3467', 'U', '99000', 'Actividades de organizaciones  y órganos extraterritoriales');
INSERT INTO `sac_clasificacion_institucion` VALUES ('3468', 'U', '9900001', 'Organizaciones internacionales y órganos extraterritoriales');

-- ----------------------------
-- Table structure for sac_control_visita
-- ----------------------------
DROP TABLE IF EXISTS `sac_control_visita`;
CREATE TABLE `sac_control_visita` (
  `id_programacion_visita` int(11) NOT NULL,
  `id_tematica` int(11) NOT NULL,
  `fecha_capacitacion` date NOT NULL,
  `facilitador` varchar(255) NOT NULL,
  PRIMARY KEY (`id_programacion_visita`,`id_tematica`),
  KEY `fk_control_visita_tematica` (`id_tematica`),
  CONSTRAINT `fk_control_visita_programacion_visita` FOREIGN KEY (`id_programacion_visita`) REFERENCES `sac_programacion_visita` (`id_programacion_visita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_control_visita_tematica` FOREIGN KEY (`id_tematica`) REFERENCES `sac_tematica` (`id_tematica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_control_visita
-- ----------------------------

-- ----------------------------
-- Table structure for sac_empleado_institucion
-- ----------------------------
DROP TABLE IF EXISTS `sac_empleado_institucion`;
CREATE TABLE `sac_empleado_institucion` (
  `id_empleado_institucion` int(11) NOT NULL AUTO_INCREMENT,
  `id_lugar_trabajo` int(11) NOT NULL,
  `id_tipo_inscripcion` int(11) NOT NULL,
  `id_tipo_representacion` int(11) NOT NULL,
  `id_cargo_comite` int(11) DEFAULT NULL,
  `id_genero` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `nombre_empleado` varchar(255) NOT NULL,
  `cargo_empleado` varchar(255) NOT NULL,
  `dui_empleado` varchar(10) NOT NULL,
  `delegado` tinyint(4) DEFAULT NULL,
  `sindicato` tinyint(4) DEFAULT NULL,
  `id_empleado_institucion_sustituye` int(11) DEFAULT NULL,
  `estado_empleado` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modifica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado_institucion`),
  KEY `fk_lugar_trabajo_empleado_institucion` (`id_lugar_trabajo`),
  KEY `fk_tipo_inscripcion_empleado_emnpresa` (`id_tipo_inscripcion`),
  KEY `fk_tipo_representacion_empleado_institucion` (`id_tipo_representacion`),
  KEY `fk_cargo_comite_empleado` (`id_cargo_comite`),
  KEY `fk_empleado_sustituye` (`id_empleado_institucion_sustituye`),
  CONSTRAINT `fk_cargo_comite_empleado` FOREIGN KEY (`id_cargo_comite`) REFERENCES `sac_cargo_comite` (`id_cargo_comite`) ON UPDATE CASCADE,
  CONSTRAINT `fk_empleado_sustituye` FOREIGN KEY (`id_empleado_institucion_sustituye`) REFERENCES `sac_empleado_institucion` (`id_empleado_institucion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_lugar_trabajo_empleado_institucion` FOREIGN KEY (`id_lugar_trabajo`) REFERENCES `sac_lugar_trabajo` (`id_lugar_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_inscripcion_empleado_institucion` FOREIGN KEY (`id_tipo_inscripcion`) REFERENCES `sac_tipo_inscripcion` (`id_tipo_inscripcion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_representacion_empleado_institucion` FOREIGN KEY (`id_tipo_representacion`) REFERENCES `sac_tipo_representacion` (`id_tipo_representacion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_empleado_institucion
-- ----------------------------
INSERT INTO `sac_empleado_institucion` VALUES ('1', '13', '1', '2', null, '1', '2014-09-02', 'Carlos García', 'Cajero', '13541354-4', null, null, null, '1', '2014-07-27 10:43:47', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('3', '13', '1', '1', null, '1', '2014-08-01', 'Francisco Sanchez', 'Jefe Cajero', '13541354-1', '1', null, null, '1', '2014-08-01 15:40:30', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('4', '19', '1', '2', null, '1', '2014-08-21', 'Julio Dominguez', 'Contador vista', '09109231-6', '1', '1', null, '1', '2014-08-21 15:02:31', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('5', '13', '1', '1', null, '2', '2014-08-21', 'Damaris Vega', 'Jefe de Sección', '34523452-7', '1', null, null, '1', '2014-08-21 15:04:57', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('6', '18', '1', '1', null, '1', '2014-09-01', 'Jhonatan Florez Barahona', 'Jefe de Cajeros', '02323232-4', '1', '1', null, '1', '2014-09-01 05:23:15', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('7', '18', '1', '2', null, '1', '2014-09-01', 'Oscar Rojas Chirino', 'Cajero', '03224564-5', '1', null, null, '1', '2014-09-01 05:24:04', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('8', '16', '1', '1', null, '1', '2014-09-04', 'Juan Leonel Peña Rivas', 'Jefe de informática', '32452345-5', '1', null, null, '1', '2014-09-05 03:13:29', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('9', '16', '1', '3', null, '2', '2014-09-04', 'Mayra Evelyn Morán de Peña', 'Supervisora', '09876654-4', null, '1', null, '1', '2014-09-05 03:17:46', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('10', '19', '1', '2', null, '2', '2014-09-09', 'Carla Henríquez', 'Cajera', '04235876-4', null, null, null, '1', '2014-09-09 00:44:09', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('11', '19', '1', '3', null, '2', '2014-09-10', 'Yesenia Mejía', 'Cajera', '01345234-8', '1', '1', null, '1', '2014-09-10 16:28:20', '50', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('12', '20', '1', '1', null, '2', '2014-09-10', 'Gabriela Mistral', 'Directora', '03456234-6', '1', null, null, '1', '2014-09-10 18:52:26', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('13', '13', '1', '1', null, '2', '2014-11-03', 'Carolina Ramirez', 'Jefe Cajera', '07643365-3', '1', null, null, '1', '2014-11-03 08:45:36', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('14', '15', '1', '2', null, '1', '2014-11-03', 'Carlos Martínez', 'Cajero', '03456345-9', null, null, null, '1', '2014-11-03 08:50:38', '22', null, null);
INSERT INTO `sac_empleado_institucion` VALUES ('15', '13', '1', '1', null, '2', '2014-11-13', 'Juana de Arco', 'Luchadora', '03452378-6', null, null, null, '1', '2014-11-13 13:13:43', '22', null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_entrega_acreditacion
-- ----------------------------

-- ----------------------------
-- Table structure for sac_estado_verificacion
-- ----------------------------
DROP TABLE IF EXISTS `sac_estado_verificacion`;
CREATE TABLE `sac_estado_verificacion` (
  `id_estado_verificacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_verificacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_estado_verificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_estado_verificacion
-- ----------------------------
INSERT INTO `sac_estado_verificacion` VALUES ('1', 'Cumplimiento');
INSERT INTO `sac_estado_verificacion` VALUES ('2', 'En proceso');
INSERT INTO `sac_estado_verificacion` VALUES ('3', 'Incumplimiento');

-- ----------------------------
-- Table structure for sac_institucion
-- ----------------------------
DROP TABLE IF EXISTS `sac_institucion`;
CREATE TABLE `sac_institucion` (
  `id_institucion` int(11) NOT NULL AUTO_INCREMENT,
  `id_clasificacion` int(11) DEFAULT NULL,
  `id_sector` int(11) DEFAULT NULL,
  `nombre_institucion` varchar(255) NOT NULL,
  `nit_empleador` varchar(17) DEFAULT NULL,
  `nombre_representante` varchar(255) NOT NULL,
  `sindicato` varchar(2) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modifica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_institucion`),
  KEY `fk_clasificacion_institucion_institucion` (`id_clasificacion`),
  KEY `fk_sector_institucion_institucion` (`id_sector`),
  CONSTRAINT `fk_clasificacion_institucion_institucion` FOREIGN KEY (`id_clasificacion`) REFERENCES `sac_clasificacion_institucion` (`id_clasificacion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sector_institucion_institucion` FOREIGN KEY (`id_sector`) REFERENCES `sac_sector_institucion` (`id_sector`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_institucion
-- ----------------------------
INSERT INTO `sac_institucion` VALUES ('14', null, '1', 'Callejas S.A. de C.V.', '0614-310586-106-8', '', '0', '1', '2014-07-22 21:26:44', '22', '2014-12-16 10:27:53', '22');
INSERT INTO `sac_institucion` VALUES ('15', null, '2', 'Ministerio de Hacienda', '0987-120623-243-5', '', '1', '1', '2014-08-21 14:39:37', '22', null, null);
INSERT INTO `sac_institucion` VALUES ('16', null, '1', 'Personal Calificado S.A. de C.V.', '0614-310586-106-8', 'Roberto Emilio Carpio', '', '1', '2014-12-16 10:33:58', '22', null, null);

-- ----------------------------
-- Table structure for sac_lugar_trabajo
-- ----------------------------
DROP TABLE IF EXISTS `sac_lugar_trabajo`;
CREATE TABLE `sac_lugar_trabajo` (
  `id_lugar_trabajo` int(11) NOT NULL AUTO_INCREMENT,
  `id_institucion` int(11) NOT NULL,
  `id_tipo_lugar_trabajo` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `nombre_lugar` varchar(255) NOT NULL,
  `direccion_lugar` text NOT NULL,
  `nombre_contacto` varchar(255) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `total_hombres` int(11) NOT NULL,
  `total_mujeres` int(11) NOT NULL,
  `fecha_conformacion` date DEFAULT NULL,
  `necesita_comite` int(11) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modifica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lugar_trabajo`),
  KEY `fk_tipo_lugar_trabajo_lugar_trabajo` (`id_tipo_lugar_trabajo`),
  KEY `fk_institucion_lugar_trabajo` (`id_institucion`),
  CONSTRAINT `fk_institucion_lugar_trabajo` FOREIGN KEY (`id_institucion`) REFERENCES `sac_institucion` (`id_institucion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_lugar_trabajo_lugar_trabajo` FOREIGN KEY (`id_tipo_lugar_trabajo`) REFERENCES `sac_tipo_lugar_trabajo` (`id_tipo_lugar_trabajo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_lugar_trabajo
-- ----------------------------
INSERT INTO `sac_lugar_trabajo` VALUES ('13', '14', '2', '97', 'Super Selectos Metrosur', 'Condominio Metrocentro Sur # 413 Planta Baja, S.S.', 'Luis Cardona', '22603508', 'luis.cardona@superselectos.com.sv', '0', '0', null, null, '1', '2014-07-22 21:33:09', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('14', '14', '2', '75', 'Super Selectos Santa Tecla', '2a Calle Oriente y 3a. Av .Nte. No 2-9', '', '22888211', '', '0', '0', null, null, '1', '2014-07-22 21:36:21', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('15', '14', '2', '163', 'Super Selectos San Vicente', '2a. Av. Sur.ex -local arena, San Vicente', 'Roberto Chévez', '23930073', 'roberto.chevez@selectos.com.sv', '0', '0', null, null, '1', '2014-07-22 21:37:32', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('16', '14', '2', '114', 'Super Selectos Plaza Mundo', 'Km. 4 1/2 Boulev. del Ejercito, C.C. Plaza Mundo, Ancla \"A\"', 'Juan Perez', '23402323', 'juanperez@hotmail.com', '0', '0', null, null, '1', '2014-07-22 21:39:19', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('17', '14', '2', '106', 'Super Selectos Mejicanos', 'Final 5a. Av. Nte. Universitaria', 'Juan Matínez', '22262715', 'juan.martinez@selectos.com.sv', '0', '0', null, null, '1', '2014-07-22 21:40:45', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('18', '14', '2', '97', 'Super Selectos Metrocentro', 'Mentrocentro', 'Mayra Evelin de Peña', '76556754', 'mayradepena@gmail.com', '0', '0', null, null, '1', '2014-08-12 10:44:31', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('19', '15', '1', '97', 'Dirección General de Aduana Oficina Central', 'San Salvador', 'Carlos Cáceres', '22303445', 'carloscaceres@mh.gob.sv', '0', '0', null, null, '1', '2014-08-21 14:42:39', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('20', '15', '2', '13', 'Dirección General de Aduana Santa Ana', 'Santa Ana, Santa Ana', 'Mayra de Peña', '23452453', 'mayra.pena@mh.gob.sv', '0', '0', null, null, '1', '2014-08-21 14:44:18', '22', '2014-12-16 10:26:37', '22');
INSERT INTO `sac_lugar_trabajo` VALUES ('21', '15', '2', '163', 'Dirección General de Aduana San Vicente', 'San Vicente', '', '', '', '0', '0', null, null, '1', '2014-11-03 08:41:49', '22', null, null);
INSERT INTO `sac_lugar_trabajo` VALUES ('22', '16', '1', '97', 'Personal Calificado S.A. de C.V.', 'Calle Nueva #2 y 71 Avenida Sur #19. Colonia Escalón', '', '', '', '0', '0', null, null, '1', '2014-12-16 10:36:26', '22', null, null);

-- ----------------------------
-- Table structure for sac_miembro_entrevistado
-- ----------------------------
DROP TABLE IF EXISTS `sac_miembro_entrevistado`;
CREATE TABLE `sac_miembro_entrevistado` (
  `id_promocion` int(11) NOT NULL,
  `id_empleado_institucion` int(11) NOT NULL,
  KEY `fk_miembros_entrevistados_promocion` (`id_promocion`),
  KEY `fk_miembros_entrevistados_empleado_institucion` (`id_empleado_institucion`),
  CONSTRAINT `fk_miembros_entrevistados_empleado_institucion` FOREIGN KEY (`id_empleado_institucion`) REFERENCES `sac_empleado_institucion` (`id_empleado_institucion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_miembros_entrevistados_promocion` FOREIGN KEY (`id_promocion`) REFERENCES `sac_promocion` (`id_promocion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_miembro_entrevistado
-- ----------------------------

-- ----------------------------
-- Table structure for sac_programacion_visita
-- ----------------------------
DROP TABLE IF EXISTS `sac_programacion_visita`;
CREATE TABLE `sac_programacion_visita` (
  `id_programacion_visita` int(11) NOT NULL AUTO_INCREMENT,
  `id_lugar_trabajo` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_visita` date NOT NULL,
  `hora_visita` time NOT NULL,
  `hora_visita_final` time NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modifica` int(11) DEFAULT NULL,
  `estado_programacion` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_programacion_visita`),
  KEY `fk_institucion_programacion_visita` (`id_lugar_trabajo`),
  CONSTRAINT `fk_institucion_programacion_visita` FOREIGN KEY (`id_lugar_trabajo`) REFERENCES `sac_lugar_trabajo` (`id_lugar_trabajo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_programacion_visita
-- ----------------------------

-- ----------------------------
-- Table structure for sac_promocion
-- ----------------------------
DROP TABLE IF EXISTS `sac_promocion`;
CREATE TABLE `sac_promocion` (
  `id_promocion` int(11) NOT NULL AUTO_INCREMENT,
  `id_programacion_visita` int(11) NOT NULL,
  `fecha_promocion` date NOT NULL,
  `nombre_recibio` varchar(255) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `observaciones` text,
  `id_estado_verificacion` int(11) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_usuario_crea` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modifica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `fk_visita_promocion` (`id_programacion_visita`),
  KEY `fk_estado_verificacion_promocion` (`id_estado_verificacion`),
  CONSTRAINT `fk_estado_verificacion_promocion` FOREIGN KEY (`id_estado_verificacion`) REFERENCES `sac_estado_verificacion` (`id_estado_verificacion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_visita_promocion` FOREIGN KEY (`id_programacion_visita`) REFERENCES `sac_programacion_visita` (`id_programacion_visita`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_promocion
-- ----------------------------

-- ----------------------------
-- Table structure for sac_sector_institucion
-- ----------------------------
DROP TABLE IF EXISTS `sac_sector_institucion`;
CREATE TABLE `sac_sector_institucion` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sector` varchar(255) NOT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_sector_institucion
-- ----------------------------
INSERT INTO `sac_sector_institucion` VALUES ('1', 'Privado');
INSERT INTO `sac_sector_institucion` VALUES ('2', 'Público');
INSERT INTO `sac_sector_institucion` VALUES ('3', 'Municipal');

-- ----------------------------
-- Table structure for sac_tematica
-- ----------------------------
DROP TABLE IF EXISTS `sac_tematica`;
CREATE TABLE `sac_tematica` (
  `id_tematica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tematica` varchar(250) NOT NULL,
  PRIMARY KEY (`id_tematica`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_tematica
-- ----------------------------
INSERT INTO `sac_tematica` VALUES ('1', 'Las responsabilidades del Comité');
INSERT INTO `sac_tematica` VALUES ('2', 'Las normas legales en materia de seguridad y salud ocupacional');
INSERT INTO `sac_tematica` VALUES ('3', 'Riesgos y exigencias del trabajo');
INSERT INTO `sac_tematica` VALUES ('4', 'Aspectos prácticos sobre la implementación de sistemas de gestión en la materia');
INSERT INTO `sac_tematica` VALUES ('5', 'Las causas habituales de accidentes de trabajo y enfermedades profesionales');
INSERT INTO `sac_tematica` VALUES ('6', 'El reconocimiento de los riesgos');
INSERT INTO `sac_tematica` VALUES ('7', 'Los principios básicos de la higiene ocupacional');
INSERT INTO `sac_tematica` VALUES ('8', 'Metodología para efectuar inspecciones');
INSERT INTO `sac_tematica` VALUES ('9', 'Metodología para la investigación de accidentes');
INSERT INTO `sac_tematica` VALUES ('10', 'Las enfermedades profesionales que es preciso notificar');
INSERT INTO `sac_tematica` VALUES ('11', 'La indemnización y las prestaciones por enfermedad a los trabajadores');
INSERT INTO `sac_tematica` VALUES ('12', 'Técnicas eficaces de comunicación');

-- ----------------------------
-- Table structure for sac_tipo_inscripcion
-- ----------------------------
DROP TABLE IF EXISTS `sac_tipo_inscripcion`;
CREATE TABLE `sac_tipo_inscripcion` (
  `id_tipo_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_inscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_tipo_inscripcion
-- ----------------------------
INSERT INTO `sac_tipo_inscripcion` VALUES ('1', 'Inicial');
INSERT INTO `sac_tipo_inscripcion` VALUES ('2', 'Aumento');
INSERT INTO `sac_tipo_inscripcion` VALUES ('3', 'Reducción');
INSERT INTO `sac_tipo_inscripcion` VALUES ('4', 'Cambio');
INSERT INTO `sac_tipo_inscripcion` VALUES ('5', 'Renovación');

-- ----------------------------
-- Table structure for sac_tipo_lugar_trabajo
-- ----------------------------
DROP TABLE IF EXISTS `sac_tipo_lugar_trabajo`;
CREATE TABLE `sac_tipo_lugar_trabajo` (
  `id_tipo_lugar_trabajo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_lugar_trabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_tipo_lugar_trabajo
-- ----------------------------
INSERT INTO `sac_tipo_lugar_trabajo` VALUES ('1', 'Central');
INSERT INTO `sac_tipo_lugar_trabajo` VALUES ('2', 'Sucursal/Dependecia ');

-- ----------------------------
-- Table structure for sac_tipo_representacion
-- ----------------------------
DROP TABLE IF EXISTS `sac_tipo_representacion`;
CREATE TABLE `sac_tipo_representacion` (
  `id_tipo_representacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_representacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_representacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_tipo_representacion
-- ----------------------------
INSERT INTO `sac_tipo_representacion` VALUES ('1', 'Empleador');
INSERT INTO `sac_tipo_representacion` VALUES ('2', 'Trabajadores');
INSERT INTO `sac_tipo_representacion` VALUES ('3', 'Sindicato');

-- ----------------------------
-- View structure for sac_resultado_acreditacion
-- ----------------------------
DROP VIEW IF EXISTS sac_resultado_acreditacion;
CREATE VIEW sac_resultado_acreditacion AS 
SELECT DISTINCT
sac_clasificacion_institucion.id_clasificacion,
sac_clasificacion_institucion.ciiu4,
sac_clasificacion_institucion.codigo_clasificacion,
sac_clasificacion_institucion.nombre_clasificacion,
sac_sector_institucion.id_sector,
sac_sector_institucion.nombre_sector,
sac_institucion.id_institucion,
sac_institucion.nombre_institucion,
sac_institucion.nit_empleador,
sac_institucion.nombre_representante,
sac_institucion.sindicato AS sindicato_empleador,
sac_lugar_trabajo.id_lugar_trabajo,
sac_lugar_trabajo.nombre_lugar,
sac_tipo_lugar_trabajo.nombre_tipo AS tipo_lugar,
org_departamento.id_departamento,
org_departamento.departamento,
org_municipio.id_municipio,
org_municipio.municipio,
sac_lugar_trabajo.direccion_lugar,
sac_lugar_trabajo.nombre_contacto,
sac_lugar_trabajo.fecha_conformacion,
sac_lugar_trabajo.telefono AS telefono_contacto,
sac_lugar_trabajo.correo AS correo_contacto,
sac_lugar_trabajo.total_hombres,
sac_lugar_trabajo.total_mujeres,
sac_lugar_trabajo.estado AS estado_lugar,
sac_tipo_inscripcion.id_tipo_inscripcion,
sac_tipo_inscripcion.nombre AS tipo_inscripcion,
sac_empleado_institucion.id_empleado_institucion,
sac_empleado_institucion.fecha_ingreso AS fecha_inscripcion,
sac_empleado_institucion.nombre_empleado,
sac_empleado_institucion.cargo_empleado,
sac_empleado_institucion.dui_empleado,
sac_empleado_institucion.id_genero,
org_genero.genero,
sac_tipo_representacion.id_tipo_representacion,
sac_tipo_representacion.nombre_tipo_representacion AS tipo_representacion,
sac_empleado_institucion.delegado AS delegado_empleado,
sac_empleado_institucion.sindicato AS sindicato_empleado,
sac_empleado_institucion2.id_empleado_institucion AS id_empleado_institucion_sustituye,
sac_empleado_institucion2.nombre_empleado AS nombre_empleado_sustituye,
sac_capacitacion.id_capacitacion,
sac_capacitacion.fecha_capacitacion,
sac_capacitacion.hora_capacitacion,
sac_lugar_trabajo2.nombre_lugar AS nombre_lugar_capacitacion,
sac_capacitacion.estado_capacitacion,
sac_asistencia.asistio AS asistio_empleado,
sac_asistencia.fecha_acreditacion,
tcm_empleado.id_empleado,
tcm_empleado.nombre AS tecnico_educador,
tcm_empleado.seccion,
sac_entrega_acreditacion.id_entrega_acreditacion,
sac_entrega_acreditacion.fecha_entrega,
sac_entrega_acreditacion.nombre_entrega,
sac_entrega_acreditacion.dui_entrega,
sac_empleado_institucion.id_cargo_comite,
sac_cargo_comite.nombre_cargo_comite
FROM sac_institucion
LEFT JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
LEFT JOIN sac_empleado_institucion ON sac_empleado_institucion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
LEFT JOIN sac_asistencia ON sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
LEFT JOIN sac_capacitacion ON sac_asistencia.id_capacitacion = sac_capacitacion.id_capacitacion
LEFT JOIN sac_capacitador ON sac_capacitador.id_capacitacion = sac_capacitacion.id_capacitacion
LEFT JOIN sac_clasificacion_institucion ON sac_institucion.id_clasificacion = sac_clasificacion_institucion.id_clasificacion
LEFT JOIN sac_sector_institucion ON sac_institucion.id_sector = sac_sector_institucion.id_sector
LEFT JOIN sac_tipo_inscripcion ON sac_empleado_institucion.id_tipo_inscripcion = sac_tipo_inscripcion.id_tipo_inscripcion
LEFT JOIN sac_tipo_lugar_trabajo ON sac_lugar_trabajo.id_tipo_lugar_trabajo = sac_tipo_lugar_trabajo.id_tipo_lugar_trabajo
LEFT JOIN sac_tipo_representacion ON sac_empleado_institucion.id_tipo_representacion = sac_tipo_representacion.id_tipo_representacion
LEFT JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
LEFT JOIN org_departamento ON org_municipio.id_departamento_pais = org_departamento.id_departamento
LEFT JOIN tcm_empleado ON tcm_empleado.id_empleado = sac_capacitador.id_empleado
LEFT JOIN sac_lugar_trabajo AS sac_lugar_trabajo2 ON sac_capacitacion.id_lugar_trabajo = sac_lugar_trabajo2.id_lugar_trabajo
LEFT JOIN sac_empleado_institucion AS sac_empleado_institucion2 ON sac_empleado_institucion.id_empleado_institucion_sustituye=sac_empleado_institucion2.id_empleado_institucion 
LEFT JOIN org_genero ON org_genero.id_genero=sac_empleado_institucion.id_genero 
LEFT JOIN sac_entrega_acreditacion ON sac_entrega_acreditacion.id_empleado_institucion=sac_empleado_institucion.id_empleado_institucion
left JOIN sac_cargo_comite ON sac_cargo_comite.id_cargo_comite=sac_empleado_institucion.id_cargo_comite
WHERE sac_lugar_trabajo.estado=2;

-- ----------------------------
-- View structure for sac_resultado_capacitacion
-- ----------------------------
DROP VIEW IF EXISTS sac_resultado_capacitacion;
CREATE VIEW sac_resultado_capacitacion AS 
SELECT
sac_clasificacion_institucion.id_clasificacion,
sac_clasificacion_institucion.ciiu4,
sac_clasificacion_institucion.codigo_clasificacion,
sac_clasificacion_institucion.nombre_clasificacion,
sac_sector_institucion.id_sector,
sac_sector_institucion.nombre_sector,
sac_institucion.id_institucion,
sac_institucion.nombre_institucion,
sac_institucion.nit_empleador,
sac_institucion.nombre_representante,
sac_institucion.sindicato AS sindicato_empleador,
sac_lugar_trabajo.id_lugar_trabajo,
sac_lugar_trabajo.nombre_lugar,
sac_tipo_lugar_trabajo.nombre_tipo AS tipo_lugar,
org_departamento.id_departamento,
org_departamento.departamento,
org_municipio.id_municipio,
org_municipio.municipio,
sac_lugar_trabajo.direccion_lugar,
sac_lugar_trabajo.nombre_contacto,
sac_lugar_trabajo.telefono AS telefono_contacto,
sac_lugar_trabajo.correo AS correo_contacto,
sac_lugar_trabajo.total_hombres,
sac_lugar_trabajo.total_mujeres,
sac_lugar_trabajo.estado AS estado_lugar,
sac_tipo_inscripcion.id_tipo_inscripcion,
sac_tipo_inscripcion.nombre AS tipo_inscripcion,
sac_empleado_institucion.id_empleado_institucion,
sac_empleado_institucion.fecha_ingreso AS fecha_inscripcion,
sac_empleado_institucion.nombre_empleado,
sac_empleado_institucion.cargo_empleado,
sac_empleado_institucion.dui_empleado,
sac_empleado_institucion.id_genero,
org_genero.genero,
sac_tipo_representacion.id_tipo_representacion,
sac_tipo_representacion.nombre_tipo_representacion AS tipo_representacion,
sac_empleado_institucion.delegado AS delegado_empleado,
sac_empleado_institucion.sindicato AS sindicato_empleado,
sac_empleado_institucion2.id_empleado_institucion AS id_empleado_institucion_sustituye,
sac_empleado_institucion2.nombre_empleado AS nombre_empleado_sustituye,
sac_capacitacion.id_capacitacion,
sac_capacitacion.fecha_capacitacion,
sac_capacitacion.hora_capacitacion,
sac_capacitacion.id_lugar_trabajo AS id_lugar_trabajo_capacitacion,
sac_lugar_trabajo2.nombre_lugar AS nombre_lugar_capacitacion,
sac_capacitacion.estado_capacitacion,
sac_asistencia.asistio AS asistio_empleado,
tcm_empleado.id_empleado,
tcm_empleado.nombre AS tecnico_educador,
tcm_empleado.seccion
FROM sac_institucion
LEFT JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
LEFT JOIN sac_empleado_institucion ON sac_empleado_institucion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
LEFT JOIN sac_asistencia ON sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
LEFT JOIN sac_capacitacion ON sac_asistencia.id_capacitacion = sac_capacitacion.id_capacitacion
LEFT JOIN sac_capacitador ON sac_capacitador.id_capacitacion = sac_capacitacion.id_capacitacion
LEFT JOIN sac_clasificacion_institucion ON sac_institucion.id_clasificacion = sac_clasificacion_institucion.id_clasificacion
LEFT JOIN sac_sector_institucion ON sac_institucion.id_sector = sac_sector_institucion.id_sector
LEFT JOIN sac_tipo_inscripcion ON sac_empleado_institucion.id_tipo_inscripcion = sac_tipo_inscripcion.id_tipo_inscripcion
LEFT JOIN sac_tipo_lugar_trabajo ON sac_lugar_trabajo.id_tipo_lugar_trabajo = sac_tipo_lugar_trabajo.id_tipo_lugar_trabajo
LEFT JOIN sac_tipo_representacion ON sac_empleado_institucion.id_tipo_representacion = sac_tipo_representacion.id_tipo_representacion
LEFT JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
LEFT JOIN org_departamento ON org_municipio.id_departamento_pais = org_departamento.id_departamento
LEFT JOIN tcm_empleado ON tcm_empleado.id_empleado = sac_capacitador.id_empleado
LEFT JOIN sac_lugar_trabajo AS sac_lugar_trabajo2 ON sac_capacitacion.id_lugar_trabajo = sac_lugar_trabajo2.id_lugar_trabajo
LEFT JOIN sac_empleado_institucion AS sac_empleado_institucion2 ON sac_empleado_institucion.id_empleado_institucion_sustituye=sac_empleado_institucion2.id_empleado_institucion 
LEFT JOIN org_genero ON org_genero.id_genero=sac_empleado_institucion.id_genero;

-- ----------------------------
-- View structure for sac_resultado_promocion
-- ----------------------------
DROP VIEW IF EXISTS sac_resultado_promocion;
CREATE VIEW sac_resultado_promocion AS 
SELECT DISTINCT
sac_institucion.id_institucion,
sac_clasificacion_institucion.ciiu4,
sac_institucion.id_clasificacion,
sac_clasificacion_institucion.codigo_clasificacion,
sac_clasificacion_institucion.nombre_clasificacion,
sac_institucion.id_sector,
sac_sector_institucion.nombre_sector,
sac_institucion.nombre_institucion,
sac_institucion.nit_empleador,
sac_institucion.nombre_representante,
sac_institucion.sindicato,
sac_institucion.estado AS estado_institucion,
sac_lugar_trabajo.id_lugar_trabajo,
sac_lugar_trabajo.id_tipo_lugar_trabajo,
sac_tipo_lugar_trabajo.nombre_tipo,
sac_lugar_trabajo.id_municipio,
LOWER(org_municipio.municipio) AS municipio,
org_departamento.id_departamento,
LOWER(org_departamento.departamento) AS departamento,
sac_lugar_trabajo.nombre_lugar,
sac_lugar_trabajo.direccion_lugar,
sac_lugar_trabajo.nombre_contacto,
sac_lugar_trabajo.telefono,
sac_lugar_trabajo.correo,
sac_lugar_trabajo.total_hombres,
sac_lugar_trabajo.total_mujeres,
sac_lugar_trabajo.estado AS estado_lugar_trabajo,
sac_lugar_trabajo.necesita_comite,
sac_programacion_visita.id_programacion_visita,
sac_programacion_visita.id_empleado,
tcm_empleado.nombre AS nombre_empleado,
tcm_empleado.id_usuario,
tcm_empleado.nr,
tcm_empleado.correo AS correo_empleado,
tcm_empleado.id_seccion,
tcm_empleado.seccion,
sac_programacion_visita.fecha_visita,
sac_programacion_visita.hora_visita,
sac_programacion_visita.estado_programacion,
sac_promocion.id_promocion,
sac_promocion.fecha_promocion,
sac_promocion.fecha_creacion,
sac_promocion.nombre_recibio,
sac_promocion.hora_inicio,
sac_promocion.hora_final,
sac_promocion.observaciones
FROM sac_institucion
LEFT JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
LEFT JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
LEFT JOIN org_departamento ON org_departamento.id_departamento = org_municipio.id_departamento_pais
LEFT JOIN sac_programacion_visita ON sac_programacion_visita.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
LEFT JOIN sac_promocion ON sac_promocion.id_programacion_visita = sac_programacion_visita.id_programacion_visita
LEFT JOIN sac_sector_institucion ON sac_institucion.id_sector = sac_sector_institucion.id_sector
LEFT JOIN sac_clasificacion_institucion ON sac_institucion.id_clasificacion = sac_clasificacion_institucion.id_clasificacion
LEFT JOIN sac_tipo_lugar_trabajo ON sac_lugar_trabajo.id_tipo_lugar_trabajo = sac_tipo_lugar_trabajo.id_tipo_lugar_trabajo
LEFT JOIN tcm_empleado ON tcm_empleado.id_empleado = sac_programacion_visita.id_empleado 
WHERE sac_programacion_visita.estado_programacion<=2;

-- ----------------------------
-- View structure for sac_resultado_verificacion
-- ----------------------------
DROP VIEW IF EXISTS sac_resultado_verificacion;
CREATE VIEW sac_resultado_verificacion AS 
SELECT DISTINCT
sac_institucion.id_institucion,
sac_clasificacion_institucion.ciiu4,
sac_institucion.id_clasificacion,
sac_clasificacion_institucion.codigo_clasificacion,
sac_clasificacion_institucion.nombre_clasificacion,
sac_institucion.id_sector,
sac_sector_institucion.nombre_sector,
sac_institucion.nombre_institucion,
sac_institucion.nit_empleador,
sac_institucion.nombre_representante,
sac_institucion.sindicato,
sac_institucion.estado AS estado_institucion,
sac_lugar_trabajo.id_lugar_trabajo,
sac_lugar_trabajo.id_tipo_lugar_trabajo,
sac_tipo_lugar_trabajo.nombre_tipo,
sac_lugar_trabajo.id_municipio,
LOWER(org_municipio.municipio) AS municipio,
org_departamento.id_departamento,
LOWER(org_departamento.departamento) AS departamento,
sac_lugar_trabajo.nombre_lugar,
sac_lugar_trabajo.direccion_lugar,
sac_lugar_trabajo.nombre_contacto,
sac_lugar_trabajo.telefono,
sac_lugar_trabajo.correo,
sac_lugar_trabajo.total_hombres,
sac_lugar_trabajo.total_mujeres,
sac_lugar_trabajo.estado AS estado_lugar_trabajo,
sac_lugar_trabajo.necesita_comite,
sac_programacion_visita.id_programacion_visita,
sac_programacion_visita.id_empleado,
tcm_empleado.nombre AS nombre_empleado,
tcm_empleado.id_usuario,
tcm_empleado.nr,
tcm_empleado.correo AS correo_empleado,
tcm_empleado.id_seccion,
tcm_empleado.seccion,
sac_programacion_visita.fecha_visita,
sac_programacion_visita.hora_visita,
sac_programacion_visita.estado_programacion,
sac_promocion.id_promocion,
sac_promocion.fecha_promocion,
sac_promocion.fecha_creacion,
sac_promocion.nombre_recibio,
sac_promocion.hora_inicio,
sac_promocion.hora_final,
sac_promocion.observaciones,
sac_promocion.id_estado_verificacion,
sac_estado_verificacion.nombre_estado_verificacion,
sac_control_visita.fecha_capacitacion,
sac_control_visita.facilitador,
sac_tematica.id_tematica,
sac_tematica.nombre_tematica,
sac_miembro_entrevistado.id_empleado_institucion,
sac_empleado_institucion.nombre_empleado AS nombre_empleado_institucion,
sac_empleado_institucion.id_cargo_comite,
sac_cargo_comite.nombre_cargo_comite
FROM sac_institucion
LEFT JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
LEFT JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
LEFT JOIN org_departamento ON org_departamento.id_departamento = org_municipio.id_departamento_pais
LEFT JOIN sac_programacion_visita ON sac_programacion_visita.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
LEFT JOIN sac_promocion ON sac_promocion.id_programacion_visita = sac_programacion_visita.id_programacion_visita
LEFT JOIN sac_sector_institucion ON sac_institucion.id_sector = sac_sector_institucion.id_sector
LEFT JOIN sac_clasificacion_institucion ON sac_institucion.id_clasificacion = sac_clasificacion_institucion.id_clasificacion
LEFT JOIN sac_tipo_lugar_trabajo ON sac_lugar_trabajo.id_tipo_lugar_trabajo = sac_tipo_lugar_trabajo.id_tipo_lugar_trabajo
LEFT JOIN tcm_empleado ON tcm_empleado.id_empleado = sac_programacion_visita.id_empleado 
LEFT JOIN sac_estado_verificacion ON sac_estado_verificacion.id_estado_verificacion=sac_promocion.id_estado_verificacion
LEFT JOIN sac_control_visita ON sac_control_visita.id_programacion_visita=sac_programacion_visita.id_programacion_visita
LEFT JOIN sac_tematica ON sac_tematica.id_tematica=sac_control_visita.id_tematica
LEFT JOIN sac_miembro_entrevistado ON sac_miembro_entrevistado.id_promocion=sac_promocion.id_promocion 
LEFT JOIN sac_empleado_institucion ON sac_empleado_institucion.id_empleado_institucion=sac_miembro_entrevistado.id_empleado_institucion
LEFT JOIN sac_cargo_comite ON sac_cargo_comite.id_cargo_comite=sac_empleado_institucion.id_cargo_comite
WHERE sac_programacion_visita.estado_programacion>2;