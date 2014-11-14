<style>
    .ckbox input[type="checkbox"]:checked + label::after {
        top: 3px;
    }
    .ckbox #sel-todo:checked + label::after {
        top: 0px;
    }
</style>
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
                <?php
                    foreach($empleado_lugar_trabajo as $val) {
                        echo '<tr><td>'.$val['nombre_empleado'].'</td><td><div class="ckbox ckbox-success"><input type="checkbox" class="chk" name="id_empleado_institucion[]" id="id_empleado_institucion'.$val['id_empleado_institucion'].'" value="'.$val['id_empleado_institucion'].'" /><label for="id_empleado_institucion'.$val['id_empleado_institucion'].'"></label></div></td>';
                    }
                ?>
            </tbody>
        </table>
        <div class="ckbox ckbox-success"><input type="checkbox" name="sel-todo" id="sel-todo"  /><label for="sel-todo">Seleccionar/Deseleccionar todo</label></div> 
    </div>
</div>               
<ul class="pager wizard">
    <li><button class="btn btn-info" type="submit" name="guardar" id="guardar"><span class="glyphicon glyphicon-print"></span> Imprimir</button></li>
    <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
</ul>
<input type="hidden" name="id_lugar_trabajo" id="id_lugar_trabajo" value="<?=$id_lugar_trabajo?>" />
<input type="hidden" name="tabla" id="tabla" />
<script language="javascript" >
    $(document).ready(function(){
        var table = $('.emp').dataTable();
        $("#formu").submit(function(){
            var data = table.$('input, select').serialize();
            $('#tabla').val(data);
        });
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
</script>