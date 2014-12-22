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
		$this->load->library("PHPExcel");
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

					switch($data['id_seccion'])
					{
						case 52:$depto="Ahuachapán";break;
						case 53:$depto="Cabañas";break;
						case 54:$depto="Chalatenango";break;
						case 55:$depto="Cuscatlán";break;
						case 56:$depto="La Libertad";break;
						case 57:$depto="La Unión";break;
						case 58:$depto="Morazán";break;
						case 59:$depto="San Vicente";break;
						case 60:$depto="Sonsonate";break;
						case 61:$depto="Usulután";break;
						case 64:$depto="Zacatecoluca";break;
						case 65:$depto="San Miguel";break;
						case 66:$depto="Santa Ana";break;
						default:$depto="San Salvador";break;
					}

					switch($mes) {
						case 1: $mes="Enero";break;
						case 2: $mes="Febreo";break;
						case 3: $mes="Marzo";break;
						case 4: $mes="Abril";break;
						case 5: $mes="Mayo";break;
						case 6: $mes="Junio";break;
						case 7: $mes="Julio";break;
						case 8: $mes="Agosto";break;
						case 9: $mes="Septiembre";break;
						case 10: $mes="Octubre";break;
						case 11: $mes="Noviembre";break;
						case 12: $mes="Diciembre";break;
					}

					$data['puesto']=$this->seguridad_model->info_empleado(NULL, $select="nominal, funcional", $this->session->userdata('id_usuario'));
					$data['nombre']="Informe ".$depto.", ".$mes." ".$anio." ".date('Ymdhisa');
					if($data['exportacion']==1) {
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
						if($data['exportacion']==2) {				
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
						else {
							error_reporting(E_ALL);
							ini_set('display_errors', TRUE);
							ini_set('display_startup_errors', TRUE);

							if (PHP_SAPI == 'cli')
								die('Este archivo sólo se puede ejecutar desde un navegador Web');

							extract($data);

							switch(date('m')) {
								case 1: $m="Enero";break;
								case 2: $m="Febreo";break;
								case 3: $m="Marzo";break;
								case 4: $m="Abril";break;
								case 5: $m="Mayo";break;
								case 6: $m="Junio";break;
								case 7: $m="Julio";break;
								case 8: $m="Agosto";break;
								case 9: $m="Septiembre";break;
								case 10: $m="Octubre";break;
								case 11: $m="Noviembre";break;
								case 12: $m="Diciembre";break;
							}

							//Creando objeto
							$objPHPExcel = new PHPExcel();

							//Propiedades del documento
							$objPHPExcel->getProperties()->setCreator(strtolower($this->session->userdata('nombre')))
														 ->setLastModifiedBy(strtolower($this->session->userdata('nombre')))
														 ->setTitle("Informe mensual de actividades realizadas en la Sección de Prevención de Riesgos Ocupacionales")
														 ->setSubject("Oficina Departamental de San Salvador")
														 ->setDescription("")
														 ->setKeywords("Informe mensual San Salvador")
														 ->setCategory("Informe");

							$borde_suave = array(
								'borders' => array(
									'outline' => array(
										'style' => PHPExcel_Style_Border::BORDER_THIN,
										'color' => array('argb' => '00000000'),
									),
								),
							);

							$borde_duro = array(
								'borders' => array(
									'outline' => array(
										'style' => PHPExcel_Style_Border::BORDER_THICK,
										'color' => array('argb' => '00000000'),
									),
								),
							);

							$objPageSetup = new PHPExcel_Worksheet_PageSetup();
						    $objPageSetup->setScale(70);	
						    $objPHPExcel->getActiveSheet()->setPageSetup($objPageSetup);


							//Creado otras dos pestañas
							$objPHPExcel->createSheet();
							$objPHPExcel->createSheet();

							//Renombrando pestañas
							$objPHPExcel->getActiveSheet()->setTitle('Resumen de Inf.');
							$objPHPExcel->setActiveSheetIndex(1);
							$objPHPExcel->getActiveSheet()->setTitle('Comités');
							$objPHPExcel->setActiveSheetIndex(2);
							$objPHPExcel->getActiveSheet()->setTitle('Noviembre 2014');

							//Diseño de primera hoja
							$objPHPExcel->setActiveSheetIndex(0);

							$objPHPExcel->getActiveSheet()->getStyle('A:F')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('A:F')->getFill()->getStartColor()->setARGB('FFFFFFFF');

							//Dimensionando celdas
							$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth('5.5pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth('5.70pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('70.15pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth('8.75pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth('13.75pt');							
							$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth('17.6pt');


							$objPHPExcel->getActiveSheet()->getStyle('A1:F13')->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('A1:F7')->getFont()->setName('Arial');
							$objPHPExcel->getActiveSheet()->getStyle('A8:F100')->getFont()->setName('Tahoma');
							$objPHPExcel->getActiveSheet()->getStyle('A:F')->getFont()->setSize(12);
							$objPHPExcel->getActiveSheet()->getStyle('A:F')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A1:F7')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A8')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

							//Agrupando celdas del encabezado
							$objPHPExcel->getActiveSheet()->mergeCells('A1:F1');
							$objPHPExcel->getActiveSheet()->mergeCells('A2:G2');
							$objPHPExcel->getActiveSheet()->mergeCells('A3:G3');
							$objPHPExcel->getActiveSheet()->mergeCells('A4:G4');
							$objPHPExcel->getActiveSheet()->mergeCells('A5:G5');
							$objPHPExcel->getActiveSheet()->mergeCells('A6:F6');
							$objPHPExcel->getActiveSheet()->mergeCells('A7:F7');
							$objPHPExcel->getActiveSheet()->mergeCells('A8:F8');
							$objPHPExcel->getActiveSheet()->mergeCells('B10:F10');
							$objPHPExcel->getActiveSheet()->mergeCells('B11:F11');
							$objPHPExcel->getActiveSheet()->mergeCells('B12:F12');
							$objPHPExcel->getActiveSheet()->mergeCells('B13:F13');
							$objPHPExcel->getActiveSheet()->mergeCells('B16:F17');

							$objPHPExcel->getActiveSheet()->setCellValue('A2', 'MINISTERIO DE TRABAJO Y PREVISION SOCIAL');
							$objPHPExcel->getActiveSheet()->setCellValue('A3', 'DIRECCION GENERAL DE PREVISION SOCIAL');
							$objPHPExcel->getActiveSheet()->setCellValue('A4', 'DEPARTAMENTO DE SEGURIDAD E HIGIENE OCUPACIONAL');
							$objPHPExcel->getActiveSheet()->setCellValue('A5', 'SECCIÓN DE PREVENCIÓN RIESGOS OCUPACIONALES');
							$objPHPExcel->getActiveSheet()->setCellValue('A8', $depto.", ".date('d')." de ".$m." de ".date('Y'));
							$objPHPExcel->getActiveSheet()->setCellValue('B10', 'Ingeniero');
							$objPHPExcel->getActiveSheet()->setCellValue('B11', ltrim(ucwords($nombre_jefe['nombre_jefe'])));
							$objPHPExcel->getActiveSheet()->setCellValue('B12', 'Jefe del Departamento de');
							$objPHPExcel->getActiveSheet()->setCellValue('B13', 'Seguridad e Higiene Ocupacional');
							$objPHPExcel->getActiveSheet()->getStyle('B10:B13')->getFont()->setSize(12);


							$objRichText = new PHPExcel_RichText();
							$objRichText->createText('Atentamente Informo de las Actividades Realizadas en la Sección de Prevención de Riesgos Ocupacionales de la Oficina Departamental de ');
							$objPayable = $objRichText->createTextRun($depto);
							$objPayable->getFont()->setBold(true);
							$objRichText->createText(', Correspondiente al Mes de ');
							$objPayable = $objRichText->createTextRun($mes);
							$objPayable->getFont()->setBold(true);
							$objRichText->createText(' del año ');
							$objPayable = $objRichText->createTextRun($anio);
							$objPayable->getFont()->setBold(true);
							$objRichText->createText('.');
							$objPHPExcel->getActiveSheet()->getCell('B16')->setValue($objRichText);
							$objPHPExcel->getActiveSheet()->getStyle('B16')->getFont()->setSize(12);							

							$objPHPExcel->getActiveSheet()->getStyle('B16')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
							$objPHPExcel->getActiveSheet()->getStyle('B16')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);

							//Logo del MTPS
							$objDrawing = new PHPExcel_Worksheet_Drawing();
							$objDrawing->setName('PHPExcel logo');
							$objDrawing->setDescription('PHPExcel logo');
							$objDrawing->setPath('./img/mtps_report2.jpg');
							$objDrawing->setHeight(110);
							$objDrawing->setCoordinates('A1');
							$objDrawing->setOffsetX(5);
							$objDrawing->setOffsetY(10);
							$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());


							//Mostrando resumen de informe
							$i=19;
							foreach($resumen_informe_general as $val) {
								if($val['idh']==0)
									$v=$val['idp'].". ";
								else
									$v="";
								$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.$i, $v)->setCellValue('C'.$i, $val['tipo'])->setCellValue('D'.$i, "")->setCellValue('E'.$i, $val['subtotal'])->setCellValue('F'.$i, $val['total']);
								if($val['idh']!=0) {
									$objPHPExcel->getActiveSheet()->getStyle('C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
									$objPHPExcel->getActiveSheet()->getRowDimension($i)->setRowHeight('25pt');
								}
								else
									$objPHPExcel->getActiveSheet()->getStyle('C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
								$objPHPExcel->getActiveSheet()->getStyle('D'.$i.':F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);
								$objPHPExcel->getActiveSheet()->getStyle('C'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('D'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getFont()->setBold(true);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getFont()->setSize(12);
								if($val['idp']==6 && $val['idh']==1) {
									$objPHPExcel->getActiveSheet()->mergeCells('C'.$i.':F'.$i);
									$objPHPExcel->getActiveSheet()->getRowDimension($i)->setRowHeight('60pt');
									$objPHPExcel->getActiveSheet()->getStyle('C'.$i.':F'.$i)->applyFromArray($borde_suave);
								}
								if($val['subtotal']!="") {
									$objPHPExcel->getActiveSheet()->getStyle('E'.$i)->applyFromArray($borde_suave);
								}
								if(($val['total']!="" && $val['idh']==0) || $val['total']!="") {
									$objPHPExcel->getActiveSheet()->getStyle('F'.$i)->applyFromArray($borde_duro);
								}
								$i++;
							}

							$objPHPExcel->getActiveSheet()->mergeCells('A'.($i+2).':F'.($i+2));
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue('A'.($i+2), ucwords(strtolower($this->session->userdata('nombre'))));
							$objPHPExcel->getActiveSheet()->getStyle('A'.($i+2))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A'.($i+2))->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('A'.($i+2))->getFont()->setSize(12);

							$objPHPExcel->getActiveSheet()->mergeCells('A'.($i+3).':F'.($i+3));
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue('A'.($i+3), ucwords($puesto['nominal']));
							$objPHPExcel->getActiveSheet()->getStyle('A'.($i+3))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A'.($i+3))->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('A'.($i+3))->getFont()->setSize(12);

							//LISTADO VISITADAS DE PROMOCION
							$objPHPExcel->getActiveSheet()->getStyle('A51:F60')->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('A51:F60')->getFont()->setName('Tahoma');
							$objPHPExcel->getActiveSheet()->getStyle('A51:F57')->getFont()->setSize(12);
							$objPHPExcel->getActiveSheet()->getStyle('A58:F60')->getFont()->setSize(11);
							$objPHPExcel->getActiveSheet()->getStyle('A51:F60')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A51:F60')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('B56')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

							$objPHPExcel->getActiveSheet()->mergeCells('A51:F51');
							$objPHPExcel->getActiveSheet()->mergeCells('A52:F52');
							$objPHPExcel->getActiveSheet()->mergeCells('A53:F53');
							$objPHPExcel->getActiveSheet()->mergeCells('A54:F54');
							$objPHPExcel->getActiveSheet()->mergeCells('A55:F55');
							$objPHPExcel->getActiveSheet()->mergeCells('B56:F56');
							$objPHPExcel->getActiveSheet()->mergeCells('A57:F57');
							$objPHPExcel->getActiveSheet()->mergeCells('B58:F58');

							$objPHPExcel->getActiveSheet()->mergeCells('B59:B60');
							$objPHPExcel->getActiveSheet()->mergeCells('C59:C60');
							$objPHPExcel->getActiveSheet()->mergeCells('D59:E59');
							$objPHPExcel->getActiveSheet()->mergeCells('F59:F60');

							$objPHPExcel->getActiveSheet()->setCellValue('A51', 'MINISTERIO DE TRABAJO Y PREVISION SOCIAL');
							$objPHPExcel->getActiveSheet()->setCellValue('A52', 'DIRECCION GENERAL DE PREVISION SOCIAL');
							$objPHPExcel->getActiveSheet()->setCellValue('A53', 'DEPARTAMENTO DE SEGURIDAD E HIGIENE OCUPACIONAL');
							$objPHPExcel->getActiveSheet()->setCellValue('A54', 'SECCIÓN DE PREVENCIÓN RIESGOS OCUPACIONALES');
							$objPHPExcel->getActiveSheet()->setCellValue('B56', 'Oficina Departamental de: '.$depto);
							
							$objPHPExcel->getActiveSheet()->setCellValue('B58', 'LISTADO VISITADAS DE PROMOCION');
							$objPHPExcel->getActiveSheet()->setCellValue('B59', 'No');
							$objPHPExcel->getActiveSheet()->setCellValue('C59', 'LISTADO DE EMPRESAS');
							$objPHPExcel->getActiveSheet()->setCellValue('D59', 'C I I U');
							$objPHPExcel->getActiveSheet()->setCellValue('F59', 'N° DE VISITAS REALIZADAS');
							$objPHPExcel->getActiveSheet()->setCellValue('D60', 'RAMA');
							$objPHPExcel->getActiveSheet()->setCellValue('E60', 'CODIGO');

							$objPHPExcel->getActiveSheet()->getStyle('B58:F60')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('B58:F60')->getFill()->getStartColor()->setARGB('dddddddd');
							$objPHPExcel->getActiveSheet()->getStyle('B58:F60')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
							$objPHPExcel->getActiveSheet()->getStyle('F59')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
							$objPHPExcel->getActiveSheet()->getStyle('F59')->getFont()->setSize(10);

							$i=60;
							$j=0;
							$total=0;
					        foreach($resumen_informe_promocion as $val) {
					        	if($val['direccion_lugar']!="" && $val['ciiu4']!="" && $val['codigo']!="" && $val['total']!="") {
					    			$i++;
					    			$j++;
					    			$total=$total+$val['total'];
					    			$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.$i, $j)->setCellValue('C'.$i, $val['direccion_lugar'])->setCellValue('D'.$i, $val['ciiu4'])->setCellValue('E'.$i, $val['codigo'])->setCellValue('F'.$i, $val['total']);
									$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
									$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
									$objPHPExcel->getActiveSheet()->getStyle('C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
									$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								}
					        }
					        if($j==0) {
					        	$i++;
					        	$objPHPExcel->getActiveSheet()->mergeCells('B'.$i.':F'.$i);

								$objPHPExcel->getActiveSheet()->setCellValue('B'.$i, '(No se encontraron registros)');
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

					        }
					        else {
					        	$objPHPExcel->getActiveSheet()->mergeCells('B'.($i+1).':E'.($i+1));
					        	$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.($i+1), 'TOTAL');
					        	$objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.($i+1), $total);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1).':F'.($i+1))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1).':F'.($i+1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
								$objPHPExcel->getActiveSheet()->getStyle('F'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1).':F'.($i+1))->getFont()->setBold(true);
					        }

					        //VISITAS DE VERIFICACION ART. 10 - DECRETO 86
					        $i=$i+3;
			        		$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.($i+2))->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.($i+2))->getFont()->setName('Tahoma');
							$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.($i+2))->getFont()->setSize(11);
							$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.($i+2))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.($i+2))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

							$objPHPExcel->getActiveSheet()->mergeCells('B'.$i.':F'.$i);
							$objPHPExcel->getActiveSheet()->mergeCells('B'.($i+1).':B'.($i+2));
							$objPHPExcel->getActiveSheet()->mergeCells('C'.($i+1).':C'.($i+2));
							$objPHPExcel->getActiveSheet()->mergeCells('D'.($i+1).':E'.($i+1));
							$objPHPExcel->getActiveSheet()->mergeCells('F'.($i+1).':F'.($i+2));

					        $objPHPExcel->getActiveSheet()->setCellValue('B'.($i), 'VISITAS DE VERIFICACION ART. 10 - DECRETO 86');
							$objPHPExcel->getActiveSheet()->setCellValue('B'.($i+1), 'No');
							$objPHPExcel->getActiveSheet()->setCellValue('C'.($i+1), 'LISTADO DE EMPRESAS');
							$objPHPExcel->getActiveSheet()->setCellValue('D'.($i+1), 'C I I U');
							$objPHPExcel->getActiveSheet()->setCellValue('F'.($i+1), 'ESTADO DE CUMPLIMIENTO');
							$objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2), 'RAMA');
							$objPHPExcel->getActiveSheet()->setCellValue('E'.($i+2), 'CODIGO');

							$objPHPExcel->getActiveSheet()->getStyle('B'.($i).':F'.($i+2))->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('B'.($i).':F'.($i+2))->getFill()->getStartColor()->setARGB('dddddddd');
							$objPHPExcel->getActiveSheet()->getStyle('B'.($i).':F'.($i+2))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
							$objPHPExcel->getActiveSheet()->getStyle('F'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
							$objPHPExcel->getActiveSheet()->getStyle('F'.($i+1))->getFont()->setSize(10);

							$i=$i+2;
							$j=0;
							$total=0;
					        foreach($resumen_informe_verificacion as $val) {
					        	if($val['direccion_lugar']!="" && $val['ciiu4']!="" && $val['codigo']!="" && $val['id_estado_verificacion']!="") {
					    			$i++;
					    			$j++;
					    			$total=$j;
					    			$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.$i, $j)->setCellValue('C'.$i, $val['direccion_lugar'])->setCellValue('D'.$i, $val['ciiu4'])->setCellValue('E'.$i, $val['codigo'])->setCellValue('F'.$i, $val['id_estado_verificacion']);
									$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
									$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
									$objPHPExcel->getActiveSheet()->getStyle('C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
									$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								}
					        }
					        if($j==0) {
					        	$i++;
					        	$objPHPExcel->getActiveSheet()->mergeCells('B'.$i.':F'.$i);

								$objPHPExcel->getActiveSheet()->setCellValue('B'.$i, '(No se encontraron registros)');
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':F'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

					        }
					        else {
					        	$objPHPExcel->getActiveSheet()->mergeCells('B'.($i+1).':E'.($i+1));
					        	$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.($i+1), 'TOTAL');
					        	$objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.($i+1), $total);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1).':F'.($i+1))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1).':F'.($i+1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
								$objPHPExcel->getActiveSheet()->getStyle('F'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.($i+1).':F'.($i+1))->getFont()->setBold(true);
					        }

							$objPHPExcel->setActiveSheetIndex(1);

							$objPHPExcel->getActiveSheet()->getStyle('A:J')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('A:J')->getFill()->getStartColor()->setARGB('FFFFFFFF');

							//Dimensionando celdas
							$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth('6pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth('65pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('9pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth('9pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth('14pt');							
							$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth('12t');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth('12t');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth('12t');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth('12t');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth('12t');						

							$objPHPExcel->getActiveSheet()->getStyle('A1:J2')->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('A1:J100')->getFont()->setName('Arial');
							$objPHPExcel->getActiveSheet()->getStyle('A1:J100')->getFont()->setSize(11);
							$objPHPExcel->getActiveSheet()->getStyle('A1:J2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A1:J2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A1:J2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
							$objPHPExcel->getActiveSheet()->getStyle('A1:J2')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('A1:J2')->getFill()->getStartColor()->setARGB('dddddddd');
							$objPHPExcel->getActiveSheet()->getRowDimension(1)->setRowHeight('25pt');
							$objPHPExcel->getActiveSheet()->getRowDimension(2)->setRowHeight('25pt');

					        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'EMPRESAS CAPACITADAS');
							$objPHPExcel->getActiveSheet()->setCellValue('A1', 'No');
							$objPHPExcel->getActiveSheet()->setCellValue('B2', 'LISTADO DE EMPRESAS');
							$objPHPExcel->getActiveSheet()->setCellValue('C1', 'CIIU');
							$objPHPExcel->getActiveSheet()->setCellValue('E1', 'TRABAJADORES CAPACITADOS');
							$objPHPExcel->getActiveSheet()->setCellValue('E2', 'HOMBRES');
							$objPHPExcel->getActiveSheet()->setCellValue('F2', 'MUJERES');
							$objPHPExcel->getActiveSheet()->setCellValue('G2', 'TOTAL');
							$objPHPExcel->getActiveSheet()->setCellValue('H1', 'TRABAJADORES BENEFICIADOS');
							$objPHPExcel->getActiveSheet()->setCellValue('H2', 'HOMBRES');
							$objPHPExcel->getActiveSheet()->setCellValue('I2', 'MUJERES');
							$objPHPExcel->getActiveSheet()->setCellValue('J2', 'TOTAL');

							$objPHPExcel->getActiveSheet()->mergeCells('A1:A2');
							$objPHPExcel->getActiveSheet()->mergeCells('C1:D2');
							$objPHPExcel->getActiveSheet()->mergeCells('E1:G1');
							$objPHPExcel->getActiveSheet()->mergeCells('H1:J1');

							$i=3;
							$j=1;
							$total_hombres_capacitados=0;
							$total_mujeres_capacitados=0;
							$total_capacitados=0;
							$total_hombres_beneficiados=0;
							$total_mujeres_beneficiados=0;
							$total_beneficiados=0;
					        foreach($resumen_informe_capacitacion as $val) {
					        	$total_hombres_capacitados=$total_hombres_capacitados+$val['total_hombres_capacitados'];
								$total_mujeres_capacitados=$total_mujeres_capacitados+$val['total_mujeres_capacitados'];
								$total_capacitados=$total_capacitados+$val['total_capacitados'];
								$total_hombres_beneficiados=$total_hombres_beneficiados+$val['total_hombres_beneficiados'];
								$total_mujeres_beneficiados=$total_mujeres_beneficiados+$val['total_mujeres_beneficiados'];
								$total_beneficiados=$total_beneficiados+$val['total_beneficiados'];

								$objPHPExcel->setActiveSheetIndex(1)->setCellValue('A'.$i, $j)->setCellValue('B'.$i, $val['direccion_lugar'])->setCellValue('C'.$i, $val['ciiu4'])->setCellValue('D'.$i, $val['codigo'])->setCellValue('E'.$i, $val['total_hombres_capacitados'])->setCellValue('F'.$i, $val['total_mujeres_capacitados'])->setCellValue('G'.$i, $val['total_capacitados'])->setCellValue('H'.$i, $val['total_hombres_beneficiados'])->setCellValue('I'.$i, $val['total_mujeres_beneficiados'])->setCellValue('J'.$i, $val['total_beneficiados']);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':J'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':J'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':J'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
								$objPHPExcel->getActiveSheet()->getStyle('G'.$i)->getFont()->setBold(true);
								$objPHPExcel->getActiveSheet()->getStyle('J'.$i)->getFont()->setBold(true);
								$i++;
								$j++;
							}

							if($j==1) {
					        	$objPHPExcel->getActiveSheet()->mergeCells('A'.$i.':J'.$i);

								$objPHPExcel->getActiveSheet()->setCellValue('A'.$i, '(No se encontraron registros)');
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':J'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':J'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':J'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

					        }
					        else {
					        	$i--;
					        	$objPHPExcel->getActiveSheet()->mergeCells('A'.($i+1).':D'.($i+1));
					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('A'.($i+1), 'TOTAL');

					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('E'.($i+1), $total_hombres_capacitados);
					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('F'.($i+1), $total_mujeres_capacitados);
					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('G'.($i+1), $total_capacitados);
					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('H'.($i+1), $total_hombres_beneficiados);
					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('I'.($i+1), $total_mujeres_beneficiados);
					        	$objPHPExcel->setActiveSheetIndex(1)->setCellValue('J'.($i+1), $total_beneficiados);

								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1).':J'.($i+1))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1).':J'.($i+1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
								$objPHPExcel->getActiveSheet()->getStyle('E'.($i+1).':J'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1).':J'.($i+1))->getFont()->setBold(true);
					        }

					        $objPHPExcel->setActiveSheetIndex(2);

							$objPHPExcel->getActiveSheet()->getStyle('A:M')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('A:M')->getFill()->getStartColor()->setARGB('FFFFFFFF');

							//Dimensionando celdas
							$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth('6pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth('43pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('17pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth('16pt');
							$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth('41pt');							
							$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth('8pt');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth('8pt');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth('10pt');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth('10pt');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth('10pt');					
							$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth('10pt');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth('10pt');						
							$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth('10pt');							

							$objPHPExcel->getActiveSheet()->getStyle('A1:M2')->getFont()->setBold(true);
							$objPHPExcel->getActiveSheet()->getStyle('A1:M100')->getFont()->setName('Arial');
							$objPHPExcel->getActiveSheet()->getStyle('A1:M100')->getFont()->setSize(10);
							$objPHPExcel->getActiveSheet()->getStyle('A1:M2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A1:M2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
							$objPHPExcel->getActiveSheet()->getStyle('A1:M2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
							$objPHPExcel->getActiveSheet()->getStyle('A1:M2')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
							$objPHPExcel->getActiveSheet()->getStyle('A1:M2')->getFill()->getStartColor()->setARGB('dddddddd');
							$objPHPExcel->getActiveSheet()->getRowDimension(1)->setRowHeight('25pt');
							$objPHPExcel->getActiveSheet()->getRowDimension(2)->setRowHeight('25pt');

					        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'COMITÉS ACREDITADOS (NUEVOS)');
							$objPHPExcel->getActiveSheet()->setCellValue('A1', 'No');
							$objPHPExcel->getActiveSheet()->setCellValue('C1', 'DEPARTAMENTO');
							$objPHPExcel->getActiveSheet()->setCellValue('D1', 'MUNICIPIO');
							$objPHPExcel->getActiveSheet()->setCellValue('E1', 'DIRECCION');
							$objPHPExcel->getActiveSheet()->setCellValue('F1', 'CIIU');
							$objPHPExcel->getActiveSheet()->setCellValue('H1', 'TRABAJADORES CAPACITADOS');
							$objPHPExcel->getActiveSheet()->setCellValue('H2', 'HOMBRES');
							$objPHPExcel->getActiveSheet()->setCellValue('I2', 'MUJERES');
							$objPHPExcel->getActiveSheet()->setCellValue('J2', 'TOTAL');
							$objPHPExcel->getActiveSheet()->setCellValue('K1', 'TRABAJADORES BENEFICIADOS');
							$objPHPExcel->getActiveSheet()->setCellValue('K2', 'HOMBRES');
							$objPHPExcel->getActiveSheet()->setCellValue('L2', 'MUJERES');
							$objPHPExcel->getActiveSheet()->setCellValue('M2', 'TOTAL');

							$objPHPExcel->getActiveSheet()->mergeCells('A1:A2');
							$objPHPExcel->getActiveSheet()->mergeCells('B1:B2');
							$objPHPExcel->getActiveSheet()->mergeCells('C1:C2');
							$objPHPExcel->getActiveSheet()->mergeCells('D1:D2');
							$objPHPExcel->getActiveSheet()->mergeCells('E1:E2');
							$objPHPExcel->getActiveSheet()->mergeCells('F1:G2');
							$objPHPExcel->getActiveSheet()->mergeCells('H1:J1');
							$objPHPExcel->getActiveSheet()->mergeCells('K1:M1');

							$i=3;
							$j=1;
							$total_hombres_capacitados=0;
							$total_mujeres_capacitados=0;
							$total_capacitados=0;
							$total_hombres_beneficiados=0;
							$total_mujeres_beneficiados=0;
							$total_beneficiados=0;
					       foreach($resumen_informe_acreditacion as $val) {
					        	$total_hombres_capacitados=$total_hombres_capacitados+$val['total_hombres_capacitados'];
								$total_mujeres_capacitados=$total_mujeres_capacitados+$val['total_mujeres_capacitados'];
								$total_capacitados=$total_capacitados+$val['total_capacitados'];
								$total_hombres_beneficiados=$total_hombres_beneficiados+$val['total_hombres_beneficiados'];
								$total_mujeres_beneficiados=$total_mujeres_beneficiados+$val['total_mujeres_beneficiados'];
								$total_beneficiados=$total_beneficiados+$val['total_beneficiados'];

								$objPHPExcel->setActiveSheetIndex(2)->setCellValue('A'.$i, $j)->setCellValue('B'.$i, $val['nombre'])->setCellValue('C'.$i, $val['direccion'])->setCellValue('D'.$i, $val['departamento'])->setCellValue('E'.$i, $val['municipio'])->setCellValue('F'.$i, $val['ciiu4'])->setCellValue('G'.$i, $val['codigo'])->setCellValue('H'.$i, $val['total_hombres_capacitados'])->setCellValue('I'.$i, $val['total_mujeres_capacitados'])->setCellValue('J'.$i, $val['total_capacitados'])->setCellValue('K'.$i, $val['total_hombres_beneficiados'])->setCellValue('L'.$i, $val['total_mujeres_beneficiados'])->setCellValue('M'.$i, $val['total_beneficiados']);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':M'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('B'.$i.':E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':M'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':M'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
								$objPHPExcel->getActiveSheet()->getStyle('J'.$i)->getFont()->setBold(true);
								$objPHPExcel->getActiveSheet()->getStyle('M'.$i)->getFont()->setBold(true);
								$i++;
								$j++;
							}

							if($j==1) {
					        	$objPHPExcel->getActiveSheet()->mergeCells('A'.$i.':M'.$i);

								$objPHPExcel->getActiveSheet()->setCellValue('A'.$i, '(No se encontraron registros)');
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':M'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':M'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.$i.':M'.$i)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

					        }
					        else {
					        	$i--;
					        	$objPHPExcel->getActiveSheet()->mergeCells('A'.($i+1).':G'.($i+1));
					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('A'.($i+1), 'TOTAL');

					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('H'.($i+1), $total_hombres_capacitados);
					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('I'.($i+1), $total_mujeres_capacitados);
					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('J'.($i+1), $total_capacitados);
					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('K'.($i+1), $total_hombres_beneficiados);
					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('L'.($i+1), $total_mujeres_beneficiados);
					        	$objPHPExcel->setActiveSheetIndex(2)->setCellValue('M'.($i+1), $total_beneficiados);

								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1).':M'.($i+1))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1).':M'.($i+1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
								$objPHPExcel->getActiveSheet()->getStyle('H'.($i+1).':J'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
								$objPHPExcel->getActiveSheet()->getStyle('A'.($i+1).':M'.($i+1))->getFont()->setBold(true);
					        }

					        $objPHPExcel->setActiveSheetIndex(0);

							//Redirige la salida al navegador web de un cliente (Excel5)
							header('Content-Type: application/vnd.ms-excel');
							header('Content-Disposition: attachment;filename="'.$data['nombre'].'.xls"');
							header('Cache-Control: max-age=0');

							//Si se está utilizando IE 9 puede ser necesaria la siguiente línea
							header('Cache-Control: max-age=1');

							//Si se está utilizando IE a través de SSL, puede ser necesario hacer lo siguiente
							header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
							header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
							header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
							header ('Pragma: public'); // HTTP/1.0

							$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
							$objWriter->save('php://output');
							exit;
						}
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

	function probar()
	{
		error_reporting(E_ALL);
		ini_set('display_errors', TRUE);
		ini_set('display_startup_errors', TRUE);

		if (PHP_SAPI == 'cli')
			die('Este archivo sólo se puede ejecutar desde un navegador Web');


		//Creando objeto
		$objPHPExcel = new PHPExcel();

		//Propiedades del documento
		$objPHPExcel->getProperties()->setCreator(strtolower($this->session->userdata('nombre')))
									 ->setLastModifiedBy(strtolower($this->session->userdata('nombre')))
									 ->setTitle("Informe mensual de actividades realizadas en la Sección de Prevención de Riesgos Ocupacionales")
									 ->setSubject("Oficina Departamental de San Salvador")
									 ->setDescription("")
									 ->setKeywords("Informe mensual San Salvador")
									 ->setCategory("Informe");

		//Creado otras dos pestañas
		$objPHPExcel->createSheet();
		$objPHPExcel->createSheet();

		//Renombrando pestañas
		$objPHPExcel->getActiveSheet()->setTitle('Resumen de Inf.');
		$objPHPExcel->setActiveSheetIndex(1);
		$objPHPExcel->getActiveSheet()->setTitle('Comités');
		$objPHPExcel->setActiveSheetIndex(2);
		$objPHPExcel->getActiveSheet()->setTitle('Noviembre 2014');

		/*$objPHPExcel->setActiveSheetIndex(0)
		            ->setCellValue('A1', 'Hello')
		            ->setCellValue('B2', 'world!')
		            ->setCellValue('C1', 'Hello')
		            ->setCellValue('D2', 'world!');

		$objPHPExcel->setActiveSheetIndex(0)
		            ->setCellValue('A4', 'Miscellaneous glyphs')
		            ->setCellValue('A5', 'éàèùâêîôûëïüÿäöüç');*/


		//Cambiar el índice hoja activa a la primera hoja
		$objPHPExcel->setActiveSheetIndex(0);

		//Redirige la salida al navegador web de un cliente (Excel5)
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="prueba.xls"');
		header('Cache-Control: max-age=0');

		//Si se está utilizando IE 9 puede ser necesaria la siguiente línea
		header('Cache-Control: max-age=1');

		//Si se está utilizando IE a través de SSL, puede ser necesario hacer lo siguiente
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');
		exit;

	}
}
?>