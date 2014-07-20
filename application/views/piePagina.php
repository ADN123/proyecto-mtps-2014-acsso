<button id="boton-modal" style="display:none;" data-toggle="modal" data-target="#modal-modal"></button>
<div class="modal fade" id="modal-modal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        	<button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
            <h4 id="titulo-ventana" class="modal-title">&nbsp;</h4>
        </div>
        <div id="contenido-ventana" class="modal-body">&nbsp;</div>
    </div>
  </div>
</div>

<button id="boton-confirmacion" style="display:none;" data-toggle="modal" data-target="#modal-confirmacion"></button>
<div class="modal fade" id="modal-confirmacion" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content  panel-warning">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Mensaje</h4>
      </div>
      <div class="modal-body" id="myModalBody">
      </div>
      <div class="modal-footer">
        <a href="#" id="myModalLink" class="btn btn-primary">Aceptar</a>
        <button type="button" id="myModalCancel" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
        <button type="button" id="myModalAccept" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

</section>
</body>
</html>