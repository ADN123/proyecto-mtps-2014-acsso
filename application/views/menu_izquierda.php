<div class="leftpanel sticky-leftpanel">
    
    <div class="logopanel">
        <h1><span>[</span> PRINCIPAL <span>]</span></h1>
    </div><!-- logopanel -->
        
    <div class="leftpanelinner">    
        
        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="<?php echo base_url();?>images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4 style="text-transform: capitalize;"><?php echo strtolower($this->session->userdata('nombre')); ?></h4>
                    <span>"Life is so..."</span>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">Cuenta</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="<?php echo base_url();?>index.php/usuarios/mi_perfil"><i class="fa fa-user"></i> <span>Mi perfil</span></a></li>
              <!--<li><a href="#"><i class="fa fa-cog"></i> <span>Configuraciones</span></a></li>-->
              <li><a href="#"><i class="fa fa-question-circle"></i> <span>Ayuda</span></a></li>
              <li><a href="<?php echo base_url();?>index.php/sessiones/cerrar_session"><i class="fa fa-sign-out"></i> <span>Cerrar sesi&oacute;n</span></a></li>
            </ul>
        </div>
      
      <h5 class="sidebartitle">Navegaci&oacute;n</h5>
      <ul class="nav nav-pills nav-stacked nav-bracket">
      	<?php
			foreach($menus as $m){
				if($m[id_padre]=="") {
					$class='';
					$href=base_url().'index.php/'.$m[url_modulo];
					$imag=$m[img_modulo];
					$titu='<span>'.$m[nombre_modulo].'</span>';
					$desc=$m[descripcion_modulo];
					$child='';
					$band=false;
					foreach($menus as $sm){
						$class2='';
						if($sm[dependencia]==$m[id_modulo]) {
							if($menu_actual['id_modulo']==$sm[id_modulo]) {
								$band=true;
								$class2='class="active"';
							}
							$class='nav-parent';
							$href='#';
							$child.='<li '.$class2.'><a href="'.base_url().'index.php/'.$sm[url_modulo].'"><i class="'.$sm[img_modulo].'"></i> '.$sm[nombre_modulo].'</a></li>';
						}
					}
					if($menu_actual['id_modulo']==$m[id_modulo] || $band)
						$class=$class.' active';
					if($class!='') 
						$class='class="'.$class.'"';
					if($child!='') 
						$child='<ul class="children">'.$child.'</ul>';
		?>
					<li <?php echo $class?> title="<?php echo $desc?>"><a href="<?php echo $href?>"><i class="<?php echo $imag?>"></i> <?php echo $titu?></a><?php echo $child?></li>
        <?php
							
				}
			}
		?>
      </ul>
      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->