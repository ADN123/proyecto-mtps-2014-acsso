<?php
if($exportacion==3) {
	header("Content-type: application/octet-stream");
	header("Content-Disposition: attachment; filename=".$nombre.".xls");
	header("Pragma: no-cache");
	header("Expires: 0");
}
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Ubicación</th>
                <th>Lugar de trabajo</th>
                <th style="width:80px;">Sector</th>
                <th style="width:95px;">Hombres</th>
                <th style="width:95px;">Mujeres</th>
                <th style="width:95px;">Sindicato</th>
                <th>Técnico</th>
            </tr>
        </thead>
        <tbody>
            <?php
                foreach($info as $val) {
			?>
            	<tr>
                	<td><?php echo ucwords($val['ubicacion'])?></td>
                	<td><?php echo $val['institucion']?></td>
                	<td><?php echo $val['nombre_sector']?></td>
                	<td><?php echo $val['total_hombres']?></td>
                	<td><?php echo $val['total_mujeres']?></td>
                	<td><?php if($val['sindicato']==1) echo 'Sí'; else echo 'No';?></td>
                	<td><?php echo ucwords($val['nombre'])?></td>
                </tr>
            <?php
                }
            ?>
        </tbody>
    </table>
</div><!-- table-responsive -->
<?php if($exportacion==1) { ?>
<script>
	$('.table').dataTable({
		"sPaginationType": "full_numbers"
	});
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap'
	});
</script>
<?php } ?>