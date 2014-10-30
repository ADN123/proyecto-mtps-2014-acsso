<?php
	$objeto='el registro de <strong>asignación</strong>';
	switch($accion_transaccion) {
		case 1: 
			$accion_transaccion="guarda";
			break;
		case 2: 
			$accion_transaccion="actualiza";
			break;
		case 3: 
			$accion_transaccion="elimina";
			break;
	}
	if($estado_transaccion==1) {
		$class='success';
		$mensaje='<span class="glyphicon glyphicon-info-sign"></span> '.ucfirst($objeto).' se ha <strong>'.$accion_transaccion.'do</strong> éxitosamente!  Si deseas crear el registro de programación de visita da click <a href="'.base_url().'index.php/promocion/programa" class="alert-link">aquí</a>.';
	}
	else {
		$class='danger';
		$mensaje='<span class="glyphicon glyphicon-exclamation-sign"></span> Error al intentar <strong>'.$accion_transaccion.'r</strong> '.$objeto.': Se perdió la señal de la red. Porfavor vuelva a intentarlo.';
	}
	if($estado_transaccion!="" && $estado_transaccion!=NULL) {	
?>
        <div class="alert alert-<?php echo $class?>">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <?php echo $mensaje?>
        </div>
<?php } 

?>
<div class="col-md-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="5" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Datos de la visita</h3>
        </div>
        <div class="panel-body">
  			<form class="form-horizontal" name="formu" id="formu" method="post" action="<?php echo base_url()?>index.php/promocion/guardar_asignacion" autocomplete="off">                
                <div class="form-group">
                    <label for="id_empleado" class="col-sm-3 control-label">Técnico <span class="asterisk">*</span></label>
                    <div class="col-sm-7">
                        <select data-req="true" class="form-control" name="id_empleado" id="id_empleado" data-placeholder="[Seleccione..]" >
                            <option value=""></option>
                            <?php
                                foreach($tecnico as $val) {
                                    echo '<option value="'.$val['id'].'">'.ucwords($val['nombre']).'</option>';
                                }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                	<div class="col-sm-12">		
                        <table class="table table-hover mb30" id="lugar_trabajo">
                            <thead>
                                <tr>
                                    <th class="all">Nombre lugar de trabajo</th>
                                    <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                   	</div>
               	</div>                 
                <ul class="pager wizard">
                    <li><button class="btn btn-success" type="button" name="guardar" id="guardar"><span class="glyphicon glyphicon-floppy-save"></span> Guardar</button></li>
                    <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
                </ul>
                <input type="hidden" name="tabla" id="tabla" />
            </form>
      	</div>
   	</div>
</div>
<div class="col-md-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="6" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Lugares de trabajo</h3>
        </div>
        <div class="panel-body" id="contenido-tabla">
            <table class="table table-hover mb30">
                <thead>
                    <tr>
                        <th class="all">Nombre lugar de trabajo</th>
                        <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
      	</div>
   	</div>
</div>
<script>
	$(document).ready(function() {
		var table = $('.table').dataTable();
		var tt=$('#lugar_trabajo').DataTable();
		$("#formu").submit(function(){
        	var data = table.$('input, select').serialize();
			$('#tabla').val(data);
		});
		$('#id_empleado').change(function(){
			id=$(this).val();
			$('#contenido-tabla').load(base_url()+'index.php/promocion/lugares_trabajo_empresa_asigna/'+id);
			$('#lugar_trabajo').find('tbody tr').addClass('quitar');
			tt.row('.quitar').remove().draw( false );
			$.ajax({
				async:	true, 
				url:	base_url()+'index.php/promocion/ver_asignaciones_programacion/'+id,
				dataType:"json",
				type: "GET",
				success: function(data) {
					var json=data;
					//json['resultado'];
				}
			});	
		});
		$("#guardar").click(function(){
			$("#formu").submit();
		});
		$("#limpiar").click(function(){
			$("#formu").load(base_url()+"index.php/promocion/asignacion_recargado");
		});
	});
</script>