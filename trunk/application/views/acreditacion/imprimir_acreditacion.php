<div class="col-sm-3">
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
								echo '<tr><td>'.$val['nombre'].'</td><td><a href="'.base_url().'index.php/acreditacion/imprimir_pdf/'.$val['id'].'" target="_blank" class="edit-row" data-id="'.$val['id'].'"><i class="fa fa-cloud-download"></i></a></td></tr>';
							}
						?>
            		</tbody>
          		</table>
        </div>
  	</div>
</div>