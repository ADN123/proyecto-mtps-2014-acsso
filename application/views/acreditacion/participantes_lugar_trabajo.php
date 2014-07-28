<div class="table-responsive">
    <table class="table table-hover mb30">
        <thead>
            <tr>
                <th>Nombre del empleado</th>
                <th style="width:100px">Acción</th>
            </tr>
        </thead>
        <tbody>
       	 	<?php
				foreach($empleados_lugar_trabajo as $val) {
					echo '<tr><td>'.$val['nombre'].'</td><td><a href="#" class="edit-row" data-id="'.$val['id'].'"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="delete-row" data-id="'.$val['id'].'"><i class="fa fa-trash-o"></i></a></td></tr>';
				}
			?>
        </tbody>
    </table>
</div><!-- table-responsive -->
<script language="javascript" >
	$(document).ready(function(){
		$('.table').dataTable({
			"sPaginationType": "full_numbers"
		});
		$("select").chosen({
			'width': '100%',
			'min-width': '100px',
			'white-space': 'nowrap'
		});
		$('.delete-row').click(function(){
		  	var id=$(this).data("id");
			var titulo="Alerta";
			var mensaje="Realmente desea eliminar este registro? No podrá revertir los cambios.";
			var url=base_url()+"index.php/acreditacion/eliminar_participante/"+id;
		  	
			confirmacion(titulo, mensaje, url);
			return false;
		});	
		$(".edit-row").click(function(){
			$("#formu").load(base_url()+"index.php/acreditacion/participantes_recargado/"+$(this).data("id"));
			return false;
		});
	});
</script>