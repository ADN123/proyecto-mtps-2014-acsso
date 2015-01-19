        <div class="col-md-12">
            <div class="signup-footer">
            	<div class="col-md-3 logo">
                    <img class="ues" src="<?=base_url();?>img/ues.min.png" />
                    <img class="escudo" src="<?=base_url();?>img/escudo.png" />
              	</div>
            	<div class="col-md-9 dir">
                	Ministerio de Trabajo y Previsión Social - República de El Salvador C.A.<br/>
                    Alameda Juan Pablo II y 17 Ave. Norte Edificios 2,3 y 4, Centro de Gobierno, San Salvador, C.A.<br/>
                    PBX:(503)2259-3700, FAX:(503)2259-3756. asesorialaboral@mtps.gob.sv, Asesoría Laboral (503)2259-3838<br/>
                    &copy; Todos los derechos reservados UES-FMP <?=date('Y')?>
                </div>
            </div>
        </div>
    </div><!-- contentpanel -->
</div><!-- mainpanel -->
<div class="rightpanel" style="background: #f7f7f7;border-left: 1px solid #d3d7db;">
	<!-- Nav tabs -->
    <ul class="nav nav-tabs nav-justified" style="padding-bottom: 3px;border-bottom: 1px solid #d3d7db;">
        <li class="active"><a href="#rp-alluser" data-toggle="tab"><i class="fa fa-file-text"></i></a></li>
        <li><a href="#rp-favorites" data-toggle="tab"><i class="glyphicon glyphicon-flash"></i></a></li>
        <li><a href="#rp-history" data-toggle="tab"><i class="fa fa-exclamation-triangle"></i></a></li>
        <li><a href="#rp-settings" data-toggle="tab"><i class="fa fa-pencil-square-o"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane active" id="rp-alluser">
            <h5 class="sidebartitle sidebartitleAyuda">Descripción de la pantalla</h5>
            <ul class="chatuserlist">
                <li class="online">
                    <div class="media">
                        <div class="media-body">
                            <small style="font-size:12px;font-family: sans-serif;"><?=$ayuda[0]['descripcion_ayuda']?></small>
                        </div>
                    </div><!-- media -->
                </li>
                <!--<li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="<?php echo base_url()?>images/photos/user1.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <span class="pull-right badge badge-danger">2</span>
                            <strong>Zaham Sindilmaca</strong>
                            <small>San Francisco, CA</small>
                        </div>
                    </div>
                </li>-->
            </ul>
            <div class="mb30"></div>
            <h5 class="sidebartitle sidebartitleAyuda">¿Para qué se necesita esta información?</h5>
            <ul class="chatuserlist">
                <li class="online">
                    <div class="media">
                        <div class="media-body">
                            <small style="font-size:12px;font-family: sans-serif;"><?=$ayuda[0]['para_que']?></small>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        
        <div class="tab-pane" id="rp-favorites">
            <h5 class="sidebartitle sidebartitleAyuda">¿Qué opciones podemos realizar aquí?</h5>
            <ul class="chatuserlist">                
                <?php
                    foreach($ayuda as $val) {
                ?>
                    <li class="online">
                        <div class="media">
                            <div class="media-body">
                                <strong><?=$val['titulo_paso']?></strong>
                                <small style="font-size:12px;font-family: sans-serif;"><?=$val['paso']?></small>
                            </div>
                        </div>
                    </li>
                <?php
                    }
                ?>
            </ul>
        </div>
        
        <div class="tab-pane" id="rp-history">
            <h5 class="sidebartitle sidebartitleAyuda">Problemas Frecuentes</h5>
            <ul class="chatuserlist">
                <?php
                    foreach($ayuda2 as $val) {
                ?>
                    <li class="online">
                        <div class="media">
                            <div class="media-body">
                                <strong><?=$val['problema']?></strong>
                                <small style="font-size:12px;font-family: sans-serif;"><?=$val['solucion']?></small>
                            </div>
                        </div>
                    </li>
                <?php
                    }
                ?>
            </ul>
        </div>
        
        <div class="tab-pane pane-settings" id="rp-settings">
            <h5 class="sidebartitle  sidebartitleAyuda">Forma correcta de llenado del formulario</h5>
            <ul class="chatuserlist">
                <li class="online">
                    <div class="media">
                        <div class="media-body">
                            <small style="font-size:12px;font-family: sans-serif;">Los formularios son el medio de interacción que existe entre los sitemas y los usuarios, para que se dé una buena comunicación debemos comprender lo que el sistema nos intenta decir por medio de los mensajes y alertas. A continuación se describen ciertos aspectos que hay que tener en cuenta al momento de llenar un formulario: </small>
                        </div>
                    </div><!-- media -->
                </li>
            </ul>
        </div><!-- tab-pane -->
    </div><!-- tab-content -->
</div><!-- rightpanel -->