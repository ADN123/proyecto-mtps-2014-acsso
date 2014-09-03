<?php
class Verificacion extends CI_Controller
{
	public $mostrar_todos="FALSE"; 
	
    function Verificacion()
	{
        parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		error_reporting(0);
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->library("mpdf");
		$this->load->model('seguridad_model');
		$this->load->model('promocion_model');
		$this->load->model('acreditacion_model');
		$this->load->model('verificacion_model');
		
		if(!$this->session->userdata('id_usuario')){
		 	redirect('index.php/sessiones');
		}
    }
	
	function index()
	{
		ir_a("index.php/verificacion/programa");
  	}
	
	/*
	*	Nombre: programa
	*	Objetivo: Carga la vista del formulario de registro de programacion de visitas
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 01/09/2014
	*	Observaciones: Ninguna.
	*/
	function programa($accion_transaccion=NULL, $estado_transaccion=NULL)
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
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
			$data['estado_transaccion']=$estado_transaccion;
			$data['accion_transaccion']=$accion_transaccion;
			pantalla('verificacion/programacion',$data,Dprogramar_visita_2);
		}
		else {
			pantalla_error();
		}
	}

	/*
	*	Nombre: programa_recargado
	*	Objetivo: Funcion que recarga el formulario para editarlo o limpiarlo 
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 01/09/2014
	*	Observaciones: Ninguna.
	*/
	function programa_recargado($id_programacion_visita=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
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
			if($id_programacion_visita!=NULL) {
				$data['programacion']=$this->promocion_model->buscar_programacion($id_programacion_visita);
				$data['idpv']=$id_programacion_visita;
				$info=$this->seguridad_model->info_empleado($data['programacion']['id_empleado'], "id_seccion");
				$dep=$this->promocion_model->ubicacion_departamento($info["id_seccion"]);
				$data['institucion']=$this->promocion_model->institucion_visita($dep);
				
				$data['lugar_trabajo']=$this->promocion_model->lugares_trabajo_institucion_visita($dep,$data['programacion']['id_institucion'],$this->mostrar_todos,$data['programacion']['id_lugar_trabajo']);
			}
			
			$this->load->view('verificacion/programacion_recargado',$data);
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
	function institucion_visita($id_empleado=NULL,$estado=0)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			if($estado==0) {
				$info=$this->seguridad_model->info_empleado($id_empleado, "id_seccion");
				$dep=$this->promocion_model->ubicacion_departamento($info["id_seccion"]);
				$data['institucion']=$this->verificacion_model->institucion_visita($dep);
				$this->load->view('verificacion/institucion_visita',$data);
			}
			else {
				$data['institucion']=$this->verificacion_model->insticion_lugar_trabajo($id_empleado,date('Y-m-d'));
				$this->load->view('verificacion/institucion_visita2',$data);
			}
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
	function lugares_trabajo_institucion_visita($id_empleado=NULL,$id_institucion=NULL,$id_lugar_trabajo=NULL,$vacio=1)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$info=$this->seguridad_model->info_empleado($id_empleado, "id_seccion");
			$dep=$this->promocion_model->ubicacion_departamento($info["id_seccion"]);
			if($id_lugar_trabajo!="undefined" && $id_lugar_trabajo!="" && $id_lugar_trabajo!=NULL && $id_lugar_trabajo!=0)
				$data['lugar_trabajo']=$this->verificacion_model->lugares_trabajo_institucion_visita($dep,$id_institucion,$this->mostrar_todos,$id_lugar_trabajo);
			else {
				$data['lugar_trabajo']=$this->verificacion_model->lugares_trabajo_institucion_visita($dep,$id_institucion,$this->mostrar_todos);
			}
			$data['vacio']=$vacio;
			$this->load->view('verificacion/lugares_trabajo_empresa_visita',$data);
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
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$id_programacion_visita=$this->input->post('id_programacion_visita');
			$id_empleado=$this->input->post('id_empleado');
			$id_lugar_trabajo=$this->input->post('id_lugar_trabajo');
			$fec=str_replace("/","-",$this->input->post('fecha_visita'));
			$fecha_visita=date("Y-m-d", strtotime($fec));
			$hora_visita=$this->input->post('hour').':'.$this->input->post('minute').':00 '.$this->input->post('meridian');
			$hora_visita=date("H:i:s", strtotime($hora_visita));
			$hora_visita_final=date("H:i:s", strtotime($hora_visita)+3600);
			
			//echo "*".$id_empleado."*".$id_lugar_trabajo."*".$fecha_visita."*".$hora_visita."*".$hora_visita_final;
			if($id_empleado!="" && $id_lugar_trabajo!="" && $fecha_visita!="" && $hora_visita!="" && $hora_visita_final!="") {		
				$formuInfo = array(
					'id_programacion_visita'=>$id_programacion_visita,
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
		}
		else {
			$json =array(
				'resultado'=>0
			);
		}
		echo json_encode($json);
	}
	
	/*
	*	Nombre: guardar_programacion
	*	Objetivo: Guarda el registro de asignacion de visita a una institucion
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function guardar_programacion()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2);
		if($data['id_permiso']==3 || $data['id_permiso']==4){
			$this->db->trans_start();
			
			$id_programacion_visita=$this->input->post('id_programacion_visita');
			$id_empleado=$this->input->post('id_empleado');
			$id_lugar_trabajo=$this->input->post('id_lugar_trabajo');
			$fec=str_replace("/","-",$this->input->post('fecha_visita'));
			$fecha_visita=date("Y-m-d", strtotime($fec));
			$hora_visita=$this->input->post('hour').':'.$this->input->post('minute').':00 '.$this->input->post('meridian');
			$hora_visita=date("H:i:s", strtotime($hora_visita));
			$hora_visita_final=date("H:i:s", strtotime($hora_visita)+3600);
			
			if($id_programacion_visita=="") {
				$fecha_creacion=date('Y-m-d H:i:s');
				$id_usuario_crea=$this->session->userdata('id_usuario');
				
				$formuInfo = array(
					'id_empleado'=>$id_empleado,
					'id_lugar_trabajo'=>$id_lugar_trabajo,
					'fecha_visita'=>$fecha_visita,
					'hora_visita'=>$hora_visita,
					'hora_visita_final'=>$hora_visita_final,
					'fecha_creacion'=>$fecha_creacion,
					'id_usuario_crea'=>$id_usuario_crea,
					'estado_programacion'=>3
				);
				$this->verificacion_model->guardar_programacion($formuInfo);
			}
			else {
				$fecha_modificacion=date('Y-m-d H:i:s');
				$id_usuario_modifica=$this->session->userdata('id_usuario');
				
				$formuInfo = array(
					'id_programacion_visita'=>$id_programacion_visita,
					'id_empleado'=>$id_empleado,
					'id_lugar_trabajo'=>$id_lugar_trabajo,
					'fecha_visita'=>$fecha_visita,
					'hora_visita'=>$hora_visita,
					'hora_visita_final'=>$hora_visita_final,
					'fecha_modificacion'=>$fecha_modificacion,
					'id_usuario_modifica'=>$id_usuario_modifica
				);
				$this->promocion_model->actualizar_programacion($formuInfo);
			}
			$this->db->trans_complete();
			$tr=($this->db->trans_status()===FALSE)?0:1;
			ir_a("index.php/verificacion/programa/1/".$tr);
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
	function calendario($id_empleado=NULL,$como_mostrar=0)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$data['como_mostrar']=$como_mostrar;
			$data['visita']=$this->promocion_model->calendario($id_empleado);
			$this->load->view('verificacion/calendario',$data);
		}
		else {
			pantalla_error();
		}
	}
	
	/*
	*	Nombre: calendario_dia
	*	Objetivo: Muestra el calendario diario de las visitas programadas
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function calendario_dia($id_empleado=NULL,$fecha)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dasignaciones); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
		  	$data['visita']=$this->promocion_model->calendario_dia($id_empleado, $fecha);
			$this->load->view('verificacion/calendario_dia',$data);
		}
		else {
			$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dasignaciones); 
			if($data['id_permiso']==3 || $data['id_permiso']==4) {
				$data['visita']=$this->promocion_model->calendario_dia($id_empleado, $fecha);
				$this->load->view('verificacion/calendario_dia',$data);
			}
			else {
				pantalla_error();
			}
		}
	}
	
	/*
	*	Nombre: eliminar_programacion
	*	Objetivo: Elimina un registro de visita
	*	Hecha por: Leonel
	*	Modificada por: Leonel
	*	Última Modificación: 17/07/2014
	*	Observaciones: Ninguna.
	*/
	function eliminar_programacion($id_programacion_visita=NULL) 
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dprogramar_visita_2); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			$this->promocion_model->eliminar_programacion($id_programacion_visita);
			$json =array(
					'resultado'=>1
				);
		}
		else {
			$json =array(
					'resultado'=>0
				);
		}
		echo json_encode($json);
	}
	
	function ver_asignaciones()
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dasignaciones); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			switch($data['id_permiso']) {
				case 3:
					$data['tecnico']=$this->promocion_model->mostrar_tecnicos();
					break;
				case 4:
					$info=$this->seguridad_model->info_empleado(0, "id_empleado",$this->session->userdata('id_usuario'));
					$data['visita_mensual']=$this->promocion_model->calendario($info['id_empleado']);
					$data['visita']=$this->promocion_model->calendario_dia($info['id_empleado'], date('Y-m-d'));
					$data['id_empleado']=$info['id_empleado'];
					break;
			}
			pantalla('verificacion/asignaciones',$data,Dasignaciones);
		}
		else {
			pantalla_error();
		}
	}
}
?>