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
		$this->load->library("mpdf");
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

	function informe_mensual()
	{	
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dinforme_mensual); 
		if($data['id_permiso']!=NULL) {
			switch($data['id_permiso']) {
				case 3:

					break;
				case 4:

					break;
			}
			$data['anios']=$this->promocion_model->consultas_anios();
			$data['meses']=$this->promocion_model->consultas_meses($data['anios'][0]['id']);
			pantalla('informe_mensual',$data,Dinforme_mensual);
		}
		else {
			pantalla_error();
		}
	}

	function meses($anio=0)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dinforme_mensual); 
		if($data['id_permiso']!=NULL) {
			$data['meses']=$this->promocion_model->consultas_meses($anio);
			$this->load->view('meses',$data);
		}
		else {
			pantalla_error();
		}
	}

	function resultados($anioe=NULL,$mese=NULL,$reportee=NULL,$exportacione=NULL)
	{
		$data=$this->seguridad_model->consultar_permiso($this->session->userdata('id_usuario'),Dinforme_mensual); 
		if($data['id_permiso']==3 || $data['id_permiso']==4) {
			
			if($anioe==NULL) {
				$anio=$this->input->post('anio');
			}
			else {
				$anio=$anioe;
			}
			if($mese==NULL) {
				$mes=$this->input->post('mes');
			}
			else {
				$mes=$mese;
			}

			if($reportee==NULL)
				$reporte=$this->input->post('radio');
			else
				$reporte=$reportee;
			if($exportacione==NULL)
				$data['exportacion']=$this->input->post('radio2');
			else
				$data['exportacion']=$exportacione;
			$id_seccion=$this->seguridad_model->consultar_seccion_usuario($this->session->userdata('nr'));
			if($data['id_permiso']==4)
				$id_departamento=$this->promocion_model->ubicacion_departamento($id_seccion['id_seccion']);
			else
				$id_departamento=NULL;
			$data['anio']=$anio;
			$data['mes']=$mes;
			$data['id_seccion']=$id_seccion['id_seccion'];
			switch($reporte) {
				case 1:
					$data['resumen_informe_general']=$this->promocion_model->resumen_informe($anio,$mes,$id_departamento);
					$data['resumen_informe_promocion']=$this->promocion_model->resumen_informe_promocion($anio,$mes,$id_departamento);
					$data['resumen_informe_verificacion']=$this->promocion_model->resumen_informe_verificacion($anio,$mes,$id_departamento);
					$data['resumen_informe_capacitacion']=$this->promocion_model->resumen_informe_capacitacion($anio,$mes,$id_departamento);
					$data['resumen_informe_acreditacion']=$this->promocion_model->resumen_informe_acreditacion($anio,$mes,$id_departamento);
					$data['nombre_jefe']=$this->promocion_model->nombre_jefe();

					$data['puesto']=$this->seguridad_model->info_empleado(NULL, $select="nominal, funcional", $this->session->userdata('id_usuario'));
					$data['nombre']="Instituciones ".date('d-m-Y hisa');
					if($data['exportacion']!=2) {
						$this->load->view('resumen_informe',$data);
						/*echo "<pre>";
						print_r($data['resumen_informe']);
						echo "</pre>";
						echo "<pre>";
						print_r($data['resumen_informe_promocion']);
						echo "</pre>";
						echo "<pre>";
						print_r($data['resumen_informe_verificacion']);
						echo "</pre>";
						echo "<pre>";
						print_r($data['resumen_informe_capacitacion']);
						echo "</pre>";
						echo "<pre>";
						print_r($data['resumen_informe_acreditacion']);
						echo "</pre>";*/
					}
					else {						
						$this->mpdf->mPDF('utf-8','letter'); /*Creacion de objeto mPDF con configuracion de pagina y margenes*/
						$stylesheet = file_get_contents('css/pdf/acreditacion.css'); /*Selecionamos la hoja de estilo del pdf*/
						$this->mpdf->WriteHTML($stylesheet,1); /*lo escribimos en el pdf*/
						$this->mpdf->SetFooter('Fecha y hora de generación: '.date('d/m/Y H:i:s A').'||Página {PAGENO}/{nbpg}');
						
						$html = $this->load->view('resumen_informe.php', $data, true);
						//$data_cab['titulo']="PROMOCIONES REALIZADAS POR LUGAR DE TRABAJO";
						//$this->mpdf->WriteHTML($this->load->view('cabecera_pdf.php', $data_cab, true),2);
						$this->mpdf->WriteHTML($html,2);
						$this->mpdf->Output(); /*Salida del pdf*/
					}
					break;
//				case 2:
//					$data['info']=$this->promocion_model->resultados_tecnicos($anio,$mes,$id_departamento);
//					$data['nombre']="Técnicos ".date('d-m-Y hisa');
//					if($data['exportacion']!=2)
//						$this->load->view('resultados_tecnicos',$data);
//					else {
//						$this->mpdf->mPDF('utf-8','letter-L'); /*Creacion de objeto mPDF con configuracion de pagina y margenes*/
//						$stylesheet = file_get_contents('css/pdf/acreditacion.css'); /*Selecionamos la hoja de estilo del pdf*/
//						$this->mpdf->WriteHTML($stylesheet,1); /*lo escribimos en el pdf*/
//						//$this->mpdf->SetHTMLHeader($this->load->view('cabecera_pdf.php', $data, true),1);
//						$this->mpdf->SetFooter('Fecha y hora de generación: '.date('d/m/Y H:i:s A').'||Página {PAGENO}/{nbpg}');
//						
//						$html = $this->load->view('resultados_tecnicos.php', $data, true);
//						$data_cab['titulo']="PROMOCIONES REALIZADAS POR TÉCNICO EDUCADOR";
//						$this->mpdf->WriteHTML($this->load->view('cabecera_pdf.php', $data_cab, true),2);
//						$this->mpdf->WriteHTML($html,2);
//						$this->mpdf->Output(); /*Salida del pdf*/
//					}
//					break;
//				case 3:
//					$data['info']=$this->promocion_model->resultados_sectores($anio,$mes,$id_departamento);
//					$data['nombre']="Sectores ".date('d-m-Y hisa');
//					if($data['exportacion']!=2)
//						$this->load->view('resultados_sectores',$data);
//					else {
//						$this->mpdf->mPDF('utf-8','letter'); /*Creacion de objeto mPDF con configuracion de pagina y margenes*/
//						$stylesheet = file_get_contents('css/pdf/acreditacion.css'); /*Selecionamos la hoja de estilo del pdf*/
//						$this->mpdf->WriteHTML($stylesheet,1); /*lo escribimos en el pdf*/
//						//$this->mpdf->SetHTMLHeader($this->load->view('cabecera_pdf.php', $data, true),1);
//						$this->mpdf->SetFooter('Fecha y hora de generación: '.date('d/m/Y H:i:s A').'||Página {PAGENO}/{nbpg}');
//						
//						$html = $this->load->view('resultados_sectores.php', $data, true);
//						$data_cab['titulo']="PROMOCIONES POR SECTOR ECONÓMICO";
//						$this->mpdf->WriteHTML($this->load->view('cabecera_pdf.php', $data_cab, true),2);
//						$this->mpdf->WriteHTML($html,2);
//						$this->mpdf->Output(); /*Salida del pdf*/
//					}
//					break;
			}
		}
		else {
			pantalla_error();
		}
	}
}
?>