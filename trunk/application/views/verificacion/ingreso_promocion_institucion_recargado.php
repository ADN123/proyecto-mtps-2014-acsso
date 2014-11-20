<table class="table table-hover mb30">
    <thead>
        <tr>
            <th class="all">Temática</th>
            <th class="desktop tablet-l tablet-p" style="width:150px">Impartida</th>
            <th class="desktop tablet-l tablet-p" style="width:200px">Fecha</th>
            <th class="desktop tablet-l tablet-p" style="width:350px">Facilitador</th>
        </tr>
    </thead>
    <tbody>
        <?php
            foreach($tematicas as $val) {
                echo '<tr><td>'.$val['nombre'].'</td><td><div class="ckbox ckbox-success"><input type="checkbox" class="chk" name="id_tematica[]" id="id_tematica_'.$val['id'].'" value="'.$val['id'].'" ';
                if($val['delegado']==1) echo ' checked="checked"';
                echo' /><label for="id_tematica_'.$val['id'].'"></label></div></td>
                    <td>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <input data-req="true" data-tip="fec" type="text" class="form-control fechas" id="fecha_capacitacion_'.$val['id'].'" name="fecha_capacitacion[]" readonly="readonly" disabled="disabled" />
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" data-req="true" class="form-control" name="facilitador[]" id="facilitador_'.$val['id'].'" disabled="disabled" value=" "/>
                            </div>
                        </div>
                    </td>
                </tr>';
            }
        ?>
    </tbody>
</table>
<div class="ckbox ckbox-success"><input type="checkbox" name="sel-todo" id="sel-todo"  /><label for="sel-todo">Seleccionar/Deseleccionar todo</label></div> 
<script language="javascript" >
	$(document).ready(function(){
		$('.table').dataTable( {
          "filter": false,
          "paginate": false,
          "destroy": true,
          responsive: true,
          sort: false,
          info: false
        });
        $('#sel-todo').click(function(){
            $('.chk').prop('checked', $(this).prop('checked'));
        });
        $('.fechas').datepicker({beforeShowDay: $.datepicker.noWeekends, maxDate: '0D'});
	});
</script>