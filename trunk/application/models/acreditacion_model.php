<?php

class Acreditacion_model extends CI_Model {
	
	/*Secciones que no pertenecen a San Salvador*/
	public $secciones=array(52,53,54,55,56,57,58,59,60,61,64,65,66); 
	
    function __construct() 
	{
		parent::__construct();
    }
	
	function insticion_lugar_trabajo($dep=NULL,$sin_vacios=1) 
	{
		$where="";
		if($sin_vacios==1)
			$where.=" 	AND id_tipo_lugar_trabajo NOT LIKE '' 
						AND sac_lugar_trabajo.id_municipio NOT LIKE '' 
						AND nombre_lugar NOT LIKE '' 
						AND direccion_lugar NOT LIKE '' 
						AND nombre_contacto NOT LIKE '' 
						AND telefono NOT LIKE '' 
						AND total_hombres NOT LIKE '' 
						AND total_mujeres NOT LIKE ''";
		if($dep!=NULL)
			$where.=" 	AND id_departamento_pais=".$dep;
		$sentencia="SELECT
					id_lugar_trabajo AS id,
					CONCAT_WS(' - ',nombre_institucion,nombre_lugar) AS nombre
					FROM sac_lugar_trabajo
					INNER JOIN sac_institucion ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					LEFT JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
					WHERE sac_lugar_trabajo.estado<>0 ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function tipo_representacion()
	{
		$sentencia="SELECT id_tipo_representacion AS id, nombre_tipo_representacion AS nombre FROM sac_tipo_representacion";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function tipo_inscripcion()
	{
		$sentencia="SELECT id_tipo_inscripcion AS id, nombre AS nombre FROM sac_tipo_inscripcion";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function guardar_participante($formuInfo)
	{
		extract($formuInfo);
		$sentencia="INSERT INTO sac_empleado_institucion
					(id_lugar_trabajo, id_tipo_representacion, nombre_empleado, dui_empleado, cargo_empleado, id_tipo_inscripcion, fecha_creacion, id_usuario_crea) 
					VALUES 
					($id_lugar_trabajo, $id_tipo_representacion, '$nombre_empleado', '$dui_empleado', '$cargo_empleado', $id_tipo_inscripcion, '$fecha_creacion', $id_usuario_crea)";
		$this->db->query($sentencia);
	}
	
	function empleados_lugar_trabajo($id_lugar_trabajo=NULL, $empleados="")
	{
		$where="";
		if($id_lugar_trabajo!=NULL)
			$where=" AND id_lugar_trabajo=".$id_lugar_trabajo;
		if($empleados!="") {
			$emp=explode("-",$empleados);
			for($i=0;$i<(count($emp)-1);$i++) {
				$where.=" AND id_empleado_institucion <> ".$emp[$i];
			}
		}
		/*$sentencia="SELECT id_empleado_institucion AS id, nombre_empleado AS nombre FROM sac_empleado_institucion WHERE estado_empleado=1 AND id_tipo_inscripcion<>2 ".$where;*/
		$sentencia="SELECT id_empleado_institucion AS id, nombre_empleado AS nombre, delegado, sindicato FROM sac_empleado_institucion WHERE estado_empleado=1 ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function eliminar_participante($formuInfo) 
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_empleado_institucion SET estado_empleado=0, fecha_modificacion='$fecha_modificacion', id_usuario_modifica=$id_usuario_modifica WHERE id_empleado_institucion=".$id_empleado_institucion;
		$this->db->query($sentencia);
	}
	
	function empleado_institucion($id_empleado_institucion)
	{
		$sentencia="SELECT
					id_empleado_institucion,
					id_lugar_trabajo,
					id_tipo_inscripcion,
					nombre_empleado,
					cargo_empleado,
					dui_empleado,
					id_tipo_representacion
					FROM sac_empleado_institucion
					WHERE id_empleado_institucion=".$id_empleado_institucion;
		$query=$this->db->query($sentencia);
		return (array)$query->row();
	}
	
	function actualizar_participante($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_empleado_institucion SET
		 			id_lugar_trabajo=$id_lugar_trabajo, 
		 			id_tipo_representacion=$id_tipo_representacion, 
		 			id_tipo_inscripcion=$id_tipo_inscripcion, 
		 			nombre_empleado='$nombre_empleado', 
		 			dui_empleado='$dui_empleado', 
		 			cargo_empleado='$cargo_empleado',
					fecha_modificacion='$fecha_modificacion', 
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_empleado_institucion=".$id_empleado_institucion;
		$this->db->query($sentencia);
	}
	
	function actualizar_participante_capacitacion($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_empleado_institucion SET
		 			dui_empleado='$dui_empleado', 
		 			cargo_empleado='$cargo_empleado',
					fecha_modificacion='$fecha_modificacion', 
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_empleado_institucion=".$id_empleado_institucion;
		$this->db->query($sentencia);
	}
	
	function guardar_capacitacion($formuInfo) 
	{
		extract($formuInfo);
		if($id_lugar_trabajo!="")
			$sentencia="INSERT INTO sac_capacitacion
						(id_lugar_trabajo, fecha_capacitacion, hora_capacitacion, id_usuario_crea, fecha_creacion) 
						VALUES 
						($id_lugar_trabajo, '$fecha_capacitacion', '$hora_capacitacion', '$id_usuario_crea', '$fecha_creacion')";
		else
			$sentencia="INSERT INTO sac_capacitacion
						(fecha_capacitacion, hora_capacitacion, id_usuario_crea, fecha_creacion) 
						VALUES 
						('$fecha_capacitacion', '$hora_capacitacion', '$id_usuario_crea', '$fecha_creacion')";
		$this->db->query($sentencia);
		return $this->db->insert_id();
	}
	
	function eliminar_empleados_capacitacion($id_capacitacion)
	{
		$sentencia="DELETE FROM sac_asistencia WHERE id_capacitacion='$id_capacitacion'";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function eliminar_tecnicos_capacitacion($id_capacitacion)
	{
		$sentencia="DELETE FROM sac_capacitador WHERE id_capacitacion='$id_capacitacion'";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function agregar_empleados_capacitacion($formuInfo)
	{
		extract($formuInfo);
		$sentencia="INSERT INTO sac_asistencia
					(id_capacitacion, id_empleado_institucion) 
					VALUES 
					($id_capacitacion, $id_empleado_institucion)";
		$this->db->query($sentencia);
	}
	
	function agregar_tecnicos_capacitacion($formuInfo)
	{
		extract($formuInfo);
		$sentencia="INSERT INTO sac_capacitador
					(id_capacitacion, id_empleado) 
					VALUES 
					($id_capacitacion, $id_empleado)";
		$this->db->query($sentencia);
	}
	
	function mostrar_capacitaciones($id_seccion=NULL,$todas=NULL)
	{
		$where="";
		if($id_seccion!=NULL) {
			
		}
		if($todas!=NULL) {
			$where.=" AND estado_capacitacion=".$todas." AND fecha_capacitacion<='".date('Y-m-d')."'";
		}
		$sentencia="SELECT
					id_capacitacion AS id,
					DATE_FORMAT(fecha_capacitacion,'%d/%m/%Y') AS fecha,
					CASE 
						WHEN sac_capacitacion.id_lugar_trabajo IS NOT NULL THEN CONCAT_WS(' - ',nombre_institucion, nombre_lugar) 
						WHEN sac_capacitacion.id_lugar_trabajo IS NULL THEN 'MTPS' 
					END AS lugar
					FROM
					sac_capacitacion
					LEFT JOIN sac_lugar_trabajo ON sac_capacitacion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
					LEFT JOIN sac_institucion ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion WHERE TRUE ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function eliminar_capacitacion($formuInfo)
	{
		extract($formuInfo);
		$sentencia="DELETE FROM sac_capacitacion WHERE id_capacitacion='$id_capacitacion'";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function ver_capacitacion($id_capacitacion) 
	{
		$sentencia="SELECT
					sac_capacitador.id_capacitacion,
					sac_capacitacion.id_lugar_trabajo,
					DATE_FORMAT(fecha_capacitacion,'%d/%m/%Y') AS fecha_capacitacion,
					DATE_FORMAT(hora_capacitacion,'%h:%i %p') AS hora_capacitacion,
					sac_capacitador.id_empleado,
					sac_empleado_institucion.id_empleado_institucion,
					sac_empleado_institucion.nombre_empleado
					FROM
					sac_capacitacion
					INNER JOIN sac_capacitador ON sac_capacitador.id_capacitacion = sac_capacitacion.id_capacitacion
					INNER JOIN sac_asistencia ON sac_asistencia.id_capacitacion = sac_capacitacion.id_capacitacion
					INNER JOIN sac_empleado_institucion ON sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
					WHERE sac_capacitador.id_capacitacion=".$id_capacitacion;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function actualizar_capacitacion($formuInfo)
	{
		
		extract($formuInfo);
		$sentencia="UPDATE sac_capacitacion SET
		 			id_lugar_trabajo=$id_lugar_trabajo, 
		 			fecha_capacitacion='$fecha_capacitacion',
		 			hora_capacitacion='$hora_capacitacion',
					fecha_modificacion='$fecha_modificacion', 
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_capacitacion=".$id_capacitacion;
		$this->db->query($sentencia);
	}
	
	function guardar_asistencia_capacitacion($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_asistencia SET
					asistio=$asistio 
					WHERE id_capacitacion=$id_capacitacion AND id_empleado_institucion=$id_empleado_institucion";
		$query=$this->db->query($sentencia);
		$sentencia="UPDATE sac_capacitacion SET
					estado_capacitacion=0 
					WHERE id_capacitacion=$id_capacitacion";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function lugares_trabajo_comite($dep=NULL,$est=NULL,$todos=NULL)
	{
		$where="";
		if($todos==NULL)
			$where.=" AND t1.inscritos=t2.capacitados";
		if($est==1)
			$where.=" AND sac_lugar_trabajo.fecha_conformacion IS NULL";
		if($est==2)
			$where.=" AND sac_lugar_trabajo.fecha_conformacion IS NOT NULL";
		$sentencia="SELECT sac_lugar_trabajo.id_lugar_trabajo AS id, CONCAT_WS(' - ',nombre_institucion,nombre_lugar) AS nombre, t1.inscritos, t2.capacitados 
					FROM sac_lugar_trabajo
					INNER JOIN (SELECT
					sac_lugar_trabajo.id_lugar_trabajo,
					Count(DISTINCT sac_asistencia.id_empleado_institucion) AS inscritos
					FROM sac_institucion
					INNER JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					INNER JOIN sac_empleado_institucion ON sac_empleado_institucion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
					INNER JOIN sac_asistencia ON sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
					GROUP BY sac_lugar_trabajo.id_lugar_trabajo) AS t1 ON sac_lugar_trabajo.id_lugar_trabajo=t1.id_lugar_trabajo
					INNER JOIN (SELECT
					sac_lugar_trabajo.id_lugar_trabajo,
					Count(DISTINCT sac_asistencia.id_empleado_institucion) AS capacitados
					FROM sac_institucion
					INNER JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					INNER JOIN sac_empleado_institucion ON sac_empleado_institucion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
					INNER JOIN sac_asistencia ON sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
					WHERE sac_asistencia.asistio=1
					GROUP BY sac_lugar_trabajo.id_lugar_trabajo) AS t2 ON sac_lugar_trabajo.id_lugar_trabajo=t2.id_lugar_trabajo
					INNER JOIN sac_institucion ON sac_lugar_trabajo.id_institucion=sac_institucion.id_institucion
					WHERE sac_lugar_trabajo.estado>=1 ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function actualizar_comite($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_lugar_trabajo SET
					fecha_conformacion='$fecha_conformacion',
					fecha_modificacion='$fecha_modificacion',
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_lugar_trabajo=$id_lugar_trabajo";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function quitar_empleados_delegados_sindicato($id_lugar_trabajo)
	{
		$sentencia="UPDATE sac_empleado_institucion SET
					delegado=NULL,
					sindicato=NULL
					WHERE id_lugar_trabajo=$id_lugar_trabajo";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function agregar_empleados_delegados($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_empleado_institucion SET
					delegado=$delegado,
					fecha_modificacion='$fecha_modificacion',
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_empleado_institucion=$id_empleado_institucion";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function agregar_empleados_sindicato($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_empleado_institucion SET
					sindicato=$sindicato,
					fecha_modificacion='$fecha_modificacion',
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_empleado_institucion=$id_empleado_institucion";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function guardar_aprobacion_comite($formuInfo)
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_lugar_trabajo SET
					estado='$estado',
					fecha_modificacion='$fecha_modificacion',
					id_usuario_modifica=$id_usuario_modifica 
					WHERE id_lugar_trabajo=$id_lugar_trabajo";
		$query=$this->db->query($sentencia);
		return true;
	}
	
	function consultar_lugar_trabajo_empleados($id_lugar_trabajo)
	{
		$sentencia="SELECT
					sac_empleado_institucion.id_empleado_institucion
					FROM sac_institucion
					LEFT JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					LEFT JOIN sac_empleado_institucion ON sac_empleado_institucion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
					LEFT JOIN sac_asistencia ON  sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
					LEFT JOIN sac_capacitacion ON sac_asistencia.id_capacitacion = sac_capacitacion.id_capacitacion
					WHERE sac_asistencia.asistio=1 AND sac_lugar_trabajo.id_lugar_trabajo=".$id_lugar_trabajo;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function consultar_lugar_trabajo($id_empleado_institucion)
	{
		$sentencia="SELECT
					CONCAT_WS(' - ',nombre_institucion,nombre_lugar) AS nombre_lugar,
					sac_capacitacion.fecha_capacitacion,
					sac_empleado_institucion.nombre_empleado
					FROM sac_institucion
					LEFT JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					LEFT JOIN sac_empleado_institucion ON sac_empleado_institucion.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
					LEFT JOIN sac_asistencia ON  sac_asistencia.id_empleado_institucion = sac_empleado_institucion.id_empleado_institucion
					LEFT JOIN sac_capacitacion ON sac_asistencia.id_capacitacion = sac_capacitacion.id_capacitacion
					WHERE sac_asistencia.asistio=1 AND sac_empleado_institucion.id_empleado_institucion=".$id_empleado_institucion." LIMIT 0,1";
		$query=$this->db->query($sentencia);
		return (array)$query->row();
	}
}
?>