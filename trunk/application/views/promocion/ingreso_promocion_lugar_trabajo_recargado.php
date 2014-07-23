<div class="form-group">
    <label for="id_tipo_lugar_trabajo" class="col-sm-3 control-label">Tipo de lugar de trabajo <span class="asterisk">*</span></label>
    <div class="col-sm-4">
        <select class="form-control" name="id_tipo_lugar_trabajo" id="id_tipo_lugar_trabajo" data-placeholder="[Seleccione..]" >
            <option value=""></option>
            <?php
                foreach($tipo_lugar_trabajo as $val) {
                    if($lugar_trabajo['id_tipo_lugar_trabajo']==$val['id'])
						echo '<option value="'.$val['id'].'" selected>'.$val['nombre'].'</option>';
					else
						echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                }
            ?>
        </select>
    </div>
</div>

<div class="form-group">
    <label for="nombre_lugar" class="col-sm-3 control-label">Nombre lugar de trabajo <span class="asterisk">*</span></label>
    <div class="col-sm-7">
        <input type="text" name="nombre_lugar" id="nombre_lugar" class="form-control" value="<?php echo $lugar_trabajo['nombre']?>" />
    </div>
</div>

<div class="form-group">
    <label for="direccion_lugar" class="col-sm-3 control-label">Dirección <span class="asterisk">*</span></label>
    <div class="col-sm-7">
        <textarea class="form-control" id="direccion_lugar" tabindex="2" name="direccion_lugar" ><?php echo $lugar_trabajo['direccion_lugar']?></textarea>
    </div>
</div>

<div class="form-group">
    <label for="id_municipio" class="col-sm-3 control-label">Municipio <span class="asterisk">*</span></label>
    <div class="col-sm-4">
        <select class="form-control" name="id_municipio" id="id_municipio" data-placeholder="[Seleccione..]" >
            <option value=""></option>
            <?php
                foreach($municipio as $val) {
                    if($lugar_trabajo['id_municipio']==$val['id'])
						echo '<option value="'.$val['id'].'" selected>'.$val['nombre'].'</option>';
					else	
						echo '<option value="'.$val['id'].'">'.$val['nombre'].'</option>';
                }
            ?>
        </select>
    </div>
</div>

<div class="form-group">
    <label for="nombre_contacto" class="col-sm-3 control-label">Nombre contacto <span class="asterisk">*</span></label>
    <div class="col-sm-6">
        <input type="text" name="nombre_contacto" id="nombre_contacto" class="form-control" value="<?php echo $lugar_trabajo['nombre_contacto']?>" />
    </div>
</div>

<div class="form-group">
    <label for="telefono" class="col-sm-3 control-label">Teléfono contacto <span class="asterisk">*</span></label>
    <div class="col-sm-2">
        <input type="tel" name="telefono" id="telefono" class="form-control" value="<?php echo $lugar_trabajo['telefono']?>"/>
    </div>
</div>

<div class="form-group">
    <label for="correo" class="col-sm-3 control-label">Correo contacto <span class="asterisk">*</span></label>
    <div class="col-sm-4">
        <input type="email" name="correo" id="correo" class="form-control" value="<?php echo $lugar_trabajo['correo']?>"  />
    </div>
</div>

<div class="form-group">
    <label for="total_hombres" class="col-sm-3 control-label">Total hombres <span class="asterisk">*</span></label>
    <div class="col-sm-1">
        <input type="number" name="total_hombres" id="total_hombres" class="form-control" value="<?php if($lugar_trabajo['id_lugar_trabajo']=="")echo ''; else echo $lugar_trabajo['total_hombres'];?>" />
    </div>
</div>

<div class="form-group">
    <label for="total_mujeres" class="col-sm-3 control-label">Total Mujeres <span class="asterisk">*</span></label>
    <div class="col-sm-1">
        <input type="number" name="total_mujeres" id="total_mujeres" class="form-control" value="<?php if($lugar_trabajo['id_lugar_trabajo']=="")echo ''; else echo $lugar_trabajo['total_mujeres'];?>" />
    </div>
</div>
<script language="javascript" >
	$(document).ready(function(){	
		$("select").chosen({
			'width': '100%',
			'min-width': '100px',
			'white-space': 'nowrap'
		});
	});
</script>