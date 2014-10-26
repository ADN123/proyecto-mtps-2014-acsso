<table class="table table-hover mb30">
    <thead>
        <tr>
            <th class="all">Nombre lugar de trabajo</th>
            <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
        </tr>
    </thead>
    <tbody>
        <?php
            foreach($lugar_trabajo as $val) {
                echo '<tr><td>'.$val['nombre'].'</td><td><a href="#" class="edit-row" onClick="asignar('.$val['id'].');return false;" data-id="'.$val['id'].'"><i class="glyphicon glyphicon-paperclip"></i></a></td></tr>';
            }
        ?>
    </tbody>
</table>
<script language="javascript" >
	$(document).ready(function(){
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
	});	
	function asignar(id){
		$("#formu").load(base_url()+"index.php/promocion/lugares_trabajo_recargado/"+id);
		return false;
	}
</script>