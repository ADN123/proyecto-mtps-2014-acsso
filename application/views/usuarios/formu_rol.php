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
	select, .chosen-container {
		position: absolute;
		left: 340px;
	}
	.jstree-default .jstree-anchor {
		height: 35px;
	}
</style>
<form name="formu" id="formu" style="max-width: 600px;" method="post" action="<?php echo base_url()?>index.php/usuarios/<?=$dir?>">
  	<input type="hidden" id="id_rol" name="id_rol" value="<?=$id_rol?>"/>
	<fieldset>      
        <legend align='left'>Información del Rol</legend>
        <p>
            <label for="nombre_rol" id="lnombre_rol">Nombre del rol </label>
            <input type="text" tabindex="1" id="nombre_rol" name="nombre_rol" value="<?=$nombre_rol?>" class="tam-3"/>
        </p>
        <p>
            <label for="descripcion_rol" id="ldescripcion_rol" class="label_textarea">Descripción </label>
            <textarea class="tam-4" id="descripcion_rol" tabindex="2" name="descripcion_rol"><?=$descripcion_rol?></textarea>
        </p>
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
		$('#html1').jstree();
	});
</script>