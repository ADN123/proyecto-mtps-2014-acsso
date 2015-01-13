<div class="mainpanel">
    
    <div class="headerbar">
      
      <a class="menutoggle"><i class="fa fa-bars"></i></a>
      
      <form class="searchform" action="<?php echo base_url()."index.php/usuarios/buscar"?>" method="post">
        <input type="text" class="form-control" name="buscar" placeholder="Buscar..." autocomplete="off" value="<?php echo $buscar ?>"/>
      </form>
      
      <div class="header-right">
        <ul class="headermenu">
          <li style="display:none;">
            <div class="btn-group">
              <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                <i class="glyphicon glyphicon-user"></i>
                <span class="badge">2</span>
              </button>
              <div class="dropdown-menu dropdown-menu-head pull-right">
                <h5 class="title">2 Newly Registered Users</h5>
                <ul class="dropdown-list user-list">
                  <li class="new">
                    <div class="thumb"><a href="#"><img src="<?php echo base_url();?>images/photos/user1.png" alt="" /></a></div>
                    <div class="desc">
                      <h5><a href="#">Draniem Daamul (@draniem)</a> <span class="badge badge-success">new</span></h5>
                    </div>
                  </li>
                  <li class="new">
                    <div class="thumb"><a href="#"><img src="<?php echo base_url();?>images/photos/user2.png" alt="" /></a></div>
                    <div class="desc">
                      <h5><a href="#">Zaham Sindilmaca (@zaham)</a> <span class="badge badge-success">new</span></h5>
                    </div>
                  </li>
                  <li>
                    <div class="thumb"><a href="#"><img src="<?php echo base_url();?>images/photos/user3.png" alt="" /></a></div>
                    <div class="desc">
                      <h5><a href="#">Weno Carasbong (@wenocar)</a></h5>
                    </div>
                  </li>
                  <li>
                    <div class="thumb"><a href="#"><img src="<?php echo base_url();?>images/photos/user4.png" alt="" /></a></div>
                    <div class="desc">
                      <h5><a href="#">Nusja Nawancali (@nusja)</a></h5>
                    </div>
                  </li>
                  <li>
                    <div class="thumb"><a href="#"><img src="<?php echo base_url();?>images/photos/user5.png" alt="" /></a></div>
                    <div class="desc">
                      <h5><a href="#">Lane Kitmari (@lane_kitmare)</a></h5>
                    </div>
                  </li>
                  <li class="new"><a href="#">See All Users</a></li>
                </ul>
              </div>
            </div>
          </li>
          <li>
            <div class="btn-group">
              <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                <i class="glyphicon glyphicon-envelope"></i>
                <span class="badge"><?=($actividades['total_asignaciones']!=0)?$actividades['total_asignaciones']:''?></span>
              </button>
              <div class="dropdown-menu dropdown-menu-head pull-right">
                <h5 class="title">Tienes <?=$actividades['total_asignaciones']?> actividad(es) nueva(s) asignada(s)</h5>
                <ul class="dropdown-list gen-list">
                  <?php if($actividades['total_asignaciones_promocion']!=0){ ?>
                  <li class="new">
                    <a href="<?php echo base_url();?>index.php/promocion/programa">
                    <span class="thumb"><i class="fa fa-building-o" style="font-size: 32px;"></i></span>
                    <span class="desc">
                      <span class="name">Visita de promoción <span class="badge badge-success">ver</span></span>
                      <span class="msg"><?=$actividades['total_asignaciones_promocion']?> actividad(es) sin programar fecha</span>
                    </span>
                    </a>
                  </li>
                  <?php } ?>
                  <?php if($actividades['total_asignaciones_verificacion']!=0){ ?>
                  <li>
                    <a href="<?php echo base_url();?>index.php/verificacion/programa">
                    <span class="thumb"><i class="fa fa-th-list" style="font-size: 32px;"></i></span>
                    <span class="desc">
                      <span class="name">Visita de verificación <span class="badge badge-success">ver</span></span>
                      <span class="msg"><?=$actividades['total_asignaciones_verificacion']?> actividad(es) sin programar fecha</span>
                    </span>
                    </a>
                  </li>
                  <?php } ?>
                  <?php if($actividades['total_asignaciones']==0){ ?>
                  <li class="new"><a href="javascript:;">Sin actividades nuevas</a></li>
                  <?php } ?>
                </ul>
              </div>
            </div>
          </li>
          <li>
            <div class="btn-group">
              <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                <i class="glyphicon glyphicon-globe"></i>
                <span class="badge"><?=($actividades['total_programaciones']!=0)?$actividades['total_programaciones']:''?></span>
              </button>
              <div class="dropdown-menu dropdown-menu-head pull-right">
                <h5 class="title">Tienes <?=$actividades['total_programaciones']?> actividad(es) para los próximos días</h5>
                <ul class="dropdown-list gen-list">
                  <?php if($actividades['total_programaciones_promocion']!=0){ ?>
                  <li class="new">
                    <a href="<?php echo base_url();?>index.php/promocion/ver_asignaciones">
                    <span class="thumb"><i class="fa fa-building-o" style="font-size: 32px;"></i></span>
                    <span class="desc">
                      <span class="name">Visita de promoción<span class="badge badge-success">ver</span></span>
                      <span class="msg"><?=$actividades['total_programaciones_promocion']?> Actividad(es)</span>
                    </span>
                    </a>
                  </li>
                  <?php } ?>
                  <?php if($actividades['total_programaciones_capacitacion']!=0){ ?>
                  <li class="new">
                    <a href="<?php echo base_url();?>index.php/acreditacion/asistencia">
                    <span class="thumb"><i class="fa fa-group" style="font-size: 32px;"></i></span>
                    <span class="desc">
                      <span class="name">Impartir capacitación <span class="badge badge-success">ver</span></span>
                      <span class="msg"><?=$actividades['total_programaciones_capacitacion']?> Actividad(es)</span>
                    </span>
                    </a>
                  </li>
                  <?php } ?>
                  <?php if($actividades['total_programaciones_verificacion']!=0){ ?>
                  <li class="new">
                    <a href="<?php echo base_url();?>index.php/verificacion/ver_asignaciones">
                    <span class="thumb"><i class="fa fa-th-list" style="font-size: 32px;"></i></span>
                    <span class="desc">
                      <span class="name">Visita de verificación <span class="badge badge-success">ver</span></span>
                      <span class="msg"><?=$actividades['total_programaciones_verificacion']?> Actividad(es)</span>
                    </span>
                    </a>
                  </li>
                  <?php } ?>
                  <?php if($actividades['total_programaciones']==0){ ?>
                  <li class="new"><a href="javascript:;">Sin actividades para los próximos días</a></li>
                  <?php } ?>
                </ul>
              </div>
            </div>
          </li>
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="text-transform: capitalize;">
                <img src="<?php echo base_url();?>images/photos/loggeduser.png" alt="" />
                <?php echo strtolower($this->session->userdata('nombre')); ?>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="<?php echo base_url();?>index.php/usuarios/mi_perfil"><i class="glyphicon glyphicon-user"></i> Mi perfil</a></li>
                <!--<li><a href="#"><i class="glyphicon glyphicon-cog"></i> Configuraciones</a></li>-->
                <li><a href="#"><i class="glyphicon glyphicon-book"></i> Manual de Usuario</a></li>
                <li><a href="<?php echo base_url();?>index.php/sessiones/cerrar_session"><i class="glyphicon glyphicon-log-out"></i> Cerrar sesi&oacute;n</a></li>
              </ul>
            </div>
          </li>
          <li>
            <button id="chatview" class="btn btn-default tp-icon chat-icon">
                <i class="glyphicon glyphicon-question-sign"></i>
            </button>
          </li>
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
    
    <div class="pageheader">
      <h2><i class="<?php if($menu_actual['img_modulo_padre']!="") echo $menu_actual['img_modulo_padre']; else echo $menu_actual['img_modulo'] ?>"></i> <?php echo $menu_actual['nombre_modulo'] ?> <span><?php echo $menu_actual['descripcion_modulo'] ?></span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">Tu estás aquí:</span>
        <ol class="breadcrumb">
          <?php
          	if($menu_actual['nombre_modulo_padre']!="") {
				$url_padre=explode("/",$menu_actual['url_modulo_padre']);
          ?>
				<li><a href="<?php echo base_url().'index.php/'.$url_padre[0] ?>"><?php echo $menu_actual['nombre_modulo_padre'] ?></a></li>
          <?php
		   	}
          ?>	
          <li class="active"><?php echo $menu_actual['nombre_modulo'] ?></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">