<style>
	small strong, .sender strong {
		color:#F0AD4E !important;
	}
	ul, ul li .sender, .sender strong {
		font-size: 16px !important;
	}
	ul li small, small strong {
		font-size: 14px !important;
	}
</style>
<div class="col-md-3"></div>
<div class="col-md-6">
    <div class="panel panel-info panel-alt widget-messaging">
    	<div class="panel-heading">
      		<div class="panel-btns">
        		<a href="#" class="tooltips ayuda" data-ayuda="8" data-toggle="tooltip" title="" data-original-title="Ayuda"><i class="fa fa-question-circle"></i></a>
        		<a href="#"class="tooltips minimize" data-toggle="tooltip" title="" data-original-title="Minimizar">−</a>
      		</div><!-- panel-btns -->
      		<h3 class="panel-title">Resultados Búsqueda</h3>
    	</div>
    	<div class="panel-body">
        	<ul>
				<li><?php echo count($resultados)." resultado(s) encontrado(s) en la búsqueda de '<strong>".$buscar."</strong>'" ?></li>
      		</ul>
            <ul>
            	<?php
					foreach($resultados as $val) {
				?>
                		<a href="<?php echo base_url()."index.php/".$val['url'] ?>">
                            <li>
                                <small class="pull-left"><span class="glyphicon glyphicon-share"></span></small>
                                <h4 class="sender"><?php echo str_ireplace($buscar,"<strong>".$buscar."</strong>",($val['padre']." - ".$val['nombre'])) ?></h4>
                                <small><?php echo str_ireplace($buscar,"<strong>".$buscar."</strong>",$val['descripcion']) ?></small>
                            </li>
                        </a>
                <?php
					}
				?>
      		</ul>
    	</div><!-- panel-body -->
    </div><!-- panel -->
</div>