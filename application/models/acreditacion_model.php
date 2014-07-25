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
	
}
?>