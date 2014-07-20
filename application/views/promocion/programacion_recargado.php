<?php
	if(isset($programacion['id_programacion_visita']) && $programacion['id_programacion_visita']=!"") {
?>
		<input type="hidden" name="id_programacion_visita" id="id_programacion_visita" class="form-control"  value="<?php echo $idpv ?>" />
<?php
	}
?>    
<div class="form-group">
    <label for="id_empleado" class="col-sm-3 control-label">Técnico <span class="asterisk">*</span></label>
    <div class="col-sm-7">
        <select class="form-control" name="id_empleado" id="id_empleado" data-placeholder="[Seleccione..]" required="required">
            <option value=""></option>
            <?php
                foreach($tecnico as $val) {
					if($programacion['id_empleado']==$val['id'])
                   		echo '<option value="'.$val['id'].'" selected="selected">'.ucwords($val['nombre']).'</option>';
					else
                   		echo '<option value="'.$val['id'].'">'.ucwords($val['nombre']).'</option>';
                }
            ?>
        </select>
    </div>
</div>

<div class="form-group" id="cont-institucion">
    <label for="id_institucion" class="col-sm-3 control-label">Institución <span class="asterisk">*</span></label>
    <div class="col-sm-7">
        <select class="form-control" name="id_institucion" id="id_institucion" data-placeholder="[Seleccione..]" required="required">
            <option value=""></option>
            <?php
                foreach($institucion as $val) {
					if($programacion['id_institucion']==$val['id'])
                   		echo '<option value="'.$val['id'].'" selected="selected">'.ucwords($val['nombre']).'</option>';
					else
                   		echo '<option value="'.$val['id'].'">'.ucwords($val['nombre']).'</option>';
                }
            ?>
        </select>
    </div>
</div>

<div class="form-group" id="cont-lugar-trabajo">
    <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo <span class="asterisk">*</span></label>
    <div class="col-sm-7">
        <select class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]" required="required">
            <option value=""></option>
            <?php
                foreach($lugar_trabajo as $val) {
					if($programacion['id_lugar_trabajo']==$val['id'])
                   		echo '<option value="'.$val['id'].'" selected="selected">'.ucwords($val['nombre']).'</option>';
					else
                   		echo '<option value="'.$val['id'].'">'.ucwords($val['nombre']).'</option>';
                }
            ?>
        </select>
    </div>
</div>

<div class="form-group" id="cont-lugar-trabajo">
    <label for="fecha_visita" class="col-sm-3 control-label">Fecha de visita <span class="asterisk">*</span></label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="text" class="form-control" id="fecha_visita" name="fecha_visita" value="<?php echo $programacion['fecha_visita'];?>" readonly required="required"/>
            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>
    </div>
</div>

<div class="form-group" id="cont-lugar-trabajo">
    <label for="hora_visita" class="col-sm-3 control-label">Hora de visita <span class="asterisk">*</span></label>
    <div class="col-sm-4">
        <div class="input-group">
            <div class="bootstrap-timepicker"><input id="timepicker" type="text" class="form-control" value="<?php echo $programacion['hora_visita'];?>"  readonly required="required"/></div>
            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
        </div>
    </div>
</div>

<ul class="pager wizard">
	<?php
		if(isset($programacion['id_programacion_visita']) && $programacion['id_programacion_visita']=!"") {
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

<script>
	id_lugar_trabajo=$("#id_lugar_trabajo").val();
	$(document).ready(function() {
		$('#id_empleado').change(function(){
			id=$(this).val();
			$('#cont-institucion').load(base_url()+'index.php/promocion/institucion_visita/'+id);
			$('#cont-lugar-trabajo').load(base_url()+'index.php/promocion/lugares_trabajo_institucion_visita/0/0/0');
			$('#cont-calendario').load(base_url()+'index.php/promocion/calendario/'+id);
		});
		
		$("select").chosen({
			'width': '100%',
			'min-width': '100px',
			'white-space': 'nowrap'
		});
		
		$('#fecha_visita').datepicker({beforeShowDay: $.datepicker.noWeekends, minDate: '0D'});
		$('#timepicker').timepicker({defaultTIme: false});

		$("#limpiar").click(function(){
			$("#formu").load(base_url()+"index.php/promocion/programa_recargado");
			$('#cont-calendario').load(base_url()+'index.php/promocion/calendario/0');
		});
	});
</script>