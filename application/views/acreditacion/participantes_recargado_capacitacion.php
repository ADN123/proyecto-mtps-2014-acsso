        	<input type="hidden" name="id_empleado_institucion" id="id_empleado_institucion" class="form-control"  value="<?php echo $empleado_institucion['id_empleado_institucion'] ?>" />
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

<script language="javascript" >
	$(document).ready(function(){
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
			'white-space': 'nowrap',
			no_results_text: "Sin resultados!"
		});
	});
</script>