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
                <th>Sección</th>
                <th>Ubicación</th>
                <th>Técnico</th>
                <th style="width:95px;">Total</th>
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