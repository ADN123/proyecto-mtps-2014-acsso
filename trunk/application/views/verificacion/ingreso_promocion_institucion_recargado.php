<table class="table table-hover mb30">
    <thead>
        <tr>
            <th class="all">Temática</th>
            <th class="desktop tablet-l tablet-p" style="width:150px">Impartida</th>
        </tr>
    </thead>
    <tbody>
        <?php
            foreach($tematicas as $val) {
                echo '<tr><td>'.$val['nombre'].'</td><td><div class="ckbox ckbox-success"><input type="checkbox" class="chk" name="id_tematica[]" id="id_tematica_'.$val['id'].'" value="'.$val['id'].'" ';
                if($val['delegado']==1) echo ' checked="checked"';
                echo' /><label for="id_tematica_'.$val['id'].'"></label></div></td></tr>';
            }
        ?>
    </tbody>
</table>
<script language="javascript" >
	$(document).ready(function(){
		$('.table').dataTable( {
		  "filter": false,
		  "paginate": false,
		  "destroy": true
		});
	});
</script>