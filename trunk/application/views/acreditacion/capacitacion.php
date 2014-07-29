<?php
	$objeto='la <strong>programación de capacitación</strong>';
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
		$mensaje='<span class="glyphicon glyphicon-info-sign"></span> '.ucfirst($objeto).' se ha <strong>'.$accion_transaccion.'do</strong> éxitosamente! Si deseas registrar la asistencia de una capacitación presiona <a href="'.base_url().'index.php/acreditacion/programa" class="alert-link">aquí</a>.';
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
        	<h3 class="panel-title">Datos de la capacitación</h3>
        </div>
        <div class="panel-body panel-body-nopadding">
        	<form class="form-horizontal" name="formu" id="formu" method="post" action="<?php echo base_url()?>index.php/acreditacion/guardar_lugar_trabajo" autocomplete="off">
                <div id="progressWizard" class="basic-wizard">
                    
                    <ul class="nav nav-pills nav-justified">
                        <li><a href="#ptab1" data-toggle="tab"><span>Paso 1:</span> Información General</a></li>
                        <li><a href="#ptab2" data-toggle="tab"><span>Paso 2:</span> Información de Empleados</a></li>
                    </ul>
                      
                    <div class="tab-content">
                      
                      	<div class="progress progress-striped active">
                        	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                      	</div>
                      
                  		<div class="tab-pane" id="ptab1">
                        	<div class="form-group">
                                <label for="fecha_visita" class="col-sm-3 control-label">Fecha <span class="asterisk">*</span></label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input data-req="true" data-tip="fec" type="text" class="form-control" id="fecha_visita" name="fecha_visita" value="<?php echo date('d/m/Y')?>" readonly >
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="hora_visita" class="col-sm-3 control-label">Hora <span class="asterisk">*</span></label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <div class="bootstrap-timepicker"><input data-req="true" id="timepicker" type="text" class="form-control" readonly /></div>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                              	<label class="col-sm-3 control-label">Lugar</label>
                              	<div class="col-sm-7 control-label">
                                	<div class="toggle toggle-default"></div>
                                    <input style="display:none" type="checkbox" name="int" id="int" checked>
                              	</div>
                            </div>
                            
                            <div class="form-group">
                                <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo <span class="asterisk">*</span></label>
                                <div class="col-sm-7">
                                    <select data-req="true" class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]" disabled>
                                        <option value=""></option>
                                        <?php
                                            foreach($insticion_lugar_trabajo as $val) {
                                                echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                		<div class="tab-pane" id="ptab2">
                                <a class="btn btn-default" id="agregar-empleado">Agregar Empleado</a>
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
<script language="javascript" >
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
		
		var t=$('#empleados').DataTable();
		$('#agregar_empleado').click(function() {
			t.row.add([
				'.1',
				'<input type="text">'
			]).draw();
		});
		
		$("#int").change(function(){
			if(!$(this).is(':checked')) {
				$("#id_lugar_trabajo").attr("disabled",false);
				$("#id_lugar_trabajo").trigger("chosen:updated");
			}
			else {
				$("#id_lugar_trabajo").val("");
				$("#id_lugar_trabajo").attr("disabled",true);
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
		$('#fecha_visita').datepicker({beforeShowDay: $.datepicker.noWeekends, minDate: '0D'});
		$('#timepicker').timepicker({defaultTIme: false});
		$("#limpiar").click(function(){
			$("#formu").load(base_url()+"index.php/acreditacion/lugares_trabajo_recargado");
			$('#contenido-tabla').load(base_url()+'index.php/acreditacion/lugares_trabajo_empresa/0');
		});
	});
</script>