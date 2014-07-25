<?php
class Acreditacion extends CI_Controller
{
    function Acreditacion()
	{
        parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		error_reporting(0);
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('seguridad_model');
		$this->load->model('promocion_model');
		$this->load->model('acreditacion_model');
		
		if(!$this->session->userdata('id_usuario')){
		 	redirect('index.php/sessiones');
		}
    }
	
	function index()
	{
		ir_a("index.php/acreditacion/participantes");
  	}
	
	/*
	*	Nombre: participantes
	*	Objetivo: Carga la vista del formulario de ingreso de empleados del lugar de trabajo que asistirán a la capacitación
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 24/07/2014
	*	Observaciones: Ninguna.
	*/
	function participantes($accion_transaccion=NULL, $estado_transaccion=NULL)
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dparticipantes); 
		if($data['id_permiso']==3) {
			$data['insticion_lugar_trabajo']=$this->acreditacion_model->insticion_lugar_trabajo();
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('acreditacion/participantes',$data,Dparticipantes);
		}
		else {
			pantalla_error();
		}
	}
}
?>