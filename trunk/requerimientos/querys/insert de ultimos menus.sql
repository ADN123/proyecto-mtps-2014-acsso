UPDATE org_modulo SET id_modulo='90', id_sistema='7', nombre_modulo='Inicio', descripcion_modulo='Dashboard de información del sistema', orden='1', dependencia=NULL, url_modulo=NULL, img_modulo='fa fa-home', opciones_modulo='2' WHERE (id_modulo='90');
UPDATE org_modulo SET id_modulo='91', id_sistema='7', nombre_modulo='Reportes', descripcion_modulo='Consolidado de datos para exportación a hoja electronica/pdf', orden='6', dependencia=NULL, url_modulo=NULL, img_modulo='fa fa-file-text', opciones_modulo='1' WHERE (id_modulo='91');
UPDATE org_modulo SET id_modulo='92', id_sistema='7', nombre_modulo='Promociones', descripcion_modulo='Reporte de promociones realizadas', orden='1', dependencia='91', url_modulo='promocion/promociones', img_modulo='fa fa-caret-right', opciones_modulo='1' WHERE (id_modulo='92');
UPDATE org_modulo SET id_modulo='93', id_sistema='7', nombre_modulo='Promoción', descripcion_modulo='Ingreso de toda la información relacionada a las empresas', orden='2', dependencia=NULL, url_modulo=NULL, img_modulo='fa fa-building-o', opciones_modulo='2' WHERE (id_modulo='93');
UPDATE org_modulo SET id_modulo='94', id_sistema='7', nombre_modulo='Registrar empleador', descripcion_modulo='Ingreso de la información básica de empleador', orden='1', dependencia='93', url_modulo='promocion/general', img_modulo='fa fa-caret-right', opciones_modulo='1' WHERE (id_modulo='94');
UPDATE org_modulo SET id_modulo='95', id_sistema='7', nombre_modulo='Registrar promoción', descripcion_modulo='Ingreso de la visita a lugar de trabajo', orden='5', dependencia='93', url_modulo='promocion/ingreso', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='95');
UPDATE org_modulo SET id_modulo='96', id_sistema='7', nombre_modulo='Programar visita', descripcion_modulo='Asignación de visitas a empresas por promotores', orden='3', dependencia='93', url_modulo='promocion/programa', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='96');
UPDATE org_modulo SET id_modulo='97', id_sistema='7', nombre_modulo='Capacitación', descripcion_modulo=NULL, orden='3', dependencia=NULL, url_modulo=NULL, img_modulo='fa fa-group', opciones_modulo='2' WHERE (id_modulo='97');
UPDATE org_modulo SET id_modulo='98', id_sistema='7', nombre_modulo='Programar capacitación', descripcion_modulo='Programar capacitación de lugares de trabajo', orden='2', dependencia='97', url_modulo='acreditacion/capacitacion', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='98');
UPDATE org_modulo SET id_modulo='99', id_sistema='7', nombre_modulo='Control asistencia', descripcion_modulo='Regsitro de asistencia a capacitaciones', orden='3', dependencia='97', url_modulo='acreditacion/asistencia', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='99');
UPDATE org_modulo SET id_modulo='100', id_sistema='7', nombre_modulo='Acreditación', descripcion_modulo=NULL, orden='4', dependencia=NULL, url_modulo=NULL, img_modulo='glyphicon glyphicon-check', opciones_modulo='2' WHERE (id_modulo='100');
UPDATE org_modulo SET id_modulo='101', id_sistema='7', nombre_modulo='Verificación', descripcion_modulo=NULL, orden='5', dependencia=NULL, url_modulo=NULL, img_modulo='fa fa-th-list', opciones_modulo='2' WHERE (id_modulo='101');
UPDATE org_modulo SET id_modulo='102', id_sistema='7', nombre_modulo='Programar visita', descripcion_modulo='Asignación de visitas a lugares de trabajo', orden='1', dependencia='101', url_modulo='verificacion/programa', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='102');
UPDATE org_modulo SET id_modulo='103', id_sistema='7', nombre_modulo='Ingreso de control de visita', descripcion_modulo='Verificación de cumpliemiento de capacitación', orden='2', dependencia='101', url_modulo='verificacion/ingreso', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='103');
UPDATE org_modulo SET id_modulo='104', id_sistema='7', nombre_modulo='Usuarios', descripcion_modulo='Control de usuarios y roles', orden='6', dependencia=NULL, url_modulo=NULL, img_modulo='glyphicon glyphicon-user', opciones_modulo='1' WHERE (id_modulo='104');
UPDATE org_modulo SET id_modulo='105', id_sistema='7', nombre_modulo='Control de roles', descripcion_modulo='Creación, modificación y eliminacón de roles', orden='1', dependencia='104', url_modulo='usuarios/roles', img_modulo='fa fa-caret-right', opciones_modulo='1' WHERE (id_modulo='105');
UPDATE org_modulo SET id_modulo='106', id_sistema='7', nombre_modulo='Control de usuarios', descripcion_modulo='Creación, modificación y eliminacón de usuarios', orden='2', dependencia='104', url_modulo='usuarios/usuario', img_modulo='fa fa-caret-right', opciones_modulo='1' WHERE (id_modulo='106');
UPDATE org_modulo SET id_modulo='107', id_sistema='7', nombre_modulo='Registrar lugares de trabajo', descripcion_modulo='Ingreso de la información básica de lugares de trabajo', orden='2', dependencia='93', url_modulo='promocion/lugares_trabajo', img_modulo='fa fa-caret-right', opciones_modulo='1' WHERE (id_modulo='107');
UPDATE org_modulo SET id_modulo='108', id_sistema='7', nombre_modulo='Registrar participantes', descripcion_modulo='Ingreso de empleados de lugares de trabajo que asistirán a capacitación', orden='1', dependencia='97', url_modulo='acreditacion/participantes', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='108');
UPDATE org_modulo SET id_modulo='109', id_sistema='7', nombre_modulo='Ver asignaciones', descripcion_modulo='Calendarización de visitas a lugares de trabajo', orden='4', dependencia='93', url_modulo='promocion/ver_asignaciones', img_modulo='fa fa-caret-right', opciones_modulo='2' WHERE (id_modulo='109');

INSERT INTO org_modulo (id_sistema, nombre_modulo, descripcion_modulo, orden, dependencia, url_modulo, img_modulo, opciones_modulo) VALUES ('7', 'Registrar comité', 'Registro de conformación de comité', '1', '100', 'acreditacion/registrar_comite', 'fa fa-caret-right', '2');
INSERT INTO org_modulo (id_sistema, nombre_modulo, descripcion_modulo, orden, dependencia, url_modulo, img_modulo, opciones_modulo) VALUES ('7', 'Aprobar comité', 'Aprobación del registro de conformación de comité', '2', '100', 'acreditacion/aprobar_comite', 'fa fa-caret-right', '2');
INSERT INTO org_modulo (id_sistema, nombre_modulo, descripcion_modulo, orden, dependencia, url_modulo, img_modulo, opciones_modulo) VALUES ('7', 'Imprimir acreditación', 'Impresión de acreditaciones válidadas ', '3', '100', 'acreditacion/imprimir_acreditacion', 'fa fa-caret-right', '2');