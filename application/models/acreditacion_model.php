<?php

class Acreditacion_model extends CI_Model {
	
	/*Secciones que no pertenecen a San Salvador*/
	public $secciones=array(52,53,54,55,56,57,58,59,60,61,64,65,66); 
	
    function __construct() 
	{
		parent::__construct();
    }
	
	function insticion_lugar_trabajo($sin_vacios=1) 
	{
		$where="";
		if($sin_vacios==1)
			$where.=" 	AND id_tipo_lugar_trabajo NOT LIKE '' 
						AND id_municipio NOT LIKE '' 
						AND nombre_lugar NOT LIKE '' 
						AND direccion_lugar NOT LIKE '' 
						AND nombre_contacto NOT LIKE '' 
						AND telefono NOT LIKE '' 
						AND total_hombres NOT LIKE '' 
						AND total_mujeres NOT LIKE ''";
		$sentencia="SELECT
					id_lugar_trabajo AS id,
					CONCAT_WS(' - ',nombre_institucion,nombre_lugar) AS nombre
					FROM sac_lugar_trabajo
					INNER JOIN sac_institucion ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					WHERE sac_lugar_trabajo.estado=1 ".$where;
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
	
	function empleados_lugar_trabajo($id_lugar_trabajo=NULL)
	{
		$where="";
		if($id_lugar_trabajo!=NULL)
			$where=" AND id_lugar_trabajo=".$id_lugar_trabajo;
		/*$sentencia="SELECT id_empleado_institucion AS id, nombre_empleado AS nombre FROM sac_empleado_institucion WHERE estado_empleado=1 AND id_tipo_inscripcion<>2 ".$where;*/
		$sentencia="SELECT id_empleado_institucion AS id, nombre_empleado AS nombre FROM sac_empleado_institucion WHERE estado_empleado=1 ".$where;
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
}
?>