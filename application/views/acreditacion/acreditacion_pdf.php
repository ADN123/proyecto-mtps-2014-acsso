<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <table align="center" border="0" cellspacing="0" style="width:100%;">
        <tr>
            <td align="left" id="imagen">
                <img src="img/mtps_report.jpg" />
            </td>
            <td align="right">
                <img src="img/escudo.min.gif" />
            </td>
        </tr>
  	</table>
    <br />
    <p>
        el ministerio de trabajo y previción social a través de la dirección general de previsión social, hace constar que el día <strong><?=$this->promocion_model->fecha_letras($lugar_trabajo['fecha_capacitacion'])?></strong> brindó la capacitación inicial estipulada en el artículo 15 de la ley general de prevención de riesgos en los lugares de trabajo, al miembro del comité de seguridad y salud ocupacional de <strong></strong>.
    
    </p>
    <p>
        por lo que la dirección general de previsión social, otorga a <strong><?=$lugar_trabajo['nombre_empleado']?></strong> el presente nombramiento como miembro del comité de seguridad y salud ocupacional de <strong><?=$lugar_trabajo['nombre_lugar']?></strong>.
    </p>
    <p>
        el comité de seguridad y salud ocupacional acreditado tendrá las funciones establecidas en el artículo 17 de la ley general de prevención de riesgos en los lugares de trabajo y sus respectivos reglamentos.
    </p>
    <p>
        el comité de seguridad de <strong><?=$lugar_trabajo['nombre_lugar']?></strong> deberá gestionar sus actividades con su patrono o representante, quien estará en la disposición de colaborar en esta labor.
    </p>    
    <br />
    <p class="extendido">
		Extiendo en <?php 
					$fec=explode("-",$lugar_trabajo['fecha_acreditacion']);
					switch($fec[1]) {
						case 1: 
							$mes="Enero";
							break;
						case 2:
							$mes="Febreo";
							break;
						case 3: 
							$mes="Marzo";
							break;
						case 4: 
							$mes="Abril";
							break;
						case 5: 
							$mes="Mayo";
							break;
						case 6: 
							$mes="Junio";
							break;
						case 7: 
							$mes="Julio";
							break;
						case 8: 
							$mes="Agosto";
							break;
						case 9: 
							$mes="Septiembre";
							break;
						case 10: 
							$mes="Octubre";
							break;
						case 11: 
							$mes="Noviembre";
							break;
						case 12: 
							$mes="Diciembre";
							break;
					}
					
					switch($id_seccion)
					{
						case 52:
						$depto="Ahuachapán";
						break;
						case 53:
						$depto="Cabañas";
						break;
						case 54:
						$depto="Chalatenango";
						break;
						case 55:
						$depto="Cuscatlán";
						break;
						case 56:
						$depto="La Libertad";
						break;
						case 57:
						$depto="La Unión";
						break;
						case 58:
						$depto="Morazán";
						break;
						case 59:
						$depto="San Vicente";
						break;
						case 60:
						$depto="Sonsonate";
						break;
						case 61:
						$depto="Usulután";
						break;
						case 64:
						$depto="Zacatecoluca";
						break;
						case 65:
						$depto="San Miguel";
						break;
						case 66:
						$depto="Santa Ana";
						break;
						default:
						$depto="San Salvador";
						break;
					}
					
				?>
            <?php echo $depto; ?>, 
            <?php echo $fec[2] ?> de 
            <?php echo $mes." ".$fec[0]?> 
    </p>
    <table align="center">
    	<tr>
        	<td align="center">
            	<img src="img/firma_gerencia.png" /><br />
                f. _______________________________________<br />
                LICDA. NORA DEL CARMEN LÓPEZ LAÍNEZ<br />
                DIRECTORA GENERAL DE TRABAJO Y PREVISIÓN SOCIAL<br />
                MINISTERIO DE TRABAJO Y PREVISIÓN SOCIAL
            </td>
        </tr>
    </table>
</body>
</html>