<?php

class Promocion_model extends CI_Model {
	
	/*Secciones que no pertenecen a San Salvador*/
	public $secciones=array(52,53,54,55,56,57,58,59,60,61,64,65,66); 
	
    function __construct() 
	{
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
		$where="";
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
	
	function mostrar_tecnicos($id_seccion=NULL,$ss=NULL)
	{
		$where="";
		if($id_seccion!=NULL && $ss!=NULL) {
			if($ss==1) 
				for($i=0;$i<count($this->secciones);$i++)
				 	$where.=" AND id_seccion<>".$this->secciones[$i];
			else
				$where.=" AND id_seccion=".$id_seccion;
		}
		$sentencia="SELECT id_empleado AS id, nombre FROM tcm_empleado 
					WHERE (funcional LIKE 'TECNICO EN SEGURIDAD OCUPACIONAL' OR nominal LIKE 'TECNICO EN SEGURIDAD OCUPACIONAL') ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	public function ubicacion_departamento($id_seccion)
	{	
		switch($id_seccion){
			case 52:
				$id_departamento=1;
				break;
			case 53:
				$id_departamento=9;
				break;
			case 54:
				$id_departamento=4;
				break;
			case 55:
				$id_departamento=7;
				break;
			case 56:
				$id_departamento=5;
				break;
			case 57:
				$id_departamento=14;
				break;
			case 58:
				$id_departamento=13;
				break;
			case 59:
				$id_departamento=10;
				break;
			case 60:
				$id_departamento=3;
				break;
			case 61:
				$id_departamento=11;
				break;
			case 64:
				$id_departamento=8;
				break;
			case 65:
				$id_departamento=12;
				break;
			case 66:
				$id_departamento=2;
				break;
			default:
				$id_departamento=6;
		}
		return $id_departamento;
	}
	
	function institucion_visita($id_departamento)
	{
		$sentencia="SELECT DISTINCT sac_institucion.id_institucion AS id, sac_institucion.nombre_institucion AS nombre
					FROM sac_institucion
					INNER JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					INNER JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
					INNER JOIN org_departamento ON org_departamento.id_departamento = org_municipio.id_departamento_pais
					WHERE sac_institucion.estado=1 AND org_departamento.id_departamento=".$id_departamento;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function lugares_trabajo_institucion_visita($id_departamento,$id_institucion=NULL,$mostrar_todos=FALSE)
	{
		$where="";
		if($id_institucion!=NULL)
			$where.="AND sac_lugar_trabajo.id_institucion=".$id_institucion." ";
		if(!$mostrar_todos)
			$where.="AND (sac_programacion_visita.estado_programacion<>1 OR sac_programacion_visita.estado_programacion IS NULL) ";
		
		$sentencia="SELECT sac_lugar_trabajo.id_lugar_trabajo AS id, sac_lugar_trabajo.nombre_lugar AS nombre
					FROM sac_institucion
					INNER JOIN sac_lugar_trabajo ON sac_lugar_trabajo.id_institucion = sac_institucion.id_institucion
					INNER JOIN org_municipio ON org_municipio.id_municipio = sac_lugar_trabajo.id_municipio
					INNER JOIN org_departamento ON org_departamento.id_departamento = org_municipio.id_departamento_pais
					LEFT JOIN sac_programacion_visita ON sac_programacion_visita.id_lugar_trabajo = sac_lugar_trabajo.id_lugar_trabajo
					WHERE sac_lugar_trabajo.estado=1 AND org_departamento.id_departamento=".$id_departamento." ".$where;
		$query=$this->db->query($sentencia);
		return (array)$query->result_array();
	}
	
	function es_san_salvador($id_seccion)
	{	
		if(in_array($id_seccion,$this->secciones)){
			return false;
		}else{
			return true;
		}
	}
}
?>