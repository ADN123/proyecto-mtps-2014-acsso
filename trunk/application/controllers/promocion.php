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
		$this->load->model('promocion_model');
		$this->load->model('transporte_model');
		
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
	*	Objetivo: Carga la vista del formulario de ingreso de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function general($accion_transaccion=NULL, $estado_transaccion=NULL)
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Ddatos_generales); 
		if($data['id_permiso']==3) {
			$data['clasificacion']=$this->promocion_model->mostrar_clasificacion();
			$data['sector']=$this->promocion_model->mostrar_sector();
			$data['institucion']=$this->promocion_model->mostrar_institucion(1);
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('promocion/ingreso_institucion',$data,Ddatos_generales);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: guardar_promocion
	*	Objetivo: Guarda el formulario de ingreso de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function guardar_promocion()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Ddatos_generales);
		if($data['id_permiso']==3){
			$this->db->trans_start();
			
			$nombre_institucion=$this->input->post('nombre_institucion');
			$nit_empleador=$this->input->post('nit_empleador');
			
			$nombre_representante=$this->input->post('nombre_representante');
			$id_clasificacion=($this->input->post('id_clasificacion')=='')?'NULL':$this->input->post('id_clasificacion');
			$id_sector=($this->input->post('id_sector')=='')?'NULL':$this->input->post('id_sector');
			$sindicato=$this->input->post('sindicato');
			
			$fecha_creacion=date('Y-m-d H:i:s');
			$id_usuario_crea=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'nombre_institucion'=>$nombre_institucion,
				'nit_empleador'=>$nit_empleador,
				'nombre_representante'=>$nombre_representante,
				'id_clasificacion'=>$id_clasificacion,
				'id_sector'=>$id_sector,
				'sindicato'=>$sindicato,
				'fecha_creacion'=>$fecha_creacion,
				'id_usuario_crea'=>$id_usuario_crea,
			);
			$this->promocion_model->guardar_promocion($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/promocion/general/1/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: eliminar_institucion
	*	Objetivo: desactiva una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function eliminar_institucion($id_institucion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Ddatos_generales);
		if($data['id_permiso']==3){
			$this->db->trans_start();
			
			$fecha_modificacion=date('Y-m-d H:i:s');
			$id_usuario_modifica=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'id_institucion'=>$id_institucion,
				'fecha_modificacion'=>$fecha_modificacion,
				'id_usuario_modifica'=>$id_usuario_modifica,
			);
			$this->promocion_model->eliminar_institucion($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/promocion/general/3/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: lugares_trabajo
	*	Objetivo: Carga la vista del formulario de ingreso de un lugar de trabajo de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function lugares_trabajo($accion_transaccion=NULL, $estado_transaccion=NULL)
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dlugares_trabajo); 
		if($data['id_permiso']==3) {
			$data['institucion']=$this->promocion_model->mostrar_institucion(1);
			$data['tipo_lugar_trabajo']=$this->promocion_model->mostrar_tipo_lugar_trabajo();
			$data['municipio']=$this->promocion_model->mostrar_municipio();
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('promocion/ingreso_lugar_trabajo',$data,Dlugares_trabajo);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: guardar_lugar_trabajo
	*	Objetivo: Guarda el formulario de ingreso de un lugar de trabajo
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function guardar_lugar_trabajo()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dlugares_trabajo);
		if($data['id_permiso']==3){
			$this->db->trans_start();
			
			$id_institucion=$this->input->post('id_institucion');
			$id_tipo_lugar_trabajo=$this->input->post('id_tipo_lugar_trabajo');
			$nombre_lugar=$this->input->post('nombre_lugar');
			$direccion_lugar=$this->input->post('direccion_lugar');
			$id_municipio=$this->input->post('id_municipio');
			
			$nombre_contacto=$this->input->post('nombre_contacto');
			$telefono=$this->input->post('telefono');
			$correo=$this->input->post('correo');
			$total_hombres=($this->input->post('total_hombres')=="")?0:$this->input->post('total_hombres');
			$total_mujeres=($this->input->post('total_mujeres')=="")?0:$this->input->post('total_mujeres');
			
			$fecha_creacion=date('Y-m-d H:i:s');
			$id_usuario_crea=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'id_institucion'=>$id_institucion,
				'id_tipo_lugar_trabajo'=>$id_tipo_lugar_trabajo,
				'nombre_lugar'=>$nombre_lugar,
				'direccion_lugar'=>$direccion_lugar,
				'id_municipio'=>$id_municipio,
				'nombre_contacto'=>$nombre_contacto,
				'telefono'=>$telefono,
				'correo'=>$correo,
				'total_hombres'=>$total_hombres,
				'total_mujeres'=>$total_mujeres,
				'fecha_creacion'=>$fecha_creacion,
				'id_usuario_crea'=>$id_usuario_crea,
			);
			$this->promocion_model->guardar_lugar_trabajo($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/promocion/lugares_trabajo/1/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: eliminar_lugar_trabajo
	*	Objetivo: desactiva un lugar de trabajo
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function eliminar_lugar_trabajo($id_institucion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dlugares_trabajo);
		if($data['id_permiso']==3){
			$this->db->trans_start();
			
			$fecha_modificacion=date('Y-m-d H:i:s');
			$id_usuario_modifica=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'id_lugar_trabajo'=>$id_institucion,
				'fecha_modificacion'=>$fecha_modificacion,
				'id_usuario_modifica'=>$id_usuario_modifica,
			);
			$this->promocion_model->eliminar_lugar_trabajo($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/promocion/lugares_trabajo/3/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: lugares_trabajo_empresa
	*	Objetivo: Muestra todos los lugares de trabajo de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 15/07/2014
	*	Observaciones: Ninguna.
	*/
	function lugares_trabajo_empresa($id_institucion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dlugares_trabajo); 
		if($data['id_permiso']==3) {
			$data['lugar_trabajo']=$this->promocion_model->lugares_trabajo_empresa($id_institucion);
			$this->load->view('promocion/lugares_trabajo_empresa',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: programa
	*	Objetivo: Carga la vista que contiene el formulario de ingreso de programacion de visitas
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function programa($accion_transaccion=NULL, $estado_transaccion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			switch($data['id_permiso']) {
				case 3:
					$data['tecnico']=$this->promocion_model->mostrar_tecnicos();
					break;
				case 4:
					$id_seccion=$this->transporte_model->consultar_seccion_usuario($this->session->userdata('nr'));
					if(!$this->promocion_model->es_san_salvador($id_seccion['id_seccion']))	
						$data['tecnico']=$this->promocion_model->mostrar_tecnicos($id_seccion['id_seccion'],2);
					else
						$data['tecnico']=$this->promocion_model->mostrar_tecnicos($id_seccion['id_seccion'],1);
					break;
			}
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('promocion/programacion',$data,Dprogramar_visita_1);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: institucion_visita
	*	Objetivo: Muestra todos los lugares de trabajo de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function institucion_visita($id_empleado=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$info=$this->seguridad_model->info_empleado($id_empleado, "id_seccion");
			$dep=$this->promocion_model->ubicacion_departamento($info["id_seccion"]);
			$data['institucion']=$this->promocion_model->institucion_visita($dep);
			$this->load->view('promocion/institucion_visita',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: lugares_trabajo_institucion_visita
	*	Objetivo: Muestra todos los lugares de trabajo de una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Esta funcion permite filtrar si se desea que un lugar de trabajo no puede tener dos visitas activas.
	*/
	function lugares_trabajo_institucion_visita($id_empleado=NULL,$id_institucion=NULL,$vacio=1)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$mostrar_todos=FALSE;
			$info=$this->seguridad_model->info_empleado($id_empleado, "id_seccion");
			$dep=$this->promocion_model->ubicacion_departamento($info["id_seccion"]);
			$data['lugar_trabajo']=$this->promocion_model->lugares_trabajo_institucion_visita($dep,$id_institucion,$mostrar_todos);
			$data['vacio']=$vacio;
			$this->load->view('promocion/lugares_trabajo_empresa_visita',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: comprobar_programacion
	*	Objetivo: Verifica que el tecnico seleccionado no tenga una visita preveiamente programada en el dia y hora seleccionados
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function comprobar_programacion($estado_programacion=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$id_empleado=$this->input->post('id_empleado');
			$id_lugar_trabajo=$this->input->post('id_lugar_trabajo');
			$fec=str_replace("/","-",$this->input->post('fecha_visita'));
			$fecha_visita=date("Y-m-d", strtotime($fec));
			$hora_visita=$this->input->post('hour').':'.$this->input->post('minute').':00 '.$this->input->post('meridian');
			$hora_visita=date("H:i:s", strtotime($hora_visita));
			$hora_visita_final=date("H:i:s", strtotime($hora_visita)+3600);
			
			$formuInfo = array(
				'id_empleado'=>$id_empleado,
				'id_lugar_trabajo'=>$id_lugar_trabajo,
				'fecha_visita'=>$fecha_visita,
				'hora_visita'=>$hora_visita,
				'hora_visita_final'=>$hora_visita_final,
				'estado_programacion'=>$estado_programacion
			);
			
			$json =array(
				'resultado'=>$this->promocion_model->comprobar_programacion($formuInfo)
			);
		}
		else {
			$json =array(
				'resultado'=>0
			);
		}
		echo json_encode($json);
	}
	
	function guardar_programacion()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1);
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$this->db->trans_start();
			
			$id_empleado=$this->input->post('id_empleado');
			$id_lugar_trabajo=$this->input->post('id_lugar_trabajo');
			$fec=str_replace("/","-",$this->input->post('fecha_visita'));
			$fecha_visita=date("Y-m-d", strtotime($fec));
			$hora_visita=$this->input->post('hour').':'.$this->input->post('minute').':00 '.$this->input->post('meridian');
			$hora_visita=date("H:i:s", strtotime($hora_visita));
			$hora_visita_final=date("H:i:s", strtotime($hora_visita)+3600);
			$fecha_creacion=date('Y-m-d H:i:s');
			$id_usuario_crea=$this->session->userdata('id_usuario');
			
			$formuInfo = array(
				'id_empleado'=>$id_empleado,
				'id_lugar_trabajo'=>$id_lugar_trabajo,
				'fecha_visita'=>$fecha_visita,
				'hora_visita'=>$hora_visita,
				'hora_visita_final'=>$hora_visita_final,
				'fecha_creacion'=>$fecha_creacion,
				'id_usuario_crea'=>$id_usuario_crea
			);
			$this->promocion_model->guardar_programacion($formuInfo);
			
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/promocion/programa/1/".$tr);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: calendario
	*	Objetivo: Muestra el calendario mensual de las visitas programadas
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function calendario($id_empleado=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$data['visita']=$this->promocion_model->calendario($id_empleado);
			$this->load->view('promocion/calendario',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	function calendario_dia($id_empleado=NULL,$fecha)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_1); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
		  	$data['visita']=$this->promocion_model->calendario_dia($id_empleado, $fecha);
			$this->load->view('promocion/calendario_dia',$data);
		}
		else {
			pantalla_error();
		}
	}
}
?>