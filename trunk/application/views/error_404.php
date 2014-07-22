<div class="notfoundpanel">
    <h1>404!</h1>
    <h3>La página que estás buscando no se ha encontrado!</h3>
    <h4>La página que está buscando se haya quitado, haya cambiado de nombre o no está disponible. <br />Tal vez usted podría intentar una búsqueda:</h4>
    <form action="<?php echo base_url()."index.php/usuarios/buscar"?>" method="post"  autocomplete="off">
		<input type="text" class="form-control" placeholder="Búsqueda de la página" /> 
        <button class="btn btn-success">Buscar</button>
    </form>
</div>
<script>
	$('body').addClass("notfound");
</script>

