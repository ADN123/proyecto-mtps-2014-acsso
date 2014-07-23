<?php
	$id_rol="";
	$nombre_rol="";
	$descripcion_rol="";
	$dir="guardar_rol";
	$label="Guardar";
	foreach ($rol as $val) {
		$id_rol=$val['id_rol'];
		$nombre_rol=ucwords($val['nombre_rol']);
		$descripcion_rol=$val['descripcion_rol'];
		$dir="actualizar_rol";
		$label="Actualizar";
	}
?>
<style>
	i.jstree-icon.jstree-themeicon.disabled.jstree-themeicon-custom {
		display: none;
	}
	#formu .chosen-container {
		position: absolute;
		left: 340px;
	}
	.jstree-default .jstree-anchor {
		height: 35px;
	}
</style>
<form name="formu" id="formu" class="form-horizontal" style="max-width: 600px;" method="post" action="<?php echo base_url()?>index.php/usuarios/<?=$dir?>">
  	<input type="hidden" id="id_rol" name="id_rol" value="<?=$id_rol?>"/>
	<fieldset class="mb15">      
        <legend align='left'>Información del Rol</legend>
          	<div class="form-group">
                <label for="nombre_rol" class="col-sm-3 control-label">Nombre del rol <span class="asterisk">*</span></label>
                <div class="col-sm-8">
                    <input type="text" tabindex="1" id="nombre_rol" title="Your name is required!" name="nombre_rol" value="<?=$nombre_rol?>" class="form-control input-sm"/>
                </div>
            </div>
            <div class="form-group">
                <label for="descripcion_rol" class="col-sm-3 control-label">Descripción <span class="asterisk">*</span></label>
                <div class="col-sm-8">
                	<textarea class="form-control" id="descripcion_rol" tabindex="2" name="descripcion_rol"><?=$descripcion_rol?></textarea>
               	</div>
          	</div>
    </fieldset>
    <fieldset>      
        <legend align='left'>Información del Sistema</legend>
        <div id="html1">
        	<?=$menu?>
       	</div>
  	</fieldset>
    <p style='text-align: center;'>
        <button type="submit" id="aprobar" class="button tam-1 boton_validador" name="aprobar"><?=$label?></button>
    </p>
</form>
<script>
	$(document).ready(function() {
		$("#formu select").chosen({
			'width': '150px',
			'white-space': 'nowrap',
			'placeholder': 'sadfasdf'
		});
		/*$('#html1').jstree();*/
	});
</script>