/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.37-0ubuntu0.12.04.1 : Database - mtps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`mtps` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mtps`;

/*Table structure for table `org_modulo` */

DROP TABLE IF EXISTS `org_modulo`;

CREATE TABLE `org_modulo` (
  `id_modulo` int(50) NOT NULL AUTO_INCREMENT,
  `id_sistema` int(50) DEFAULT NULL,
  `nombre_modulo` varchar(150) DEFAULT NULL,
  `descripcion_modulo` varchar(250) DEFAULT NULL,
  `orden` int(10) DEFAULT NULL,
  `dependencia` int(5) DEFAULT NULL,
  `url_modulo` varchar(300) DEFAULT NULL,
  `img_modulo` varchar(150) DEFAULT NULL,
  `opciones_modulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

/*Data for the table `org_modulo` */

insert  into `org_modulo`(`id_modulo`,`id_sistema`,`nombre_modulo`,`descripcion_modulo`,`orden`,`dependencia`,`url_modulo`,`img_modulo`,`opciones_modulo`) values (1,1,'FACTURAS','',1,0,'mod=facturas&secc=guardar',NULL,NULL),(2,1,'PEDIDOS','',2,0,'mod=pedidos&secc=guardar',NULL,NULL),(3,1,'PRODUCTOS','',3,0,'mod=productos&secc=guardar',NULL,NULL),(4,1,'PROVEEDORES','',4,0,'mod=proveedores&secc=guardar',NULL,NULL),(5,1,'UNIDADES DE PRODUCTOS','',5,0,'mod=unidades de productos&secc=guardar',NULL,NULL),(6,1,'REPORTES','',6,0,'mod=reportes',NULL,NULL),(7,1,'FUENTES DE FONDO','',7,0,'mod=fuentes de fondo&secc=guardar',NULL,NULL),(8,1,'OBJETO ESPECIFICO','',8,0,'mod=objeto especifico&secc=guardar',NULL,NULL),(9,1,'PERFIL','',10,0,'mod=perfil',NULL,NULL),(10,1,'CORTE','',9,0,'mod=corte&secc=guardar',NULL,NULL),(11,2,'SISTEMAS','',1,0,'mod=sistemas&secc=guardar',NULL,NULL),(12,2,'MODULOS','',2,0,'mod=modulos&secc=guardar',NULL,NULL),(13,2,'ROLES','',3,0,'mod=roles&secc=guardar',NULL,NULL),(14,2,'PERMISOS','',4,0,'mod=permisos&secc=guardar',NULL,NULL),(15,2,'USUARIOS','',5,0,'mod=usuarios&secc=guardar',NULL,NULL),(16,2,'USUARIO ROL','',6,0,'mod=usuario rol&secc=guardar',NULL,NULL),(17,2,'SECCIONES','',7,0,'mod=secciones&secc=guardar',NULL,NULL),(18,1,'CONTEO FISICO','',11,0,'mod=conteo fisico&secc=guardar',NULL,NULL),(19,3,'CATALOGOS',NULL,1,0,NULL,NULL,NULL),(20,3,'CUENTAS CONTABLES',NULL,2,19,'mod=cuentas contables&secc=guardar',NULL,NULL),(21,3,'CATEGORIAS',NULL,3,19,'mod=categorias&secc=guardar',NULL,NULL),(22,3,'SUB CATEGORIAS',NULL,4,19,'mod=sub categorias&secc=seleccionar',NULL,NULL),(23,3,'MOVIMIENTOS',NULL,5,19,'mod=movimientos&secc=guardar',NULL,NULL),(24,3,'OFICINAS',NULL,6,19,'mod=oficinas&secc=guardar',NULL,NULL),(25,3,'ALMACENES',NULL,7,19,'mod=almacenes&secc=guardar',NULL,NULL),(26,3,'MARCAS',NULL,8,19,'mod=marcas&secc=guardar',NULL,NULL),(27,3,'DOCUMENTOS',NULL,9,19,'mod=documentos&secc=guardar',NULL,NULL),(28,3,'CONDICION',NULL,10,19,'mod=condicion&secc=guardar',NULL,NULL),(29,3,'PROYECTOS',NULL,11,19,'mod=proyectos&secc=guardar',NULL,NULL),(30,3,'REGISTRO',NULL,12,0,NULL,NULL,NULL),(31,3,'DATOS COMUNES',NULL,13,30,'mod=datos comunes&secc=guardar',NULL,NULL),(32,3,'COD ACTIVOS',NULL,14,30,'mod=cod activos&secc=guardar',NULL,NULL),(33,3,'COD TERRENOS Y EDIF',NULL,15,30,'mod=cod terrenos y edif&secc=guardar',NULL,NULL),(34,3,'REG MOVIMIENTOS',NULL,17,30,'mod=reg movimientos&secc=guardar',NULL,NULL),(35,3,'REPORTES',NULL,18,0,'mod=reportes',NULL,NULL),(36,3,'PERFIL',NULL,19,0,'mod=perfil',NULL,NULL),(37,3,'COD AUTOMOVILES',NULL,16,30,'mod=cod autos&secc=guardar',NULL,NULL),(38,4,'PERSONAL','Registro de información personal',0,0,'mod=personal&secc=guardar&ses=0',NULL,NULL),(39,4,'EXPEDIENTES','Registro de información laboral del empleado',1,0,'blank',NULL,NULL),(40,4,'CAPACITACION','Menú principal de capacitaciones',2,0,'blank',NULL,NULL),(41,4,'CAPACITACIONES','Registro de capacitaciones',3,40,'mod=capacitaciones&secc=guardar',NULL,NULL),(42,4,'CAPACITADORES','Registro de personal del MTPS que imparte capacitaciones',4,40,'mod=capacitadores&secc=guardar',NULL,NULL),(43,4,'CATALOGOS','Menú principal de catálogos SFERH',5,0,'blank.php',NULL,NULL),(44,4,'NIVEL ACADEMICO','Registro de niveles academicos',6,43,'mod=nivel academico&secc=guardar',NULL,NULL),(45,4,'DOCUMENTOS','Catalogo de tipos de documentos usados en RRHH',7,43,'mod=documentos&secc=guardar',NULL,NULL),(46,4,'LICENCIAS','Catalogo de tipos de licencias usada en RRHH',8,43,'mod=licencias&secc=guardar',NULL,NULL),(47,4,'CARGOS FUNCIONALES','Catalogo de cargos funcionales en RRHH',9,43,'mod=cargos funcionales&secc=guardar',NULL,NULL),(48,4,'CARGOS NOMINALES','Catalogo de cargos nominales usados en RRHH',10,43,'mod=cargos nominales&secc=guardar',NULL,NULL),(49,4,'REPORTES','Listado de reportes que se pueden generar en RRHH',11,0,'mod=rpt_sferh',NULL,NULL),(50,4,'EXPEDIENTE','Información general del expediente del empleado, se considera a futuro el registro de información del expediente (ubicación física u otros)',12,39,'mod=expediente&secc=lista',NULL,NULL),(51,4,'LABORAL','Registro de información laboral del empleado',13,39,'mod=laboral&secc=guardar',NULL,NULL),(52,4,'LICENCIA','Registro de las licencias del empleado',14,39,'mod=licencia&secc=guardar',NULL,NULL),(53,4,'TITULOS','Registro de títulos del empleado ',15,39,'mod=titulos&secc=guardar',NULL,NULL),(54,4,'FAMILIARES','Registro de familiares del empleado',16,39,'mod=familiares&secc=guardar',NULL,NULL),(55,4,'RECORD','Registro del record del personal',17,39,'mod=record&secc=lista',NULL,NULL),(56,4,'PERFIL','Cambio de credenciales',19,0,'mod=perfil',NULL,NULL),(57,3,'PROVEEDORES',NULL,17,19,'mod=proveedores&secc=guardar',NULL,NULL),(59,4,'BENEFICIOS','',18,0,'',NULL,NULL),(60,4,'ARTICULOS','Vinculación de beneficios',21,59,'mod=articulos&secc=guardar',NULL,NULL),(61,4,'BENEFICIOS','Registro de beneficios',20,59,'mod=beneficios&secc=guardar',NULL,NULL),(62,4,'ASIGNACION','Registro de benficios a empleados',22,59,'mod=asignacion&secc=guardar',NULL,NULL),(63,3,'ACTA DESCARGO','registro de descargos',20,30,'mod=acta descargo&secc=guardar',NULL,NULL),(64,5,'Gestión de Transporte','Registro de solicitudes de Misiones Oficiales',1,NULL,'NULL','transporte.png',4),(65,5,'Crear solicitud de Misión Oficial','Ingreso de nueva solicitud de prestamo vehicular',1,64,'transporte/solicitud','',4),(66,5,'Control de solicitudes','Aprobar/Rechazar solicitudes hechas por los usuarios',2,64,'transporte/control_solicitudes','',3),(67,5,'Ver solicitudes','Ver el estado actual de las solicitudes hechas',3,64,'transporte/ver_solicitudes','',4),(68,5,'Asignación de vehículo/motorista','Establecer el vehículo y motorista a utilizar en una Misión Oficial',4,64,'transporte/asignar_vehiculo_motorista','',3),(69,5,'Ingreso de vales de combustible','Ingreso de vales de combustible',1,76,'vales/ingreso_vales','',2),(70,5,'Control de salidas/entradas','Registro del estado inicial y final del vehículo',5,64,'transporte/control_salidas_entradas','',3),(71,5,'Reportes y formularios','Consolidado de datos para exportación a hoja electronica/pdf',6,64,'NULL','',4),(72,5,'Solicitud de Misión Oficial','Exportación a pdf de una solicitud',1,71,'transporte/reporte_solicitud','',4),(73,5,'Control de salidas/entradas','Exportación a hoja electrónica/pdf de los movimientos de los vehículos',2,71,'transporte/reporte_salidas_entradas','',3),(74,5,'Bitácora de vehículos','Exportación a hoja electrónica/pdf de los movimientos del historial de viajes por vehículo',3,71,'transporte/bitacora_vehiculos','',3),(75,5,'Rediminiento vehicular','Exportación a hoja electrónica/pdf del rendimiento por combustible de los vehículos',4,71,'transporte/reporte_vehicular','',3),(76,5,'Vales de Combustible','Registro y Asignación de vales de combustible',2,NULL,'NULL','vales.png',3),(77,5,'Cerrar Sesión','Salir del Sistema',5,NULL,'sessiones/cerrar_session','cerrar.png',4),(78,5,'Mantenimiento Vehicular','Registro de vehiculos, presupuestos y mantenimientos',3,NULL,'NULL','mantenimiento.png',4),(79,5,'Control de vehículos','Gestión de vehículos ',1,78,'vehiculo/vehiculos','',4),(80,5,'Control de presupuestos','Gestión de presupuestos',2,78,'vehiculo/presupuestos','',4),(81,5,'Requisición de combustible','Ingreso de solicitud de combustible',2,76,'vales/ingreso_requisicion','',3),(82,5,'Consumo de combustible','Control de consumo diario de combustible',5,76,'vales/ingreso_consumo','',4),(83,5,'Usuarios','Control de usuarios y roles',4,NULL,'NULL','user.png',1),(84,5,'Control de roles','Creación, modificación y eliminacón de roles',1,83,'usuarios/roles','',1),(85,5,'Control de usuarios','Creación, modificación y eliminacón de usuarios',2,83,'usuarios/usuario','',1),(86,5,'Autorizar Requisiciones','Muestra las requisiciones con visto bueno',3,76,'vales/autorizacion','',1),(87,5,'Entrega de Vales','Muestra las requisiciones autorizadas para que puedan ser entregadas',4,76,'vales/entrega','',1),(88,5,'Asignaciones de Vales','Permite modificar, agregar o eliminar las asignaciones de vales ',5,76,'vales/asignaciones','',1),(89,5,'Ver requisiciones','Muestra es estado e informacion de la requisicion',6,76,'vales/ver_requisiciones','',1),(90,7,'Inicio','Dashboard de información del sistema',1,NULL,NULL,'fa fa-home',2),(91,7,'Reportes','Consolidado de datos para exportación a hoja electronica/pdf',6,NULL,NULL,'fa fa-file-text',1),(92,7,'Promociones','Reporte de promociones realizadas',1,85,'promocion/promociones','fa fa-caret-right',1),(93,7,'Promoción','Ingreso de toda la información relacionada a las empresas',2,NULL,NULL,'fa fa-building-o',2),(94,7,'Registrar institución','Ingreso de la información básica de una institución',1,87,'promocion/general','fa fa-caret-right',1),(95,7,'Registrar promoción','Ingreso de la visita a una institución',5,87,'promocion/ingreso','fa fa-caret-right',2),(96,7,'Programar visita','Asignación de visitas a empresas a los promotores',3,87,'promocion/programa','fa fa-caret-right',2),(97,7,'Acreditación',NULL,3,NULL,NULL,'glyphicon glyphicon-check',2),(98,7,'Programar capacitación','Programar capacitación para las instituciones',2,91,'acreditacion/capacitacion','fa fa-caret-right',2),(99,7,'Control asistencia','Regsitro de asistencia a las capacitaciones',3,91,'acreditacion/asistencia','fa fa-caret-right',2),(100,7,'Acreditar institución','Guardar registro de acreditación de una institución',4,91,'acreditacion/ingreso','fa fa-caret-right',2),(101,7,'Verificación',NULL,4,NULL,NULL,'fa fa-th-list',2),(102,7,'Programar visita','Asignación de visitas a las instituciones a los promotores',1,95,'verificacion/programa','fa fa-caret-right',2),(103,7,'Ingreso de control de visita','Verificación de cumpliemiento de la capacitación',2,95,'verificacion/ingreso','fa fa-caret-right',2),(104,7,'Usuarios','Control de usuarios y roles',5,NULL,NULL,'glyphicon glyphicon-user',1),(105,7,'Control de roles','Creación, modificación y eliminacón de roles',1,98,'usuarios/roles','fa fa-caret-right',1),(106,7,'Control de usuarios','Creación, modificación y eliminacón de usuarios',2,98,'usuarios/usuario','fa fa-caret-right',1),(107,7,'Registrar lugares de trabajo','Ingreso de la información básica de una institución',2,87,'promocion/lugares_trabajo','fa fa-caret-right',1),(108,7,'Registrar participantes','Ingreso de los empleados del lugar de trabajo que asistirán a la capacitación',1,91,'acreditacion/participantes','fa fa-caret-right',2),(109,7,'Ver asignaciones','Calendarización de visitas a instituciones',4,87,'promocion/ver_asignaciones','fa fa-caret-right',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;