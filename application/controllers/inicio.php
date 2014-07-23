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
					$select=array("COUNT(id_promocion) AS total");
					$data['total_promociones']=$this->promocion_model->consultas_promociones($select);
					
					$select=array("COUNT(sac_programacion_visita.id_programacion_visita) AS total");
					$data['total_programaciones']=$this->promocion_model->consultas_promociones($select);
					break;
				case 4:
					$select=array("COUNT(id_promocion) AS total");
					$where=array("AND tcm_empleado.id_usuario=".$this->session->userdata('id_usuario'));
					$data['total_promociones']=$this->promocion_model->consultas_promociones($select,$where);
					
					$select=array("COUNT(sac_programacion_visita.id_programacion_visita) AS total");
					$where=array("AND tcm_empleado.id_usuario=".$this->session->userdata('id_usuario'));
					$data['total_programaciones']=$this->promocion_model->consultas_promociones($select);
					break;
			}
			
			$select=array("COUNT(sac_lugar_trabajo.id_lugar_trabajo) AS total");
			$where=array("AND sac_programacion_visita.id_programacion_visita IS NULL");
			$data['total_sin_programaciones']=$this->promocion_model->consultas_promociones($select,$where);
			
			$select=array("COUNT(sac_lugar_trabajo.id_lugar_trabajo) AS total");
			$data['total_lugares_trabajo']=$this->promocion_model->consultas_promociones($select);
			pantalla('home',$data,Dinicio);
		}
		else {
			pantalla_error();
		}
	}
}
?>