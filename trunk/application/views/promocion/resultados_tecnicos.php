<?php
if($exportacion==3) {
	header("Content-type: application/octet-stream");
	header("Content-Disposition: attachment; filename=".$nombre.".xls");
	header("Pragma: no-cache");
	header("Expires: 0");
}
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <table class="table">
        <thead>
            <tr>
                <th class="desktop tablet-l" >Sección</th>
                <th class="desktop" >Ubicación</th>
                <th class="all" >Técnico</th>
                <th class="desktop tablet-l tablet-p"style="width:95px;">Total</th>
            </tr>
        </thead>
        <tbody>
            <?php
                foreach($info as $val) {
			?>
            	<tr>
                	<td><?php echo ucwords($val['seccion'])?></td>
                	<td><?php echo $val['id_seccion']?></td>
                	<td><?php echo ucwords($val['nombre'])?></td>
                	<td><?php echo $val['total']?></td>
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
		'white-space': 'nowrap',
		no_results_text: "Sin resultados!"
	});
</script>
<?php } ?>