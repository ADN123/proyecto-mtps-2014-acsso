<?php
if($exportacion==3) {
	header("Content-type: application/octet-stream");
	header("Content-Disposition: attachment; filename=".$nombre.".xls");
	header("Pragma: no-cache");
	header("Expires: 0");
}
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <table class="display table responsive no-wrap" style="width: 100%;">
        <thead>
            <tr>
            	<?php
					$css='';
					if($exportacion==3) {
						$css='background-color: #CCC;';
					}
				?>
               	<th class="desktop" style="<?php echo $css;?>">FECHA DE PROMOCION</th>
                <th class="none" style="<?php echo $css;?>">UBICACION</th>
                <th class="all" style="<?php echo $css;?>">LUGAR DE TRABAJO</th>
                <th class="none" style="<?php echo $css;?>">SECTOR</th>
                <th class="none" style="<?php echo $css;?>">HOMBRES</th>
                <th class="none" style="<?php echo $css;?>">MUJERES</th>
                <th class="none" style="<?php echo $css;?>">SINDICATO</th>
                <th class="desktop" style="<?php echo $css;?>">TECNICO</th>
            </tr>
        </thead>
        <tbody>
            <?php
                foreach($info as $val) {
			?>
            	<tr style="cursor: pointer;" class="ver_promociones" data-id="<?php echo $val['id_promocion']?>">
					<?php
                        if($exportacion==3) {
                    ?>
                    <?php
                        }
                    ?>
                 	<td align="center"><?php echo ucwords($val['fecha'])?></td>
                	<td align="left"><?php echo ucwords($val['ubicacion'])?></td>
                	<td align="left"><?php echo $val['institucion']?></td>
                	<td align="left"><?php echo $val['nombre_sector']?></td>
                	<td align="right"><?php echo $val['total_hombres']?></td>
                	<td align="right"><?php echo $val['total_mujeres']?></td>
                	<td align="left"><?php if($val['sindicato']==1) echo 'Sí'; else echo 'No';?></td>
                	<td align="left"><?php echo ucwords($val['nombre'])?></td>
                </tr>
            <?php
                }
            ?>
        </tbody>
    </table>
<?php if($exportacion==1) { ?>
<script>
	$('.table').DataTable({
		"sPaginationType": "simple",
		responsive: true
	});
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap'
	});
</script>
<?php } ?>