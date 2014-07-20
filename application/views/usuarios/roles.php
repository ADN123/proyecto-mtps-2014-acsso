<script>
	estado_transaccion='<?php echo $estado_transaccion?>';
	<?php if($accion!="") {?>
		estado_correcto='El rol se ha <?php echo $accion?>do exitosamente.';
		estado_incorrecto='Error al intentar <?php echo $accion?>r el rol: No se pudo conectar al servidor. Porfavor vuelva a intentarlo.';
	<?php }?>
</script>
<div class="col-sm-12">
    <div class="panel panel-danger">
        <div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="7" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Tabla de Roles</h3>
        </div>
        <div class="panel-body">
            <button type="button" id="nuevo_rol" data-toggle="modal" data-target=".bs-example-modal-static2" class="btn btn-primary">Nuevo Rol</button>
            <br /><br />
            <div class="table-responsive">
                <table class="table">
                <colgroup>
                    <col />
                    <col />
                    <col style="width:100px"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>Nombre del Rol</th>
                    <th>Descripción de Rol</th>
                    <th>Opción</th>
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
                        <a href="" class="modificar_rol" title="Modificar Rol" data-toggle="modal" data-target=".bs-example-modal-static2" data-id_rol="<?php echo $val['id_rol']?>" data-nombre_rol="<?php echo ucwords($val['nombre_rol'])?>"><img src="<?php echo base_url()?>img/rol_editar.png"/></a>
                        <a href="" class="eliminar_rol" title="Eliminar Rol" data-id_rol="<?php echo $val['id_rol']?>" data-nombre_rol="<?php echo ucwords($val['nombre_rol'])?>"><img src="<?php echo base_url()?>img/rol_borrar.png"/></a>
                    </td>
                  </tr>
                <?php } ?>
                </tbody>
                </table>
            </div>
        </div>
    </div><!-- panel -->
</div>
<script language="javascript" >
	$(document).ready(function(){
		$("#nuevo_rol").click(function(){
			$("#titulo-ventana").html("Nuevo Rol");
			$('#contenido-ventana').load(base_url()+'index.php/usuarios/datos_de_rol');
		});
		$(".modificar_rol").click(function(){
			id=$(this).data("id_rol");
			nom=$(this).data("nombre_rol");
			$("#titulo-ventana").html("Modificar Rol - "+nom);
			$('#contenido-ventana').load(base_url()+'index.php/usuarios/datos_de_rol/'+id);
		});
		$(".eliminar_rol").click(function(){
			id=$(this).data("id_rol");
			nom=$(this).data("nombre_rol");
			alertify.confirm("Realmente desea eliminar el rol '<i>"+nom+"</i>'? Este cambio no lo podrá revertir.", function (e) {
				if (e) {
					$('#contenido-ventana').load(base_url()+'index.php/usuarios/eliminar_rol/'+id);
				} else {
					return false;
				}
			});
		});
	});
</script>