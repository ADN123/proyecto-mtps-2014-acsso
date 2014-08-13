CREATE 
VIEW sac_resultado_promocion AS 
SELECT 
sac_institucion.id_institucion,
sac_institucion.id_clasificacion,
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
sac_programacion_visita.id_programacion_visita,
sac_programacion_visita.id_empleado,
tcm_empleado.nombre AS nombre_empleado,
tcm_empleado.id_usuario,
tcm_empleado.nr,
tcm_empleado.correo AS correo_empleado,
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
LEFT JOIN tcm_empleado ON tcm_empleado.id_empleado = sac_programacion_visita.id_empleado;