var fecha_actual;
$(document).ready(function(){
	$('.table').dataTable({
		"sPaginationType": "full_numbers"
	});
	
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap'
	});
	
	$("#formu").validate({
		highlight: function(element) {
			$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
		},
		success: function(element) {
			$(element).closest('.form-group').removeClass('has-error');
		}
	});
	
	$(".ayuda").click(function(){
		var id=Number($(this).data("ayuda"));
		var mensaje="";
		switch(id) {
			case 1:
				mensaje='Formulario de ingreso de instituciones';
				break;
			case 2:
				mensaje='Lista de instituciones';
				break;
			case 3:
				mensaje='Formulario de ingreso de lugares de trabajo';
				break;
			case 4:
				mensaje='Lista de lugares de trabajo';
				break;
			case 5:
				mensaje='Formulario de asignaciones';
				break;
			case 6:
				mensaje='Calendarización mensual de asignaciones de un técnico';
				break;
			case 7:
				mensaje='Lista de roles de usuarios';
				break;
			case 8:
				mensaje='';
				break;
			case 9:
				mensaje='Calendarización diaria de asignaciones de un técnico';
				break;
			case 10:
				mensaje='Formulario de ingreso de promocion de una institución';
				break;
		}
		alerta("Ayuda", mensaje);
		return false;
	});
});
function confirmacion(titulo, mensaje, url, ajax, tipo)
{
	$("#myModalLabel").html(titulo);
	$("#myModalBody").html(mensaje);
	if(ajax==true) {
		if(tipo=="html")
			$("#myModalLink").attr("onClick","$('#modal-confirmacion .close').click();ajax_html('"+url+"');return false;");
		else
			$("#myModalLink").attr("onClick","$('#modal-confirmacion .close').click();ajax_json('"+url+"');return false;");
	}
	else
		$("#myModalLink").attr("href",url);
	
	$("#myModalLink,#myModalCancel").removeAttr("style");
	$("#myModalAccept").attr("style","display:none");
	
	$('#boton-confirmacion').click();
}
function alerta(titulo, mensaje)
{
	$("#myModalLabel").html(titulo);
	$("#myModalBody").html(mensaje);
	
	$("#myModalLink,#myModalCancel").attr("style","display:none");
	$("#myModalAccept").removeAttr("style");
	
	$('#boton-confirmacion').click();
}
function alerta_rapida(titulo, mensaje, tipo)
{
	$.gritter.add({
		title: titulo,
		text: mensaje,
      	class_name: 'growl-'+tipo,
		sticky: false,
		time: ''
	 });
}
function modal(titulo, url)
{
	$("#titulo-ventana").html(titulo);
	$('#contenido-ventana').load(url);
	$("#boton-modal").click();
}
function ajax_json(url, mensaje_correcto, mensaje_incorrecto, data) {
	if(typeof(mensaje_correcto) == "undefined") {
		var men_cor="La petición se ha completado éxitosamente!*** ";
	}
	else {
		var men_cor=""+mensaje_correcto+"";
	}
	if(typeof(mensaje_incorrecto) == "undefined") {
		var men_inc="Error en la peticitión solicitada!***Se ha perdido la conexión a la red'";
	}
	else {
		var men_inc=""+mensaje_incorrecto+"";
	}
	var bueno_titu = men_cor.split("***")[0];
	var bueno_men = men_cor.split("***")[1];
	var malo_titu = men_inc.split("***")[0];
	var malo_men = men_inc.split("***")[1];
	$.ajax({
		async:	true, 
		url:	url,
		dataType:"json",
		type: "POST",
		data: data,
		success: function(data) {
			var json=data;
			if(Number(json['resultado'])==1) {
				alerta_rapida(bueno_titu, bueno_men, 'success');
				if($("#calendar_dia").length!=0) {
					$('#cont-calendario').load(base_url()+'index.php/promocion/calendario/'+$("#id_empleado").val());
					$('#cont-institucion').load(base_url()+'index.php/promocion/institucion_visita/'+$("#id_empleado").val());
					modal("Programación del día",base_url()+'index.php/promocion/calendario_dia/'+$("#id_empleado").val()+'/'+fecha_actual);
				}
			}
			else {
				alerta_rapida(malo_titu,malo_men, 'danger');
			}
		},
		error:function(data) {
			alerta_rapida(malo_titu, 'Se ha perdido la conexión a la red', 'danger');
		}
	});			
	return false;
}

function ajax_html(url, objeto, mensaje_incorrecto, data) {
	if(typeof(mensaje_incorrecto) == "undefined") {
		var men_inc="Error en la peticitión solicitada!***Se ha perdido la conexión a la red'";
	}
	else {
		var men_inc=""+mensaje_incorrecto+"";
	}
	var malo_titu = men_inc.split("***")[0];
	var malo_men = men_inc.split("***")[1];
	$.ajax({
		async:	true, 
		url:	url,
		dataType:"html",
		type: "POST",
		data: data,
		success: function(data) {
			var json=data;
			objeto.html(json);
		},
		error:function(data) {
			alerta_rapida(malo_titu, 'Se ha perdido la conexión a la red', 'danger');
		}
	});			
	return false;
}