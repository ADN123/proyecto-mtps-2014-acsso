<?php
	$url="http://localhost/sacso/";
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>SACSO - Sistema de Registro de Comités de SSO</title>

  <link href="<?php echo $url?>css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="notfound">

<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>
  
  <div class="notfoundpanel">
    <h1>404!</h1>
    <h3>La página que estás buscando no se ha encontrado!</h3>
    <h4>La página que está buscando se haya quitado, haya cambiado de nombre o no está disponible. <br />Tal vez usted podría intentar una búsqueda:</h4>
    <form action="<?php echo $url."index.php/usuarios/buscar"?>" method="post"  autocomplete="off">
        <input type="text" name="buscar" class="form-control" placeholder="Búsqueda de la página" /> <button class="btn btn-success">Buscar</button>
    </form>
  </div><!-- notfoundpanel -->
  
</section>


<script src="<?php echo $url?>js/jquery-1.10.2.min.js"></script>
<script src="<?php echo $url?>js/jquery-migrate-1.2.1.min.js"></script>
<script src="<?php echo $url?>js/bootstrap.min.js"></script>
<script src="<?php echo $url?>js/modernizr.min.js"></script>
<script src="<?php echo $url?>js/retina.min.js"></script>

<script src="<?php echo $url?>js/custom.js"></script>

</body>
</html>