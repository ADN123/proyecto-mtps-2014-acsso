<script src="<?php echo base_url()?>js/views/login.js" type="text/javascript"></script>
<div class="signinpanel">
        
	<div class="row">
    
     	<div class="col-md-2"></div>
        
     	<div class="col-md-6">
        	<form method="post" name="form1" id="form1" action="<?php echo base_url();?>index.php/sessiones/iniciar_session">
            	<h4 class="nomargin">INICIO DE SESI&Oacute;N</h4>
                <p class="mt5 mb20"></p>
                <input type="hidden" name="ir" />
                <input type="text" class="form-control uname" placeholder="Usuario" name="user" id="user"/>
                <input type="password" class="form-control pword" placeholder="Contraseña" name="pass" id="pass"/>
                <a href="#" id="cambiar-pass"><small>Olvidaste tu contraseña?</small></a>
                <button class="btn btn-success btn-block boton_validador" id="entrar" name="entrar">Ingresar</button>                
        	</form>
    	</div>
        
     	<div class="col-md-2"></div>
        
    </div>
    
    <div class="signup-footer">
    
        <div class="pull-left">
			<img class="ues" src="<?php echo base_url();?>img/ues.min.png" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img class="escudo" src="<?php echo base_url();?>img/escudo.png" />
        </div>
        
        <div class="pull-right">
            Ministerio de Trabajo y Previsión Social - República de El Salvador C.A.<br/>
            Alameda Juan Pablo II y 17 Ave. Norte Edificios 2,3 y 4, Centro de Gobierno, San Salvador, C.A.<br/>
            PBX:(503)2259-3700, FAX:(503)2259-3756. asesorialaboral@mtps.gob.sv, Asesoría Laboral (503)2259-3838<br/>
            &copy; Todos los derechos reservados UES-FMP 2014
        </div>
        
    </div>
    
</div>
<script language="javascript" >
    $(document).ready(function(){   
        $("#cambiar-pass").click(function(){
            modal("Cambiar Contraseña",base_url()+'index.php/sessiones/cambiar_pass');
            return false;
        });
     });
</script>