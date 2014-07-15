$(document).ready(function(){
	$('.table').dataTable({
		"sPaginationType": "full_numbers"
	});
	
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap'
	});
});
function confirmacion(titulo, mensaje, url)
{
	$("#myModalLabel").html(titulo);
	$("#myModalBody").html(mensaje);
	$("#myModalLink").attr("href",url);
	$('#boton-confirmacion').click();
}