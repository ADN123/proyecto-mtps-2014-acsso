<?php if($id_permiso==3) {?>	
    <div class="form-group">
        <label for="id_empleado" class="col-sm-3 control-label">Técnico <span class="asterisk">*</span></label>
        <div class="col-sm-4">
            <select class="form-control" name="id_empleado" id="id_empleado" data-placeholder="[Seleccione..]" >
                <option value=""></option>
                <?php
                    foreach($tecnico as $val) {
                        echo '<option value="'.$val['id'].'">'.ucwords($val['nombre']).'</option>';
                    }
                ?>
            </select>
        </div>
    </div>
<?php } ?>

<div class="form-group" id="cont-institucion">
    <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo <span class="asterisk">*</span></label>
    <div class="col-sm-4">
        <select class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]" >
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
    <label for="fecha_promocion" class="col-sm-3 control-label">Fecha de promoción <span class="asterisk">*</span></label>
    <div class="col-sm-2">
        <div class="input-group">
            <input type="text" class="form-control" id="fecha_promocion" name="fecha_promocion" readonly="readonly" >
            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>
    </div>
</div>

<div class="form-group">
    <label for="hora_inicio" class="col-sm-3 control-label">Hora de inicio <span class="asterisk">*</span></label>
    <div class="col-sm-2">
        <div class="input-group">
            <div class="bootstrap-timepicker"><input id="timepicker" name="hora_inicio" type="text" class="form-control" readonly="readonly" /></div>
            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
        </div>
    </div>
</div>

<div class="form-group">
    <label for="hora_final" class="col-sm-3 control-label">Hora de finalización <span class="asterisk">*</span></label>
    <div class="col-sm-2">
        <div class="input-group">
            <div class="bootstrap-timepicker"><input id="timepicker2" name="hora_final" type="text" class="form-control" readonly="readonly" /></div>
            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
        </div>
    </div>
</div>

<div class="form-group">
    <label for="nombre_recibio" class="col-sm-3 control-label">Persona que atendió <span class="asterisk">*</span></label>
    <div class="col-sm-6">
        <input type="text" name="nombre_recibio" id="nombre_recibio" class="form-control"/>
    </div>
</div>

<div class="form-group">
    <label for="observaciones" class="col-sm-3 control-label">Observaciones <span class="asterisk">*</span></label>
    <div class="col-sm-7">
        <textarea class="form-control" id="observaciones" name="observaciones" ></textarea>
    </div>
</div>
<script language="javascript" >
	$(document).ready(function(){
		$('#id_empleado').change(function(){
			id=$(this).val();
			$('#cont-institucion').load(base_url()+'index.php/promocion/institucion_visita/'+id+"/1");
			$("#ptab2").load(base_url()+"index.php/promocion/ingreso_promocion_institucion_recargado/0");
			$("#ptab3").load(base_url()+"index.php/promocion/ingreso_promocion_lugar_trabajo_recargado/0");
		});
		
		$("#id_lugar_trabajo").change(function(){
			var id=$(this).val();
			var ids=id.split('***');
			$("#ptab2").load(base_url()+"index.php/promocion/ingreso_promocion_institucion_recargado/"+ids[1]);
			$("#ptab3").load(base_url()+"index.php/promocion/ingreso_promocion_lugar_trabajo_recargado/"+ids[2]);
		});
		$('#fecha_promocion').datepicker({beforeShowDay: $.datepicker.noWeekends, maxDate: '0D'});
		$('#timepicker,#timepicker2').timepicker({defaultTIme: false});
	});
</script>