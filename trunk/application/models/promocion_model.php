<?php

class Promocion_model extends CI_Model {
    //constructor de la clase
    function __construct() 
	{
        //LLamar al constructor del Modelo
        parent::__construct();
	
    }
	
	function mostrar_clasificacion() 
	{
		$sentencia="SELECT id_clasificacion AS id, nombre_clasificacion AS nombre FROM sac_clasificacion_institucion";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function mostrar_sector() 
	{
		$sentencia="SELECT id_sector AS id, nombre_sector AS nombre FROM sac_sector_institucion";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function guardar_promocion($formuInfo)
	{
		extract($formuInfo);
		$sentencia="INSERT INTO sac_institucion
					(nombre_institucion, nit_empleador, nombre_representante, id_clasificacion, id_sector, sindicato, fecha_creacion, id_usuario_crea) 
					VALUES 
					('$nombre_institucion', '$nit_empleador', '$nombre_representante', $id_clasificacion, $id_sector, '$sindicato', '$fecha_creacion', $id_usuario_crea)";
		$this->db->query($sentencia);
	}
	
	function mostrar_institucion($estado=NULL) 
	{
		if($estado!=NULL)
			$where="WHERE estado=1";
		$sentencia="SELECT id_institucion AS id, nombre_institucion AS nombre FROM sac_institucion ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function eliminar_institucion($formuInfo) 
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_institucion SET estado=0, fecha_modificacion='$fecha_modificacion', id_usuario_modifica=$id_usuario_modifica WHERE id_institucion=".$id_institucion;
		$this->db->query($sentencia);
	}
	
	function mostrar_tipo_lugar_trabajo() 
	{
		$sentencia="SELECT id_tipo_lugar_trabajo AS id, nombre_tipo AS nombre FROM sac_tipo_lugar_trabajo";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function mostrar_municipio() 
	{
		$sentencia="SELECT org_municipio.id_municipio AS id, LOWER(CONCAT_WS(', ', org_departamento.departamento, org_municipio.municipio)) AS nombre
					FROM org_municipio
					INNER JOIN org_departamento ON org_municipio.id_departamento_pais = org_departamento.id_departamento
					ORDER BY org_departamento.departamento, org_municipio.municipio";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function guardar_lugar_trabajo($formuInfo)
	{
		extract($formuInfo);		
		$sentencia="INSERT INTO sac_lugar_trabajo
					(id_institucion, id_tipo_lugar_trabajo, nombre_lugar, direccion_lugar, id_municipio, nombre_contacto, telefono, correo, total_hombres, total_mujeres, fecha_creacion, id_usuario_crea) 
					VALUES 
					($id_institucion, $id_tipo_lugar_trabajo, '$nombre_lugar', '$direccion_lugar', $id_municipio, '$nombre_contacto', '$telefono', '$correo', $total_hombres, $total_mujeres, '$fecha_creacion', $id_usuario_crea)";
		$this->db->query($sentencia);
	}
	
	function eliminar_lugar_trabajo($formuInfo) 
	{
		extract($formuInfo);
		$sentencia="UPDATE sac_lugar_trabajo SET estado=0, fecha_modificacion='$fecha_modificacion', id_usuario_modifica=$id_usuario_modifica WHERE id_lugar_trabajo=".$id_lugar_trabajo;
		$this->db->query($sentencia);
	}
	
	function lugares_trabajo_empresa($id_institucion=NULL)
	{
		if($id_institucion!=NULL)
			$sentencia="SELECT id_lugar_trabajo AS id, nombre_lugar AS nombre FROM sac_lugar_trabajo WHERE estado=1 AND id_institucion=".$id_institucion;
		else
			$sentencia="SELECT id_lugar_trabajo AS id, nombre_lugar AS nombre FROM sac_lugar_trabajo WHERE estado=1";
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function mostrar_tecnicos()
	{
	
	}
}
?>