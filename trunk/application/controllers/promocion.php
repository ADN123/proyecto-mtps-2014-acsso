<?php
class Promocion extends CI_Controller
{
    
    function Promocion()
	{
        parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		error_reporting(0);
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('seguridad_model');
		
		if(!$this->session->userdata('id_usuario')){
		 	redirect('index.php/sessiones');
		}
    }
	
	function index()
	{
		ir_a("index.php/promocion/general");
  	}
	
	/*
	*	Nombre: general
	*	Objetivo: Carga la vista dashboard
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 04/07/2014
	*	Observaciones: Todavia no mustra ningun dato estadistico.
	*/
	function general()
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Ddatos_generales); 
		if($data['id_permiso']!=NULL) {
			$data=$this->seguridad_model->sexoUsuario($this->session->userdata('id_usuario'));
			$data=$data[0];
			pantalla('home',$data,Ddatos_generales);
		}
		else {
			pantalla_error();
		}
	}
}
?>