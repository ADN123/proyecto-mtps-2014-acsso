<div id="progressWizard" class="basic-wizard">
	<?php
        if(isset($empleado_institucion['id_empleado_institucion']) && $empleado_institucion['id_empleado_institucion']=!"") {
    ?>
            <input type="hidden" name="id_empleado_institucion" id="id_empleado_institucion" class="form-control"  value="<?php echo $empleado_institucion['id_empleado_institucion'] ?>" />
    <?php
        }
    ?>
    <ul class="nav nav-pills nav-justified">
        <li><a href="#ptab1" data-toggle="tab"><span>Paso 1:</span> Información General</a></li>
    </ul>
      
    <div class="tab-content">
      
        <div class="progress progress-striped active">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
      
        <div class="tab-pane" id="ptab1">
            <div class="form-group">
                <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo <span class="asterisk">*</span></label>
                <div class="col-sm-7">
                    <select data-req="true" class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]" >
                        <option value=""></option>
                        <?php
                            foreach($insticion_lugar_trabajo as $val) {
                               if($empleado_institucion['id_lugar_trabajo']==$val['id'])
                                    echo '<option value="'.$val['id'].'" selected>'.$val['nombre'].'</option>';
                                else
                                    echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                            }
                        ?>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label for="id_tipo_representacion" class="col-sm-3 control-label">Representación <span class="asterisk">*</span></label>
                <div class="col-sm-4">
                    <select data-req="true" class="form-control" name="id_tipo_representacion" id="id_tipo_representacion" data-placeholder="[Seleccione..]" >
                        <option value=""></option>
                        <?php
                            foreach($tipo_representacion as $val) {
                                if($empleado_institucion['id_tipo_representacion']==$val['id'])
                                    echo '<option value="'.$val['id'].'" selected>'.$val['nombre'].'</option>';
                                else
                                    echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                            }
                        ?>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label for="nombre_empleado" class="col-sm-3 control-label">Nombre <span class="asterisk">*</span></label>
                <div class="col-sm-7">
                    <input type="text" name="nombre_empleado" id="nombre_empleado" class="form-control" value="<?php echo $empleado_institucion['nombre_empleado'] ?>" data-req="true" data-tip="var" data-min="5" />
                </div>
            </div>
            
            <div class="form-group">
                <label for="dui_empleado" class="col-sm-3 control-label">DUI <span class="asterisk">*</span></label>
                <div class="col-sm-7">
                    <input type="text" name="dui_empleado" id="dui_empleado" class="form-control" data-req="true" data-tip="dui" value="<?php echo $empleado_institucion['dui_empleado'] ?>" placeholder="######## - #" maxlength="10"/>
                </div>
            </div>
            
            <div class="form-group">
                <label for="cargo_empleado" class="col-sm-3 control-label">Cargo <span class="asterisk">*</span></label>
                <div class="col-sm-7">
                    <input type="text" name="cargo_empleado" id="cargo_empleado" class="form-control" data-req="true" data-tip="var" data-min="5"  value="<?php echo $empleado_institucion['cargo_empleado'] ?>" />
                </div>
            </div>
            
            <div class="form-group">
                <label for="id_tipo_inscripcion" class="col-sm-3 control-label">Tipo de inscripción <span class="asterisk">*</span></label>
                <div class="col-sm-6">
                    <select data-req="true" class="form-control" name="id_tipo_inscripcion" id="id_tipo_inscripcion" data-placeholder="[Seleccione..]" >
                        <option value=""></option>
                        <?php
                            foreach($tipo_inscripcion as $val) {
                                if($empleado_institucion['id_tipo_inscripcion']==$val['id'])
                                    echo '<option value="'.$val['id'].'" selected>'.$val['nombre'].'</option>';
                                else
                                    echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                            }
                        ?>
                    </select>
                </div>
            </div>
        </div>
    </div><!-- tab-content -->
    
    <ul class="pager wizard">
    	<?php
			if(isset($empleado_institucion['id_tipo_inscripcion']) && $empleado_institucion['id_tipo_inscripcion']=!"") {
		?>
				<li><button class="btn btn-primary" type="submit" name="actualizar" id="actualizar"><span class="glyphicon glyphicon-floppy-saved"></span> Actualizar</button></li>
        <?php
			}
			else {
		?>
        		<li><button class="btn btn-success" type="submit" name="guardar" id="guardar"><span class="glyphicon glyphicon-floppy-save"></span> Guardar</button></li>
		<?php
			}
		?>
        <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
    
    </ul>
</div><!-- #basicWizard -->
<script language="javascript" >
	$(document).ready(function(){
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
		$("#limpiar").click(function(){
			$("#formu").load(base_url()+"index.php/acreditacion/participantes_recargado");
			$('#contenido-tabla').load(base_url()+'index.php/acreditacion/empleados_lugar_trabajo/0');
		});	
		$('#id_lugar_trabajo').change(function(){
			id=$(this).val();
			$('#contenido-tabla').load(base_url()+'index.php/acreditacion/empleados_lugar_trabajo/'+id);
		});
		
		$("select").chosen({
			'width': '100%',
			'min-width': '100px',
			'white-space': 'nowrap'
		});
	});
</script>