<?php
	$objeto='el <strong>rol</strong>';
	switch($accion_transaccion) {
		case 1: 
			$accion_transaccion="guarda";
			break;
		case 2: 
			$accion_transaccion="actualiza";
			break;
		case 3: 
			$accion_transaccion="elimina";
			break;
	}
	if($estado_transaccion==1) {
		$class='success';
		$mensaje='<span class="glyphicon glyphicon-info-sign"></span> '.ucfirst($objeto).' se ha <strong>'.$accion_transaccion.'do</strong> éxitosamente! Si deseas agregar un rol a un usuario presiona <a href="'.base_url().'index.php/usuarios/usuario" class="alert-link">aquí</a>.';
	}
	else {
		$class='danger';
		$mensaje='<span class="glyphicon glyphicon-exclamation-sign"></span> Error al intentar <strong>'.$accion_transaccion.'r</strong> '.$objeto.': Se perdió la señal de la red. Porfavor vuelva a intentarlo.';
	}
	if($estado_transaccion!="" && $estado_transaccion!=NULL) {	
?>
        <div class="alert alert-<?php echo $class?>">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <?php echo $mensaje?>
        </div>
<?php } ?>
<div class="col-sm-6">
    <div class="panel panel-danger">
        <div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="7" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Datos del rol</h3>
        </div>
        <div class="panel-body panel-body-nopadding">
        	<form name="formu" id="formu" class="form-horizontal" method="post" action="<?php echo base_url()?>index.php/usuarios/guardar_rol" autocomplete="off">
				<div id="progressWizard" class="basic-wizard">
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
                                    <input type="text" data-req="true" id="nombre_rol" name="nombre_rol" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="descripcion_rol" class="col-sm-3 control-label">Descripción <span class="asterisk">*</span></label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" data-req="true" id="descripcion_rol" name="descripcion_rol"></textarea>
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
                        <li><button class="btn btn-success" type="submit" name="aprobar" id="aprobar"><span class="glyphicon glyphicon-floppy-save"></span> Guardar</button></li>
                        <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
                    </ul>
                </div><!-- #basicWizard -->
            </form>
        </div>
   	</div>
</div>
<div class="col-sm-6">
    <div class="panel panel-danger">
        <div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="7" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Roles registrados</h3>
        </div>
        <div class="panel-body">
			<table class="table">
                <thead>
                  <tr>
                    <th class="all" >Nombre del Rol</th>
                    <th class="none" >Descripción de Rol</th>
                    <th class="desktop tablet-l tablet-p" style="width:100px">Opción</th>
                  </tr>
                 </thead>
                 <tbody>
                <?php
                    foreach ($roles as $val) {
                ?>
                  <tr>
                    <td><?php echo ucwords($val['nombre_rol'])?></td>
                    <td><?php echo $val['descripcion_rol']?></td>
                    <td>
                        <a href="" class="modificar_rol" onClick="editar(<?php echo $val['id_rol']?>);return false;" title="Modificar Rol" data-toggle="modal" data-target=".bs-example-modal-static2" data-id_rol="<?php echo $val['id_rol']?>" data-nombre_rol="<?php echo ucwords($val['nombre_rol'])?>"><img src="<?php echo base_url()?>img/rol_editar.png"/></a>
                        <a href="" class="eliminar_rol" onClick="eliminar(<?php echo $val['id_rol']?>);return false;" title="Eliminar Rol" data-id_rol="<?php echo $val['id_rol']?>" data-nombre_rol="<?php echo ucwords($val['nombre_rol'])?>"><img src="<?php echo base_url()?>img/rol_borrar.png"/></a>
                    </td>
                  </tr>
                <?php } ?>
                </tbody>
                </table>
        </div>
    </div><!-- panel -->
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
		$("#limpiar").click(function(){
			$("#formu").load(base_url()+"index.php/usuarios/datos_de_rol");
		});
	});
	function editar(id){
		$("#formu").load(base_url()+'index.php/usuarios/datos_de_rol/'+id);
		return false;
	}
	function eliminar(id){
		var titulo="Alerta";
		var mensaje="Realmente desea eliminar este registro? No podrá revertir los cambios.";
		var url=base_url()+"index.php/usuarios/eliminar_rol/"+id;
		confirmacion(titulo, mensaje, url);
		return false;
	}
</script>