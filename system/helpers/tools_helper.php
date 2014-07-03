<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2011, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * CodeIgniter Form Helpers
 *
 * @package		CodeIgniter
 * @subpackage	Helpers
 * @category	Helpers
 * @author		Jhonatan Flores
 * @link		http://codeigniter.com/user_guide/helpers/form_helper.html
 */

// ------------------------------------------------------------------------

/**
 * Form Declaration
 *
 * Creates the opening portion of the form.
 *
 * @access	public
 * @param	string	the URI segments of the form destination
 * @param	array	a key/value pair of attributes
 * @param	array	a key/value pair hidden data
 * @return	string
 */
	

	function pantalla($vista, $data=NULL) 
	{
		$CI =& get_instance();
		$data['nick']=$CI->session->userdata('usuario');
		$data['nombre']=$CI->session->userdata('nombre');
		$data['menus']=$CI->seguridad_model->buscar_menus($CI->session->userdata('id_usuario'));

		$CI->load->view('encabezado');
		$CI->load->view('menu_derecha',$data);
	 	$CI->load->view($vista);
		$CI->load->view('menu_izquierda',$data);	
	 	$CI->load->view('piePagina');
	}

	function ir_a($url){
		echo'<script language="JavaScript" type="text/javascript">
				var pagina="'.base_url().$url.'"
				function redireccionar() 
				{
				location.href=pagina
				} 
				setTimeout ("redireccionar()", 600);
				
				</script>';
		
		}	

	function nuevaVentana($url){
		echo'<script language="JavaScript" type="text/javascript">
				var pagina2="'.base_url().$url.'"
				function nuevaVentana() 
				{
				window.open(pagina2,"_blank");
				} 
				setTimeout ("nuevaVentana()", 300);
				
				</script>';
		
		}	

	/*function enviar_correo($correo=array(),$title,$message) */
	function enviar_correo($correo,$title,$message) 
	{
		$CI =& get_instance();
		$CI->load->library("phpmailer");
		
		$mail = new PHPMailer();
		$mail->Host = "mtrabajo.mtps.gob.sv";
		$mail->isSMTP();
		$mail->SMTPAuth = true;
		$mail->Username = "departamento.transporte@mtps.gob.sv";
		$mail->Password = ".[?=)&%$";
		$mail->From = "departamento.transporte@mtps.gob.sv";
		$mail->FromName = "Departamento de Transporte";
		$mail->IsHTML(true);          
		$mail->Timeout = 1000;
		/*for($i=0;$i<count($correo);$i++)
			$mail->AddAddress( $correo[$i] );*/
		$mail->AddAddress( $correo );
		$mail->ContentType = "text/html";
		$mail->Subject = $title;
		$mail->Body = $message;
		$r=$mail->Send();
		return $r;
	}
	
	function enviar_correo_automatico_administracion($id_solicitud_transporte=NULL, $id_modulo=NULL) 
	{
		$CI =& get_instance();
		$CI->load->model('usuario_model');
		$CI->load->model('transporte_model');
		$datos=$CI->usuario_model->buscar_correos($id_solicitud_transporte, $id_modulo);
		$solicitud=$CI->transporte_model->consultar_solicitud($id_solicitud_transporte);
		for($i=0;$i<count($datos);$i++) {
			$nombre=ucwords($datos[$i]['nombre']);
			$correo=ucwords($datos[$i]['correo']);
			/*$correo="leoneladonispm@hotmail.com";*/
			$nominal=ucwords($datos[$i]['nominal']);
			$mensaje="Estimad@ ".$nombre.",<br><br>La solicitud N&deg;<strong>".$id_solicitud_transporte."</strong> realizada por <strong>".ucwords($solicitud['nombre'])."</strong> ";
			switch($id_modulo){
				case 60:
					$titulo="SOLICITUD DE TRANSPORTE PENDIENTE DE AUTORIZACION";
					$mensaje.="requiere de su autorizaci&oacute;n.<br><br>Departamento de Transporte.<br><br><img src='".base_url()."img/mtps.jpg' />";
					break;
				case 62:
					$titulo="SOLICITUD DE TRANSPORTE PENDIENTE DE ASIGACION DE VEHCULO/MOTORISTA";
					$mensaje.="requiere asignaci&oacute;n de veh&iacute;culo/motorista.<br><br>Departamento de Transporte.<br><br><img src='".base_url()."img/mtps.jpg' />";
					break;
				default:
					$titulo="";
					$mensaje="";
			}
			$r=enviar_correo($correo,$titulo,$mensaje);
		}
	}
	
	function enviar_correo_automatico_usuarios($id_solicitud_transporte=NULL) 
	{
		$CI =& get_instance();
		$CI->load->model('usuario_model');
		$CI->load->model('transporte_model');
		$datos=$CI->usuario_model->buscar_correo($id_solicitud_transporte);
		$nombre=ucwords($datos['nombre']);
		$correo=ucwords($datos['correo']);
		/*$correo="leoneladonispm@hotmail.com";*/
		$nominal=ucwords($datos['nominal']);
		$mensaje="Estimad@ ".$nombre.",<br><br>Su solicitud N&deg;<strong>".$id_solicitud_transporte."</strong> con fecha de salida <strong>".$datos['fecha_mision']."</strong> ";
		switch($datos['estado']){
			case 0:
				$titulo="SOLICITUD DE TRANSPORTE RECHAZADA";
				$mensaje.="ha sido reprobada. Puede que se deba a uno de los siguientes motivos: '<strong>".$datos['observacion']."</strong>'<br><br>Departamento de Transporte.<br><br><img src='".base_url()."img/mtps.jpg' />";
				break;
			case 2:
				$titulo="SOLICITUD DE TRANSPORTE APROBADA";
				$mensaje.="ha sido aprobada.<br><br>Departamento de Transporte.<br><br><img src='".base_url()."img/mtps.jpg' />";
				break;
			case 3:
				$titulo="SOLICITUD DE TRANSPORTE ASIGNADA CON VEHICULO/MOTORISTA";
				$mensaje.="ha sido asignada con veh&iacute;culo/motorista.<br><br>Departamento de Transporte.<br><br><img src='".base_url()."img/mtps.jpg' />";
				break;
			default:
				$titulo="";
				$mensaje="";
		}
		$r=enviar_correo($correo,$titulo,$mensaje);
	}
	
	function alerta($msj,$url){
		echo'
			<!DOCTYPE html>
			<html lang="es">
			<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
				<link href="'.base_url().'css/style.default.css" rel="stylesheet">
				<script src="'.base_url().'js/jquery-1.10.2.min.js"></script>
				<script src="'.base_url().'js/jquery-migrate-1.2.1.min.js"></script>
				<script src="'.base_url().'js/bootstrap.min.js"></script>
				<script src="'.base_url().'js/modernizr.min.js"></script>
				<script src="'.base_url().'js/retina.min.js"></script>
				<script src="'.base_url().'js/custom.js"></script>
			</head>
			<body style="background: #FFF;">
				<button style="display:none" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-static"></button>
				<div class="modal fade bs-example-modal-static" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Error al intentar ingresar al sitio</h4>
						</div>
						<div class="modal-body">
							El usuario y contraseña no coiciden.
						</div>
					</div>
				  </div>
				</div>
				<script language="JavaScript" type="text/javascript">
					var pagina="'.base_url().$url.'"
					function redireccionar() {
						$(".btn").click();
						setTimeout("partB()",3000)
					} 
					function partB() {
						location.href=pagina
					} 
					setTimeout ("redireccionar()",1000);
				</script>
			</body>
			</html>
			';
		}	



/* End of file tools_helper.php */
/* Location: ./system/helpers/form_helper.php */
