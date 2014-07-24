<?php
class Inicio extends CI_Controller
{
    
	
	
    function Inicio()
	{
        parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		error_reporting(0);
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('seguridad_model');
		$this->load->model('promocion_model');
		
		if(!$this->session->userdata('id_usuario')){
		 	redirect('index.php/sessiones');
		}
    }
	
	/*
	*	Nombre: index
	*	Objetivo: Carga la vista dashboard
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 23/07/2014
	*	Observaciones: Ninguna.
	*/
	function index()
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dinicio); 
		if($data['id_permiso']!=NULL) {
			switch($data['id_permiso']) {
				case 3:
					$select=array("COUNT(id_promocion) AS total1","(COUNT(id_promocion)/COUNT(id_programacion_visita)*100) AS total2");
					$data['total_promociones']=$this->promocion_model->consultas_promociones($select);
			
					$select=array("COUNT(id_lugar_trabajo) AS total");
					$where=array("AND id_programacion_visita IS NULL");
					$data['total_sin_programaciones']=$this->promocion_model->consultas_promociones($select,$where);
					
					$select=array("COUNT(id_lugar_trabajo) AS total");
					$data['total_lugares_trabajo']=$this->promocion_model->consultas_promociones($select);
					
					$data['total_promociones_departamento']=$this->promocion_model->consultas_promociones_departamentos();
					$data['total_promociones_clasificacion']=$this->promocion_model->total_promociones_clasificacion();
					$data['total_promociones_sector']=$this->promocion_model->consultas_promociones_sector();
					break;
				case 4:
					$select=array("COUNT(id_promocion) AS total1","(COUNT(id_promocion)/COUNT(id_programacion_visita)*100) AS total2");
					$where=array("AND id_usuario=".$this->session->userdata('id_usuario'));
					$data['total_promociones']=$this->promocion_model->consultas_promociones($select,$where);
					break;
			}
			pantalla('home',$data,Dinicio);
		}
		else {
			pantalla_error();
		}
	}
}
?>