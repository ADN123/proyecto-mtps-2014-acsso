<?php 
class Sessiones extends CI_Controller {
		
	function Sessiones()
	{
        parent::__construct();
        error_reporting(0);
		date_default_timezone_set('America/El_Salvador');
		$this->load->model('seguridad_model');
		$this->load->helper('cookie');
		$this->load->library("securimage/securimage");
    }

	/*
	*	Nombre: index
	*	Obejtivo: Carga la vista que contiene el formulario de login
	*	Hecha por: Jhonatan
	*	Modificada por: Leonel
	*	Ultima Modificacion: 03/07/2014
	*	Observaciones: Ninguna
	*/
	function index()
	{
		$in=$this->verificar();
		if($in<=3){
			$this->load->view('encabezado.php'); 
			$this->load->view('login.php'); 
			$this->load->view('piePagina.php');		
		}
		else {
			//echo"Sistema Bloqueado";
			$this->load->view('lock.php'); 
		}
	}
	
	/*
	*	Nombre: iniciar_session
	*	Obejtivo: Verificar que el nick y password introducidos por el usuario sean correctos
	*	Hecha por: Jhonatan
	*	Modificada por: Leonel
	*	Ultima Modificacion: 03/07/2014
	*	Observaciones: La variable de session "id_seccion" no la deberiamos ocupar, deberiamos ir a buscar el registro actual del usuario logueado cada vez que se requiera
	*/
	function iniciar_session()
	{
		$in=$this->verificar();
		if ($in<=3) {				
			$login =$this->input->post('user');
			$clave =$this->input->post('pass');
			
			$v=$this->seguridad_model->consultar_usuario($login,$clave);  //Verificación en base de datos
			
			if($v['id_usuario']==0) {
				setcookie('hora', time() + 15* 60, time() + 15* 60);
				alerta("Datos Incorrectos",'index.php/sessiones');
			}
			else {
				$this->session->set_userdata('nombre', $v['nombre_completo']);
				$this->session->set_userdata('id_usuario', $v['id_usuario']);
				$this->session->set_userdata('usuario', $v['usuario']);
				$this->session->set_userdata('nr', $v['NR']);			
				$this->session->set_userdata('id_seccion', $v['id_seccion']);
				$this->session->set_userdata('sexo', $v['sexo']);
				setcookie('contador', 1, time() + 15* 60);			
				ir_a('index.php/inicio'); 
			}
		}
		else{
			alerta($in." intentos. terminal bloqueada",'index.php/sessiones');
		}
	}
	
	/*
	*	Nombre: cerrar_session
	*	Obejtivo: Cerrar la sesion de un usuario
	*	Hecha por: Jhonatan
	*	Modificada por: Jhonatan
	*	Ultima Modificacion: 15/03/2014
	*	Observaciones: Ninguna
	*/
	function cerrar_session()
	{
		$this->session->set_userdata('nombre','');
		$this->session->set_userdata('id_usuario','');
		$this->session->set_userdata('usuario', '');	
		$this->session->set_userdata('nr','');
	   	redirect('index.php/sessiones/');
	}
	
	/*
	*	Nombre: cerrar_session
	*	Obejtivo: Cerrar la sesion de un usuario
	*	Hecha por: Jhonatan
	*	Modificada por: Leonel
	*	Ultima Modificacion: 03/07/2014
	*	Observaciones: Ninguna
	*/
	function verificar()
	{
		$in;
		if(!isset($_COOKIE['contador'])) { // Caduca en 15 minutos y se ajusta a uno la primera vez
		 	setcookie('contador', 1, time() + 15* 60); 
			//sleep (2); //es nesesario pausar debido a que se tiene que crear la cookie
			return 1;
		}
		else { 
			// si existe cookie procede a contar  
			setcookie('contador', $_COOKIE['contador'] + 1, time() + 15 * 60); 
		 	sleep (1); //es nesesario pausar debido a que se tiene que crear la cookie
			return $_COOKIE['contador'];
		}//fin else de intentos
	}


	function cambiar_pass()
	{
		$this->load->view('cambiar_pass');
	}

	function capcha()
	{
		$img = new Securimage();
		$img->show(); 
	}

	function sendmail()
	{
		header('Content-type: application/json');
		$securimage = new Securimage();
		$correo=$this->input->post('correo');
		$captcha_code=$this->input->post('captcha_code');
		if ($securimage->check($captcha_code)) {
			$letras = "ABCDEFGHJKLMNPRSTUVWXYZ98765432";
			$contra=str_shuffle($letras);
			$contra=substr($contra,0,10);
			
			$letras2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0987654321";
			$contra2=str_shuffle($letras2);
			$contra2=substr($contra2,0,40);	
			
			$info=$this->seguridad_model->info_empleado(NULL,"id_usuario, nombre, correo",NULL,$correo);
			
			$formuInfo = array(
				'id_usuario'=>$info['id_usuario'],
				'fecha_caso'=>date('Y-m-d'),
				'nuevo_pass'=>$contra,
				'codigo_caso'=>$contra2
			);
			$this->seguridad_model->guardar_caso($formuInfo);
			
			$message='
				Hola '.$info['nombre'].'! Esta es tu nueva contraseña: '.$contra.'. Si la quieres activar da clic <a href="'.base_url().'/index.php/sessiones/activar/'.$contra2.'">aquí</a>.
			';
			
			$r=enviar_correo($info['correo'],"SCRS - Restablecimiento de Contraseña",$message);
						
			$correo2=$info['correo'];
			$needle='@';
			$pos=strripos($correo2, $needle);
			for($i=2;$i<$pos;$i++)
				$correo2[$i]="*";
			if($r=1)
				echo json_encode(array('status' => 1, 'message' => $correo2));
			else
				echo json_encode(array('status' => 0, 'message' => 'Ha fallado el envío del correo'));
		}
		else {
			echo json_encode(array('status' => 0, 'message' => 'El código ingresado no es corecto!'));
		}
	}
	
	function activar($codigo_caso=NULL)
	{
		$caso=$this->seguridad_model->buscar_caso($codigo_caso);
	}
}
?>