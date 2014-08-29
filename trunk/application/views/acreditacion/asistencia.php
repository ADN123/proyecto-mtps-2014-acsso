<style>
	.modal-body {
		padding-bottom: 0px;
	}
</style>
<?php
	$objeto='la <strong>asistencia a la capacitación</strong>';
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
		$mensaje='<span class="glyphicon glyphicon-info-sign"></span> '.ucfirst($objeto).' se ha <strong>'.$accion_transaccion.'do</strong> éxitosamente! Si deseas registrar un comité de seguridad ocupacional presiona <a href="'.base_url().'index.php/acreditacion/asistencia" class="alert-link">aquí</a>.';
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
<?php } ?>
<div class="col-sm-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="15" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Datos de la asistencia</h3>
        </div>
        <div class="panel-body panel-body-nopadding">
        	<form class="form-horizontal" name="formu" id="formu" method="post" action="<?php echo base_url()?>index.php/acreditacion/guardar_capacitacion" autocomplete="off">
                <div id="progressWizard" class="basic-wizard">
                    
                    <ul class="nav nav-pills nav-justified">
                        <li><a href="#ptab1" data-toggle="tab"><span>Paso 1:</span> Información General</a></li>
                    </ul>
                      
                    <div class="tab-content">
                      
                      	<div class="progress progress-striped active">
                        	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                      	</div>
                      
                  		<div class="tab-pane" id="ptab1">
                        	<table id="empleados" class="table table-hover mb30">
                                    <thead>
                                        <tr>
                                            <th class="all">Nombre del empleado</th>
                                            <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                        </div>
                   	</div><!-- tab-content -->
                    
                    <ul class="pager wizard">
                        <li><button class="btn btn-success" type="submit" name="guardar" id="guardar"><span class="glyphicon glyphicon-floppy-save"></span> Guardar</button></li>
                        <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
              		
                    </ul>
                </div><!-- #basicWizard -->
 			</form> 
      	</div>
    </div><!-- panel -->
</div>
<div class="col-sm-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="16" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title" id="titulo-tabla">Capacitaciones registradas</h3>
        </div>
        <div class="panel-body" id="contenido-tabla">
          		<table class="table table-hover mb30">
            		<thead>
              			<tr>
                            <th class="all">Fecha</th>
                            <th class="desktop">Lugar</th>
                            <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
              			</tr>
            		</thead>
            		<tbody>
                    	<?php
							foreach($capacitaciones as $val) {
								echo '<tr><td>'.$val['fecha'].'</td><td>'.$val['lugar'].'</td><td><a href="#" class="edit-row" onClick="editar('.$val['id'].');return false;" data-id="'.$val['id'].'"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="delete-row" onClick="eliminar('.$val['id'].');return false;" data-id="'.$val['id'].'"><i class="fa fa-trash-o"></i></a></td></tr>';
							}
						?>
            		</tbody>
          		</table>
        </div>
  	</div>
</div>
<script language="javascript" >
	var emp = new Array()
	$(document).ready(function(){	
		$('.toggle').toggles({
			on: true,
			text: {
				on:"INTERNO",
				off:"EXTERNO"
			},
			checkbox:$('#int')
		});
		
		$("#agregar-empleado").click(function(){
			modal("Empleados por lugar de trabajo",base_url()+'index.php/acreditacion/mostrar_lugares_trabajo');
		});
		$("#id_empleado").bind("chosen:maxselected", function () { alerta_rapida("Error en la selección de técnicos", "Sólo puede seleccionar 2 técnicos como máximo", "danger")}); 
		
		$("#int").change(function(){
			if(!$(this).is(':checked')) {
				$("#id_lugar_trabajo").attr("disabled",false);
				$("#id_lugar_trabajo").data("req",true);
				$("#id_lugar_trabajo").trigger("chosen:updated");
			}
			else {
				$("#id_lugar_trabajo").val("");
				$("#id_lugar_trabajo").attr("disabled",true);
				$("#id_lugar_trabajo").data("req",false);
				$("#id_lugar_trabajo").trigger("chosen:updated");
			}
		});
	  	$('#progressWizard').bootstrapWizard({
			'nextSelector': '.next',
			'previousSelector': '.previous',
			onNext: function(tab, navigation, index) {
		  		var $total = navigation.find('li').length;
		  		var $current = index+1;
		  		var $percent = ($current/$total) * 100;
		  		$('#progressWizard').find('.progress-bar').css('width', $percent+'%');
			},
			onPrevious: function(tab, navigation, index) {
		  		var $total = navigation.find('li').length;
		  		var $current = index+1;
		  		var $percent = ($current/$total) * 100;
		  		$('#progressWizard').find('.progress-bar').css('width', $percent+'%');
			},
			onTabShow: function(tab, navigation, index) {
		  		var $total = navigation.find('li').length;
		  		var $current = index+1;
		  		var $percent = ($current/$total) * 100;
		  		$('#progressWizard').find('.progress-bar').css('width', $percent+'%');
			}
	  	});	
		$('#fecha_capacitacion').datepicker({beforeShowDay: $.datepicker.noWeekends, minDate: '0D'});
		$('#timepicker').timepicker({defaultTIme: false});
		$("#limpiar").click(function(){
			emp.length=0;
			$("#formu").load(base_url()+"index.php/acreditacion/capacitacion_recargado");
		});
	});
	function editar(id){
		$("#formu").load(base_url()+"index.php/acreditacion/capacitacion_recargado/"+id);
		return false;
	};
	function eliminar(id){
		var titulo="Alerta";
		var mensaje="Realmente desea eliminar este registro? No podrá revertir los cambios.";
		var url=base_url()+"index.php/acreditacion/eliminar_capacitacion/"+id;
		confirmacion(titulo, mensaje, url);
		return false;
	}	
	function quitar_empleado(id,e){
		var padre=e.parentNode.parentNode;
		padre.className="quitar";
		emp[id]=0;
		var t=$('#empleados').DataTable();
		t.row('.quitar').remove().draw( false );
		return false;
	}
	function editar_empleado(id){
		modal("Editar empleado",base_url()+'index.php/acreditacion/participantes_recargado_capacitacion/'+id);
		return false;
	}
</script>