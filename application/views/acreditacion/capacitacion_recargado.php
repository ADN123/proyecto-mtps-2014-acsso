<style>
	.modal-body {
		padding-bottom: 0px;
	}
</style>
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
                        <input data-req="true" data-tip="fec" type="text" class="form-control" id="fecha_capacitacion" name="fecha_capacitacion" value="<?php echo date('d/m/Y')?>" readonly >
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="hora_visita" class="col-sm-3 control-label">Hora <span class="asterisk">*</span></label>
                <div class="col-sm-4">
                    <div class="input-group">
                        <div class="bootstrap-timepicker"><input data-req="true" id="timepicker" type="text" name="hora_capacitacion" class="form-control" readonly /></div>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="id_empleado" class="col-sm-3 control-label">Técnico(s) <span class="asterisk">*</span></label>
                <div class="col-sm-7">
                    <select data-req="true" multiple class="form-control" name="id_empleado[]" id="id_empleado" data-placeholder="[Seleccione..]" >
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
                <label class="col-sm-3 control-label">Lugar</label>
                <div class="col-sm-7 control-label">
                    <div class="toggle toggle-default"></div>
                    <input style="display:none" type="checkbox" name="int" id="int" checked>
                </div>
            </div>
            
            <div class="form-group">
                <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo <span class="asterisk">*</span></label>
                <div class="col-sm-7">
                    <select data-req="false" class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]" disabled>
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
                <a class="btn btn-default" id="agregar-empleado" style="margin-bottom: 10px;">Agregar Empleado</a>
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
		$('.table').DataTable({
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