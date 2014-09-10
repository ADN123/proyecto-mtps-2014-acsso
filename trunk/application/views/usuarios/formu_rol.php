<?php
	$id_rol="";
	$nombre_rol="";
	$descripcion_rol="";
	foreach ($rol as $val) {
		$id_rol=$val['id_rol'];
		$nombre_rol=ucwords($val['nombre_rol']);
		$descripcion_rol=$val['descripcion_rol'];
	}
?>
<div id="progressWizard" class="basic-wizard">
	<?php
		if(isset($id_rol) && $id_rol!="") {
	?>
  			<input type="hidden" id="id_rol" name="id_rol" value="<?=$id_rol?>"/>
   	<?php
		}
	?>
    <ul class="nav nav-pills nav-justified">
        <li><a href="#ptab1" data-toggle="tab"><span>Paso 1:</span> Información General</a></li>
        <li><a href="#ptab2" data-toggle="tab"><span>Paso 2:</span> Información del Sistema</a></li>
    </ul>
    <div class="tab-content">
        <div class="progress progress-striped active">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <div class="tab-pane" id="ptab1">	
            <div class="form-group">
                <label for="nombre_rol" class="col-sm-3 control-label">Nombre del rol <span class="asterisk">*</span></label>
                <div class="col-sm-8">
                    <input type="text" data-req="true" id="nombre_rol" name="nombre_rol" value="<?=$nombre_rol?>" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="descripcion_rol" class="col-sm-3 control-label">Descripción <span class="asterisk">*</span></label>
                <div class="col-sm-8">
                    <textarea class="form-control" id="descripcion_rol" data-req="true" name="descripcion_rol"><?=$descripcion_rol?></textarea>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="ptab2">
            <div id="html1">
                <?=$menu?>
            </div>
        </div>
    </div><!-- tab-content -->
    <ul class="pager wizard">
    	<?php
			if(isset($id_rol) && $id_rol!="") {
		?>
				<li><button class="btn btn-primary" type="button" name="actualizar" id="actualizar"><span class="glyphicon glyphicon-floppy-saved"></span> Actualizar</button></li>
        <?php
			}
			else {
		?>
        		<li><button class="btn btn-success" type="submit" name="aprobar" id="aprobar"><span class="glyphicon glyphicon-floppy-save"></span> Guardar</button></li>
        <?php
			}
		?>
        <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
    </ul>
</div><!-- #basicWizard -->
<script>
	$(document).ready(function(){
		$("#formu select").chosen({
			'width': '100%',
			'min-width': '100px',
			'white-space': 'nowrap',
			no_results_text: "Sin resultados!"
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
		$("#limpiar").click(function(){
			$("#formu").load(base_url()+"index.php/usuarios/datos_de_rol");
		});
	});
</script>