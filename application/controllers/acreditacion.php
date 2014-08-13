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
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$data['insticion_lugar_trabajo']=$this->acreditacion_model->insticion_lugar_trabajo();
			$data['tipo_representacion']=$this->acreditacion_model->tipo_representacion();
			$data['tipo_inscripcion']=$this->acreditacion_model->tipo_inscripcion();
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('acreditacion/participantes',$data,Dparticipantes);
		}
		else {
			pantalla_error();
		}
	}

	/*
	*	Nombre: participantes_recargado
	*	Objetivo: Funcion que recarga el formulario para editarlo o limpiarlo 
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 27/07/2014
	*	Observaciones: Ninguna.
	*/
	function participantes_recargado($id_empleado_institucion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dparticipantes); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$data['insticion_lugar_trabajo']=$this->acreditacion_model->insticion_lugar_trabajo();
			$data['tipo_representacion']=$this->acreditacion_model->tipo_representacion();
			$data['tipo_inscripcion']=$this->acreditacion_model->tipo_inscripcion();
			if($id_empleado_institucion!=NULL)
				$data['empleado_institucion']=$this->acreditacion_model->empleado_institucion($id_empleado_institucion);			
			$this->load->view('acreditacion/participantes_recargado',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: guardar_participantes
	*	Objetivo: Guarda el formulario de ingreso de empleados de un lugar de trabajo
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 27/07/2014
	*	Observaciones: Ninguna.
	*/
	function guardar_participantes()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dparticipantes);
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$this->db->trans_start();
			
			$id_empleado_institucion=$this->input->post('id_empleado_institucion');
			$id_lugar_trabajo=$this->input->post('id_lugar_trabajo');
			$id_tipo_representacion=$this->input->post('id_tipo_representacion');
			$nombre_empleado=$this->input->post('nombre_empleado');
			$dui_empleado=$this->input->post('dui_empleado');
			$cargo_empleado=$this->input->post('cargo_empleado');
			$id_tipo_inscripcion=$this->input->post('id_tipo_inscripcion');
			
			if($id_empleado_institucion=="") {
				$fecha_creacion=date('Y-m-d H:i:s');
				$id_usuario_crea=$this->session->userdata('id_usuario');
				
				$formuInfo = array(
					'id_lugar_trabajo'=>$id_lugar_trabajo,
					'id_tipo_representacion'=>$id_tipo_representacion,
					'nombre_empleado'=>$nombre_empleado,
					'dui_empleado'=>$dui_empleado,
					'cargo_empleado'=>$cargo_empleado,
					'id_tipo_inscripcion'=>$id_tipo_inscripcion,
					'fecha_creacion'=>$fecha_creacion,
					'id_usuario_crea'=>$id_usuario_crea,
				);
				$this->acreditacion_model->guardar_participante($formuInfo);
				$tipo=1;
			}
			else {
				$fecha_modificacion=date('Y-m-d H:i:s');
				$id_usuario_modifica=$this->session->userdata('id_usuario');
				
				$formuInfo = array(
					'id_empleado_institucion'=>$id_empleado_institucion,
					'id_lugar_trabajo'=>$id_lugar_trabajo,
					'id_tipo_representacion'=>$id_tipo_representacion,
					'nombre_empleado'=>$nombre_empleado,
					'dui_empleado'=>$dui_empleado,
					'cargo_empleado'=>$cargo_empleado,
					'id_tipo_inscripcion'=>$id_tipo_inscripcion,
					'fecha_modificacion'=>$fecha_modificacion,
					'id_usuario_modifica'=>$id_usuario_modifica,
				);
				$this->acreditacion_model->actualizar_participante($formuInfo);
				$tipo=2;
			}
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/acreditacion/participantes/".$tipo."/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: empleados_lugar_trabajo
	*	Objetivo: Muestra todos los lugares de trabajo de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function empleados_lugar_trabajo($id_lugar_trabajo=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dparticipantes); 
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$data['empleados_lugar_trabajo']=$this->acreditacion_model->empleados_lugar_trabajo($id_lugar_trabajo);
			$this->load->view('acreditacion/participantes_lugar_trabajo',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	function eliminar_participante($id_empleado_institucion)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dparticipantes);
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$this->db->trans_start();
			
			$fecha_modificacion=date('Y-m-d H:i:s');
			$id_usuario_modifica=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'id_empleado_institucion'=>$id_empleado_institucion,
				'fecha_modificacion'=>$fecha_modificacion,
				'id_usuario_modifica'=>$id_usuario_modifica,
			);
			$this->acreditacion_model->eliminar_participante($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/acreditacion/participantes/3/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	function capacitacion($accion_transaccion=NULL, $estado_transaccion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {	
			switch($data['id_permiso']) {
				case 3:
					$data['tecnico']=$this->promocion_model->mostrar_tecnicos();	
					break;
				case 4:
					$id_seccion=$this->seguridad_model->consultar_seccion_usuario($this->session->userdata('nr'));
					if(!$this->promocion_model->es_san_salvador($id_seccion['id_seccion']))	
						$data['tecnico']=$this->promocion_model->mostrar_tecnicos($id_seccion['id_seccion'],2);
					else
						$data['tecnico']=$this->promocion_model->mostrar_tecnicos($id_seccion['id_seccion'],1);
					break;
			}	
			$data['insticion_lugar_trabajo']=$this->acreditacion_model->insticion_lugar_trabajo();
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('acreditacion/capacitacion',$data,Dprogramar_capacitacion);
		}
		else {
			pantalla_error();
		}
	}
	
	function capacitacion_recargado($id_capacitacion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {	
			switch($data['id_permiso']) {
				case 3:
					$data['tecnico']=$this->promocion_model->mostrar_tecnicos();	
					break;
				case 4:
					$id_seccion=$this->seguridad_model->consultar_seccion_usuario($this->session->userdata('nr'));
					if(!$this->promocion_model->es_san_salvador($id_seccion['id_seccion']))	
						$data['tecnico']=$this->promocion_model->mostrar_tecnicos($id_seccion['id_seccion'],2);
					else
						$data['tecnico']=$this->promocion_model->mostrar_tecnicos($id_seccion['id_seccion'],1);
					break;
			}	
			$data['insticion_lugar_trabajo']=$this->acreditacion_model->insticion_lugar_trabajo();
			$this->load->view('acreditacion/capacitacion_recargado',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	function mostrar_lugares_trabajo()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {	
			$data['insticion_lugar_trabajo']=$this->acreditacion_model->insticion_lugar_trabajo();
			$this->load->view('acreditacion/mostrar_lugares_trabajo',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: empleados_lugar_trabajo_capacitacion
	*	Objetivo: Muestra todos los lugares de trabajo de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 12/08/2014
	*	Observaciones: Ninguna.
	*/
	function empleados_lugar_trabajo_capacitacion($id_lugar_trabajo=NULL,$empleados="")
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion); 
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$data['empleados_lugar_trabajo']=$this->acreditacion_model->empleados_lugar_trabajo($id_lugar_trabajo,$empleados);
			$this->load->view('acreditacion/participantes_lugar_trabajo_capacitacion',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	function participantes_recargado_capacitacion($id_empleado_institucion=NULL) 
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion); 
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$data['empleado_institucion']=$this->acreditacion_model->empleado_institucion($id_empleado_institucion);			
			$this->load->view('acreditacion/participantes_recargado_capacitacion',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	function actualizar_empleado_capacitacion($id_empleado_institucion=NULL) 
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion); 
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$this->db->trans_start();

			$dui_empleado=$this->input->post('dui_empleado');
			$cargo_empleado=$this->input->post('cargo_empleado');
			
			$fecha_modificacion=date('Y-m-d H:i:s');
			$id_usuario_modifica=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'id_empleado_institucion'=>$id_empleado_institucion,
				'dui_empleado'=>$dui_empleado,
				'cargo_empleado'=>$cargo_empleado,
				'fecha_modificacion'=>$fecha_modificacion,
				'id_usuario_modifica'=>$id_usuario_modifica,
			);
			$this->acreditacion_model->actualizar_participante_capacitacion($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			$json =array(
				'resultado'=>$tr
			);
			echo json_encode($json);
		}
		else {
			pantalla_error();
		}
	}
	
	function guardar_capacitacion()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_capacitacion);
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$this->db->trans_start();
			
			$id_capacitacion=$this->input->post('id_capacitacion');
			
			$id_lugar_trabajo=$this->input->post('id_lugar_trabajo');
			$fec=str_replace("/","-",$this->input->post('fecha_capacitacion'));
			$fecha_capacitacion=date("Y-m-d", strtotime($fec));
			$hora_capacitacion=$this->input->post('hora_capacitacion');
			
			$id_empleado_institucion=$this->input->post('id_empleado_institucion');
			$id_empleado=$this->input->post('id_empleado');
			
			if($id_capacitacion=="") {
				$fecha_creacion=date('Y-m-d H:i:s');
				$id_usuario_crea=$this->session->userdata('id_usuario');
				
				$formuInfo = array(
					'id_lugar_trabajo'=>$id_lugar_trabajo,
					'fecha_capacitacion'=>$fecha_capacitacion,
					'hora_capacitacion'=>$hora_capacitacion,
					'fecha_creacion'=>$fecha_creacion,
					'id_usuario_crea'=>$id_usuario_crea,
				);
				$id_capacitacion=$this->acreditacion_model->guardar_capacitacion($formuInfo);
				$tipo=1;
			}
			else {
				$fecha_modificacion=date('Y-m-d H:i:s');
				$id_usuario_modifica=$this->session->userdata('id_usuario');
				
				$formuInfo = array(
					'id_capacitacion'=>$id_capacitacion,
					'id_lugar_trabajo'=>$id_lugar_trabajo,
					'fecha_capacitacion'=>$fecha_capacitacion,
					'hora_capacitacion'=>$hora_capacitacion,
					'fecha_modificacion'=>$fecha_modificacion,
					'id_usuario_modifica'=>$id_usuario_modifica,
				);
				$this->acreditacion_model->actualizar_capacitacion($formuInfo);
				$tipo=2;
			}
			
			$this->acreditacion_model->eliminar_empleados_capacitacion($id_capacitacion);
			$this->acreditacion_model->eliminar_tecnicos_capacitacion($id_capacitacion);
			
			for($i=0;$i<count($id_empleado_institucion);$i++) {
				$formuInfo = array(
					'id_capacitacion'=>$id_capacitacion,
					'id_empleado_institucion'=>$id_empleado_institucion[$i]
				);
				$this->acreditacion_model->agregar_empleados_capacitacion($formuInfo);
			}
			
			for($i=0;$i<count($id_empleado);$i++) {
				$formuInfo = array(
					'id_capacitacion'=>$id_capacitacion,
					'id_empleado'=>$id_empleado[$i]
				);
				$this->acreditacion_model->agregar_tecnicos_capacitacion($formuInfo);
			}
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/acreditacion/capacitacion/".$tipo."/".$tr);
		}
		else {
			pantalla_error();
		}
	}
}
?>