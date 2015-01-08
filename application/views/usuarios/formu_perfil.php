<?php
	$objeto='el <strong>usuario</strong>';
	switch($accion_transaccion) {
		case 2: 
			$accion_transaccion="actualiza";
			break;
	}
	if($estado_transaccion==1) {
		$class='success';
		$mensaje='<span class="glyphicon glyphicon-info-sign"></span> '.ucfirst($objeto).' se ha <strong>'.$accion_transaccion.'do</strong> éxitosamente!';
	}
	else {
		$class='danger';
		if($estado_transaccion==2)
			$mensaje='<span class="glyphicon glyphicon-exclamation-sign"></span> Error al intentar <strong>'.$accion_transaccion.'r</strong> '.$objeto.': Se perdió la señal de la red. Porfavor vuelva a intentarlo.';
		else
			if($estado_transaccion==3)
				$mensaje='<span class="glyphicon glyphicon-exclamation-sign"></span> Error al intentar <strong>'.$accion_transaccion.'r</strong> '.$objeto.': La contraseña actual es incorrecta. Porfavor vuelva a intentarlo.';
			else
				$mensaje='<span class="glyphicon glyphicon-exclamation-sign"></span> Error al intentar <strong>'.$accion_transaccion.'r</strong> '.$objeto.': La nueva contraseña no coincide con su replica. Porfavor vuelva a intentarlo.';
	}
	if($estado_transaccion!="" && $estado_transaccion!=NULL) {	
?>
        <div class="alert alert-<?php echo $class?>">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <?php echo $mensaje?>
        </div>
<?php } ?>
<div class="col-sm-3">
</div>
<div class="col-sm-6">
    <div class="panel panel-danger">
        <div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="7" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Datos del usuario</h3>
        </div>
        <div class="panel-body panel-body-nopadding">
        	<form name="formu" id="formu" class="form-horizontal" method="post" action="<?php echo base_url()?>index.php/usuarios/actualizar_usuario" autocomplete="off">
				<div id="progressWizard" class="basic-wizard">
                    <ul class="nav nav-pills nav-justified">
                        <li><a href="#ptab1" data-toggle="tab"><span>Paso 1:</span> Información General</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="tab-pane" id="ptab1">
                            <div class="form-group">
                                <label for="usuario" class="col-sm-4 control-label">Nombre <span class="asterisk">*</span></label>
                                <label for="usuario" class="col-sm-6 control-label" style="text-align: left; text-transform: uppercase;"><strong><?=$usuario['nombre']?></strong></label>
                            </div>
                            <div class="form-group">
                                <label for="usuario" class="col-sm-4 control-label">Sección <span class="asterisk">*</span></label>
                                <label for="usuario" class="col-sm-6 control-label" style="text-align: left; text-transform: uppercase;"><strong><?=$usuario['seccion']?></strong></label>
                            </div>
                            <div class="form-group">
                                <label for="usuario" class="col-sm-4 control-label">Usuario <span class="asterisk">*</span></label>
                                <label for="usuario" class="col-sm-6 control-label" style="text-align: left"><strong><?=$usuario['usuario']?></strong></label>
                            </div>
                            <div class="form-group">
                                <label for="new_password" class="col-sm-4 control-label">Contraseña nueva <span class="asterisk">*</span></label>
                                <div class="col-sm-6">
                                    <input type="password" id="new_password" name="new_password" data-req="true" data-tip="pas" data-min="8" data-max="20"  class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_password2" class="col-sm-4 control-label">Repita contraseña nueva <span class="asterisk">*</span></label>
                                <div class="col-sm-6">
                                    <input type="password" id="new_password2" name="new_password2" data-req="true" data-tip="pas" data-min="8" data-max="20"  class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-4 control-label">Contraseña actual <span class="asterisk">*</span></label>
                                <div class="col-sm-6">
                                    <input type="password" id="password" name="password" data-req="true" data-min="8" data-max="20"  class="form-control"/>
                                </div>
                            </div>
                        </div>
                 	</div>
                    <ul class="pager wizard">
						<li><button class="btn btn-primary" type="submit" name="actualizar" id="actualizar"><span class="glyphicon glyphicon-floppy-saved"></span> Actualizar</button></li>
                    </ul>
              	</div>
          	</form>
        </div>
  	</div>
</div>
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
	});
</script>