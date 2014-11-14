<div class="col-sm-6">
    <div class="panel panel-primary">
        <div class="panel-heading">
        <div class="panel-btns">
            <a href="#" class="tooltips ayuda" data-ayuda="13" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
            <a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
            <h3 class="panel-title">Miembros del comité</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" name="formu" id="formu" method="post" target="_blank" action="<?php echo base_url()?>index.php/acreditacion/imprimir_pdf" autocomplete="off">
                <div class="form-group">
                    <div class="col-sm-12"> 
                        <table class="table emp table-hover mb30">
                            <thead>
                                <tr>
                                    <th class="all">Nombre del empleado</th>
                                    <th class="desktop tablet-l tablet-p" style="width:100px">Imprimir</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <div class="ckbox ckbox-success"><input type="checkbox" name="sel-todo" id="sel-todo"  /><label for="sel-todo">Seleccionar/Deseleccionar todo</label></div> 
                    </div>
                </div>               
                <ul class="pager wizard">
                    <li><button class="btn btn-info" type="submit" name="guardar" id="guardar"><span class="glyphicon glyphicon-print"></span> Imprimir</button></li>
                    <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
                </ul>
            </form> 
        </div>
    </div><!-- panel -->
</div>
<div class="col-sm-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="tooltips ayuda" data-ayuda="14" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        	<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title" id="titulo-tabla">Comités aprobados</h3>
        </div>
        <div class="panel-body" id="contenido-tabla">
            <table class="table table-hover mb30">
                <thead>
                    <tr>
                        <th class="all">Lugar de trabajo</th>
                        <th class="desktop tablet-l tablet-p" style="width:100px">Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        foreach($insticion_lugar_trabajo as $val) {
                            echo '<tr><td>'.$val['nombre'].'</td><td><a href="#" onClick="editar('.$val['id'].');return false;" class="edit-row" data-id="'.$val['id'].'"><i class="fa fa-search"></i></a></td></tr>';
                            //echo '<tr><td>'.$val['nombre'].'</td><td><a href="'.base_url().'index.php/acreditacion/imprimir_pdf/'.$val['id'].'" target="_blank" class="edit-row" data-id="'.$val['id'].'"><i class="fa fa-cloud-download"></i></a></td></tr>';
                        }
                    ?>
                </tbody>
            </table>
        </div>
  	</div>
</div>
<script language="javascript" >
    $(document).ready(function(){
        $('.emp').dataTable( {
          "paginate": false,
          "destroy": true,
          responsive: true,
          sort: false,
          info: false
        });
        $('#sel-todo').click(function(){
            $('.chk').prop('checked', $(this).prop('checked'));
        });
        $("#limpiar").click(function(){
            $("#formu").load(base_url()+"index.php/acreditacion/ver_empleados_capacitados");
        });
    });
    function editar(id){
        $("#formu").load(base_url()+"index.php/acreditacion/ver_empleados_capacitados/"+id);
        return false;
    }
</script>