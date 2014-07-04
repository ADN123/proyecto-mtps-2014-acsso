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
              <li><a href="profile.html"><i class="fa fa-user"></i> <span>Profile</span></a></li>
              <li><a href="#"><i class="fa fa-cog"></i> <span>Account Settings</span></a></li>
              <li><a href="#"><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
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
					foreach($menus as $sm){
						if($sm[dependencia]==$m[id_modulo]) {
							$class='nav-parent';
							$href='#';
							$child.='<li><a href="'.base_url().'index.php/'.$sm[url_modulo].'"><i class="'.$sm[img_modulo].'"></i> '.$sm[nombre_modulo].'</a></li>';
						}
					}
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
      
      <div class="infosummary">
        <h5 class="sidebartitle">RESUMEN DE LA INFORMACIÓN</h5>    
        <ul>
            <li>
                <div class="datainfo">
                    <span class="text-muted">Daily Traffic</span>
                    <h4>630, 201</h4>
                </div>
                <div id="sidebar-chart" class="chart"></div>   
            </li>
            <li>
                <div class="datainfo">
                    <span class="text-muted">Average Users</span>
                    <h4>1, 332, 801</h4>
                </div>
                <div id="sidebar-chart2" class="chart"></div>   
            </li>
            <li>
                <div class="datainfo">
                    <span class="text-muted">Disk Usage</span>
                    <h4>82.2%</h4>
                </div>
                <div id="sidebar-chart3" class="chart"></div>   
            </li>
            <li>
                <div class="datainfo">
                    <span class="text-muted">CPU Usage</span>
                    <h4>140.05 - 32</h4>
                </div>
                <div id="sidebar-chart4" class="chart"></div>   
            </li>
        </ul>
      </div><!-- infosummary -->
      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->