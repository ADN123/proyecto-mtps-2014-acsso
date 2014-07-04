<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">
    
    <title>SACSO - Sistema de Acreditaciones de Comités de Seguridad Ocupacional</title>
    
    <link href="<?php echo base_url();?>css/style.default.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/jquery.datatables.css" rel="stylesheet">
      
    <script src="<?php echo base_url();?>js/jquery-1.10.2.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery-ui-1.10.3.min.js"></script>
    <script src="<?php echo base_url();?>js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>js/modernizr.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery.sparkline.min.js"></script>
    <script src="<?php echo base_url();?>js/toggles.min.js"></script>
    <script src="<?php echo base_url();?>js/retina.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery.cookies.js"></script>
    
    <script src="<?php echo base_url();?>js/flot/flot.min.js"></script>
    <script src="<?php echo base_url();?>js/flot/flot.resize.min.js"></script>
    <script src="<?php echo base_url();?>js/morris.min.js"></script>
    <script src="<?php echo base_url();?>js/raphael-2.1.0.min.js"></script>
    
    <script src="<?php echo base_url();?>js/jquery.datatables.min.js"></script>
    <script src="<?php echo base_url();?>js/chosen.jquery.min.js"></script>
    
    <script src="<?php echo base_url();?>js/custom.js"></script>
    <!--<script src="<?php echo base_url();?>js/dashboard.js"></script>-->
    <script src="<?php echo base_url();?>js/funciones.js"></script>
    <script type="text/javascript">
		function base_url() {
			return "<?php echo base_url()?>";
		}
	</script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
	<style>
		/*scrollbar*/
		::-webkit-scrollbar {  
			width: 7px; 
		}  
		::-webkit-scrollbar-track {  
			background-color: #eaeaea;  
			border-left: 1px solid #ccc;  
		}  
		::-webkit-scrollbar-thumb {  
			background-color: #ccc;  
		}  
		::-webkit-scrollbar-thumb:hover {  
			background-color: #aaa;  
		}
		/*fin scrollbar*/
	</style>
</head>

<body class="stickyheader leftpanel-collapsed">
    
<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>