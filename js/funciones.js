var fecha_actual;
var band=true;
$(document).ready(function(){
	$('.table').dataTable({
		"sPaginationType": "full_numbers"
	});
	
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap'
	});
	
	$("#formu").submit(function(){
		band=true;
		$('#formu input, #formu select, #formu textarea').each(function(indice, elemento) {
			var val=$(elemento).val();
			var padr=$(elemento).parents('.form-group');
			
			var vreq=$(elemento).data("req");
			var tipo=$(elemento).data("tip");
			var vmin=$(elemento).data("min");
			var vmax=$(elemento).data("max");
			var patt2;
			
			if($(elemento).attr("class")=="form-control") {
				
				$(padr).removeClass('has-error');
				
				if(vreq=="true" || vreq=="TRUE" || vreq=="1") {
					if(val=="") {
						$(padr).addClass('has-error');
						band=false;
					}
				}
				
				if(tipo!="" && tipo!="undefinided" && tipo!=null && val!="") {
					switch(tipo) {
						case 'var': /*letras*/
							patt2=/^([a-z|\' '|ñ|á-ú]*)$/i;
							break;
						case 'int': /*numeros enteros*/
							patt2=/^[0-9]*$/i;
							break;
						case 'flo': /*numeros flotantes*/
							patt2=/^[0-9]*([.]?[0-9]{1,2})?$/i;
							break;
						case 'tel': /*telefono*/
							patt2=/^[2|6|7]{1}[0-9]{3}[0-9]{4}$/i;
							break;
						case 'nit': /*nit*/
							patt2=/^[0-9]{4}-[0-9]{6}-[0-9]{3}-[0-9]{1}$/i;
							break;
						case 'cor': /*correo*/
							patt2=/(^(\w+([\.]\w+)*[\@]{1}\w+([\.]\w+)?[\.]{1}\w{2,3})|^)$/i;
							break;
						case 'fec': /*fecha*/
							patt2=/^([0][1-9]|[12][0-9]|3[01])(\/|-)([0][1-9]|[1][0-2])\2(\d{4})$/i;
							break;
						default: /*caracteres alfanumericos*/
							patt2=/^([0-9|.|,|a-z|\' '|ñ|á-ú]*)$/i;
					}
					if(!patt2.test(val)){
						$(padr).addClass('has-error');
						band=false;
					}
				}
				
				if(vmin!="" && vmin!="undefinided" && vmin!=null && val!="") {
					if(tipo=='int' || tipo=='flo'){
						if(Number(val) < Number(vmin)) {
							$(padr).addClass('has-error');
							band=false;
						}
					}
					else {
						if(Number(val.length) < Number(vmin)) {
							$(padr).addClass('has-error');
							band=false;
						}
						
					}
				}
				
				if(vmax!="" && vmax!="undefinided" && vmax!=null && val!="") {
					if(tipo=='int' || tipo=='flo'){
						if(Number(val) > Number(vmax)) {
							$(padr).addClass('has-error');
							band=false;
						}
					}
					else {
						if(Number(val.length) > Number(vmax)) {
							$(padr).addClass('has-error');
							band=false;
						}
						
					}
				}
				
			}
		});
		if(band)
			document.getElementById("formu").submit();
		else
			return false;
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
			case 11:
				mensaje='Filtros aplicables para especificar una búsqueda';
				break;
			case 12:
				mensaje='Resultado en pantalla de una consulta';
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