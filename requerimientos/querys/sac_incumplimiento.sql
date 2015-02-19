/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : mtps

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-02-19 02:30:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sac_incumplimiento
-- ----------------------------
DROP TABLE IF EXISTS `sac_incumplimiento`;
CREATE TABLE `sac_incumplimiento` (
  `id_incumplimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_incumplimiento` text NOT NULL,
  `base_legal_incumplimiento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_incumplimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sac_incumplimiento
-- ----------------------------
INSERT INTO `sac_incumplimiento` VALUES ('1', 'El incumplimiento de la obligación de comunicar a la oficina respectiva, la existencia de un Comité de Seguridad y Salud Ocupacional, dentro de los ocho días hábiles de su creación.', 'Art. 78, numeral 6 LGPRLT\r\n');
INSERT INTO `sac_incumplimiento` VALUES ('2', 'No permitir el empleador que los miembros del Comité de Seguridad y Salud ocupacional se reúnan dentro de la jornada de trabajo, siempre que exista un programa establecido o cuando las circunstancias lo requieran.', 'Art. 78, numeral 7 LGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('3', 'La inexistencia de un Comité de Seguridad y Salud Ocupacional, en los casos exigidos en la presente Ley.', 'Art. 79, numeral 2 LGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('4', 'Los miembros del Comité, así como los delegados de prevención duraran en funciones, dentro del Comité, dos años (acreditaciones actualizadas).', 'Art. 19, RGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('5', 'Las capacitaciones posteriores a cuenta del empleador a que se refiere el Artículo 15 de la Ley comprenderán un mínimo de 48 horas recibidas en la materia.', 'Art. 10, RGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('6', 'El incumplimiento de la obligación de formular y ejecutar el respectivo Programa de Gestión de Prevención de Riesgos Ocupacionales de la empresa.', 'Art. 79, numeral 3');
INSERT INTO `sac_incumplimiento` VALUES ('7', 'No adoptar las medidas preventivas aplicables en materia de Seguridad y Salud Ocupacional, cuando dicha omisión derive de un riesgo grave e inminente para la salud de los trabajadores y trabajadoras.', 'Art. 80,  numeral 17 LGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('8', 'Entre los representantes de los trabajadores ante el Comité estará al menos uno de los miembros del sindicato que tenga mayor número de miembros afiliados al momento de la conformación del Comité. ', 'Art. 15, LRGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('9', 'El Empleador tendrá la obligación de comunicar a la Dirección General de Previsión Social, dentro de los ocho días hábiles posteriores a su designación, los nombres y cargos de los miembros del comité, con el fin de comprobar su capacitación y proceder en su caso a la acreditación de sus miembros.(Acta de Constitución de Comité de Seguridad y Salud Ocupacional).', 'Art. 16, LGPRLT');
INSERT INTO `sac_incumplimiento` VALUES ('10', 'Las posteriores elecciones y designaciones de los miembros que conforman el Comité de cada lugar de trabajo deben notificarse a la Dirección General de Previsión Social del Ministerio dentro de los ocho días siguientes.(Hayan concluido los 2 años de haber sido acreditados)', 'Art. 23, LGPRLT');
