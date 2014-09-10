<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">
    
    <title>SRCS - Sistema de Registro de Comités de Seguridad y Salud Ocupacional Acreditados</title>
    
    <link href="<?php echo base_url();?>css/style.default.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/jquery.datatables.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/dataTables.responsive.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/fullcalendar.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/style.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>css/jquery.gritter.css" rel="stylesheet">
      
    <script src="<?php echo base_url();?>js/jquery-1.10.2.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery-ui-1.10.3.min.js"></script>
    <script src="<?php echo base_url();?>js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>js/modernizr.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery.sparkline.min.js"></script>
    <script src="<?php echo base_url();?>js/toggles.min.js"></script>
    <script src="<?php echo base_url();?>js/retina.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery.cookies.js"></script>
    
	<script src="<?php echo base_url();?>js/fullcalendar.min.js"></script>
    <script src="<?php echo base_url();?>js/jquery.ui.touch-punch.min.js"></script>
    <script src="<?php echo base_url();?>js/bootstrap-timepicker.min.js"></script>
    
    <script src="<?php echo base_url();?>js/flot/flot.min.js"></script>
    <script src="<?php echo base_url();?>js/flot/flot.resize.min.js"></script>
    
    <script src="<?php echo base_url();?>js/flot/flot.symbol.min.js"></script>
	<script src="<?php echo base_url();?>js/flot/flot.crosshair.min.js"></script>
    <script src="<?php echo base_url();?>js/flot/flot.categories.min.js"></script>
    <script src="<?php echo base_url();?>js/flot/flot.pie.min.js"></script>
    <script src="<?php echo base_url();?>js/morris.min.js"></script>
    <script src="<?php echo base_url();?>js/raphael-2.1.0.min.js"></script>
    
    <script src="<?php echo base_url();?>js/jquery.datatables.min.js"></script>
    <script src="<?php echo base_url();?>js/dataTables.responsive.min.js"></script>
    <script src="<?php echo base_url();?>js/chosen.jquery.min.js"></script>
    
    <script src="<?php echo base_url();?>js/jquery.gritter.min.js"></script>
    
    <script src="<?php echo base_url();?>js/custom.js"></script>
    
    <script src="<?php echo base_url();?>js/jstree.min.js"></script>
    <!--<script src="<?php echo base_url();?>js/dashboard.js"></script>-->
    <script src="<?php echo base_url();?>js/jquery.validate.min.js"></script>
    <script src="<?php echo base_url();?>js/funciones.js"></script>
    <script src="<?php echo base_url();?>js/bootstrap-wizard.min.js"></script>
    <script type="text/javascript">
		function base_url() {
			return "<?php echo base_url()?>";
		}
	</script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<?php echo base_url();?>js/html5shiv.js"></script>
    <script src="<?php echo base_url();?>js/respond.min.js"></script>
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
		/*textarea*/
		textarea {
			resize: none !important;
		}
		/*fin textarea*/
		.leftpanel-collapsed .nav-bracket li a {
			padding: 12.5px;
		}
		body {
			background: #e4e7ea;
		}
		.sticky-leftpanel {
			background: #1d2939;
		}
		.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
		 	cursor: default !important; 
		 	background-color: inherit !important; 
		 	opacity: 1; 
		}
		.table {
			background: #fcfcfc;
			-moz-box-shadow: 0 3px 0 rgba(12,12,12,0.1);
			-webkit-box-shadow: 0 3px 0 rgba(12,12,12,0.1);
			box-shadow: 0 3px 0 rgba(12,12,12,0.1);
		}
		.dataTables_filter input {
			padding: 5px;
		}
		.dataTables_length .chosen-container {
			max-width: 100px !important;
		}
		.dataTables_length label {
			min-width: 130px;
		}
		.table thead > tr > th, .table tbody > tr > th, .table tfoot > tr > th, .table thead > tr > td, .table tbody > tr > td, .table tfoot > tr > td {
			border-color: #ccc;
		}
		.fc-widget-content {
			border: 1px solid #ccc;
		}
		.fc-event {
			cursor: pointer;
		}
		#calendar_dia .fc-agenda-slots td div {
			height: 45px;
		}
		#calendar_dia .fc-event-vert .ui-resizable-s {
			top: 3px;
			right: 5px;
			left: initial;
			width: 45px !important;
			height: 14px !important;
			z-index: 1000;
			cursor: default;
		}
		#calendar_dia a {
			color: #FFF;
			text-decoration: none;
		}
		#calendar_dia a.fc-event, #calendar_dia .fc-event-draggable {
			cursor: default; 
		}
		#calendar_dia .visitados {
			background-color: #5cb85c !important;
			border: 1px solid #5cb85c !important;
		}
		#calendar_dia .visita_2 {
			background-color: #F0AD4E !important;
			border: 1px solid #F0AD4E !important;
		}
		.has-error .chosen-single, .has-error .chosen-choices {
			border-color: #a94442;
			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		}
		.table {
			width: 100% !important;
		}
		.dataTables_paginate a {
			color: #428bca;
			text-decoration: none;
			background: 0 0;
		}
		.dataTables_paginate .paginate_button {
			float: left;
			cursor: pointer;
			padding: 6px 15px;
			display: inline-block;
			-moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;
			color: #666;
		}
		.dataTables_paginate .enabled {
			color: #fff;
			background: #428BCA;
			border: 1px solid #357EBD;
		}
		.dataTables_paginate .disabled {
			border: 1px solid #ccc;
			background-color: #ddd;
			color: #999;
		}
		.toggle-slide .toggle-blob {
			z-index: 1;
		}
		form .tooltipflot {
			position: absolute;
			bottom: 0;
			margin: 0px auto;
			width: auto;
			z-index: 1;
			text-align: left;
		}
		#multi-s .chosen-container-multi .chosen-choices {
			height: 72px !important;
			overflow-y: auto !important;
		}
		@media screen and (max-width: 640px) {
			.dataTables_length {
				display: none;
			}
			.dataTables_filter {
				  float: none !important;
				  padding: 10px 0 0 0px;
				  margin: auto !important;
				  display: inline-block;
				  text-align: left !important;
			}
		}
	</style>
</head>

<body class="stickyheader leftpanel-collapsed">
    
<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>