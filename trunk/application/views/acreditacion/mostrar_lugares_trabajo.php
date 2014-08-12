<form class="form-horizontal">
    <div class="form-group">
        <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo</label>
        <div class="col-sm-7">
            <select data-req="true" class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]">
                <option value=""></option>
                <?php
                    foreach($insticion_lugar_trabajo as $val) {
                        echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                    }
                ?>
            </select>
        </div>
    </div>
   	<div class="form-group">
            <table class="table2 table-hover mb30">
                <thead>
                    <tr>
                        <th class="all">Empleado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
    </div>
</form>
<script>
	$('.table2').DataTable({
		"sPaginationType": "simple",
		responsive: true
	});
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap',
		no_results_text: "Sin resultados!",
		max_selected_options: 2
	});
</script>