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
		
		if(!$this->session->userdata('id_usuario')){
		 	redirect('index.php/sessiones');
		}
    }
	
	function index()

	{	$data=$this->seguridad_model->sexoUsuario($this->session->userdata('id_usuario'));
		$data=$data[0];
	 	pantalla('home',$data);
	}
}
?>