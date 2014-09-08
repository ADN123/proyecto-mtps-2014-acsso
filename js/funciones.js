var fecha_actual;
var band=true;
$(document).ready(function(){
	$('.table').DataTable({
		"sPaginationType": "simple",
		responsive: true
	});
	/*$('.table').DataTable({
		"sPaginationType": "simple",
		responsive: true,
		"language":{
			"url": base_url()+"js/de_ES.txt"
		}
	});*/
	
	$("select").chosen({
		'width': '100%',
		'min-width': '100px',
		'white-space': 'nowrap',
		no_results_text: "Sin resultados!",
		max_selected_options: 2
	});
	
	$("#formu").submit(function(){
		band=true;
		
		$(".cont-tooltip").remove();
		$('#formu input, #formu select, #formu textarea').each(function(indice, elemento) {
			var val=$(elemento).val();
			var padr=$(elemento).parents('.form-group');
			
			var vreq=$(elemento).data("req");
			var tipo=$(elemento).data("tip");
			var vmin=$(elemento).data("min");
			var vmax=$(elemento).data("max");
			var mens=$(elemento).data("men");
			var patt2;
			var emen;
						
			var pos=$(elemento).position();
			var h=$(padr).width();
			
			if($(elemento).attr("class")=="form-control") {
				
				$(padr).removeClass('has-error');
				if(vreq=="true" || vreq=="TRUE" || vreq=="1") {
					if(val=="" || val==null) {
						$(padr).addClass('has-error');
						band=false;
						emen="No debe quedar vacío";
						if(mens=="" || mens=="undefined")
							mensaje_tooltip($(padr).find('div:first'),mens,h);
						else
							mensaje_tooltip($(padr).find('div:first'),emen,h);
					}
				}
				
				if(tipo!="" && tipo!="undefined" && tipo!=null && val!="") {
					switch(tipo) {
						case 'var': /*letras*/
							patt2=/^([a-z|\' '|ñ|á-ú]*)$/i;
							emen="Dede escribir sólo letras";
							break;
						case 'int': /*numeros enteros*/
							patt2=/^[0-9]*$/i;
							emen="Dede escribir sólo números enteros";
							break;
						case 'flo': /*numeros flotantes*/
							patt2=/^[0-9]*([.]?[0-9]{1,2})?$/i;
							emen="Dede escribir sólo números";
							break;
						case 'tel': /*telefono*/
							patt2=/^[2|6|7]{1}[0-9]{3}[0-9]{4}$/i;
							emen="El teléfono ingresado es incorrecto";
							break;
						case 'dui': /*dui*/
							patt2=/^[0-9]{8}-[0-9]{1}$/i;
							emen="El DUI ingresado es incorrecto (99999999-9)";
							break;
						case 'nit': /*nit*/
							patt2=/^[0-9]{4}-[0-9]{6}-[0-9]{3}-[0-9]{1}$/i;
							emen="El NIT ingresado es incorrecto (9999-999999-999-9)";
							break;
						case 'cor': /*correo*/
							patt2=/(^(\w+([\.]\w+)*[\@]{1}\w+([\.]\w+)?[\.]{1}\w{2,3})|^)$/i;
							emen="El correo ingresado es incorrecto (ejemplo@correo.com)";
							break;
						case 'fec': /*fecha*/
							patt2=/^([0][1-9]|[12][0-9]|3[01])(\/|-)([0][1-9]|[1][0-2])\2(\d{4})$/i;
							emen="La fecha ingresado es incorrecto (dd/mm/yyyy)";
							break;
						default: /*caracteres alfanumericos*/
							patt2=/^([0-9|#|"|'|\/|\-|°|.|,|a-z|\' '|ñ|á-ú]*)$/i;
					}
					if(!patt2.test(val)){
						$(padr).addClass('has-error');
						band=false;
						if(mens=="" || mens=="undefined")
							mensaje_tooltip($(padr).find('div:first'),mens,h);
						else
							mensaje_tooltip($(padr).find('div:first'),emen,h);
					}
				}
				
				if(vmin!="" && vmin!="undefined" && vmin!=null && val!="") {
					if(tipo=='int' || tipo=='flo'){
						if(Number(val) < Number(vmin)) {
							$(padr).addClass('has-error');
							band=false;
							emen="Debe ser mayor a "+vmin;
							if(mens=="" || mens=="undefined")
								mensaje_tooltip($(padr).find('div:first'),mens,h);
							else
								mensaje_tooltip($(padr).find('div:first'),emen,h);
						}
					}
					else {
						if(Number(val.length) < Number(vmin)) {
							$(padr).addClass('has-error');
							band=false;
							emen="Debe escribir al menos "+vmin+" caracteres";
							if(mens=="" || mens=="undefined")
								mensaje_tooltip($(padr).find('div:first'),mens,h);
							else
								mensaje_tooltip($(padr).find('div:first'),emen,h);
						}
						
					}
				}
				
				if(vmax!="" && vmax!="undefined" && vmax!=null && val!="") {
					if(tipo=='int' || tipo=='flo'){
						if(Number(val) > Number(vmax)) {
							$(padr).addClass('has-error');
							band=false;
							emen="Debe ser menor a "+vmax;
							if(mens=="" || mens=="undefined")
								mensaje_tooltip($(padr).find('div:first'),mens,h);
							else
								mensaje_tooltip($(padr).find('div:first'),emen,h);
						}
					}
					else {
						if(Number(val.length) > Number(vmax)) {
							$(padr).addClass('has-error');
							band=false;
							emen="Debe escribir no más de "+vmax+" caracteres";
							if(mens=="" || mens=="undefined")
								mensaje_tooltip($(padr).find('div:first'),mens,h);
							else
								mensaje_tooltip($(padr).find('div:first'),emen,h);
						}
						
					}
				}				
			}
			$(padr).hover(function(){if($(padr).find('.tooltipflot').length!=0) {$(padr).find('.cont-tooltip').fadeIn(200)}},function(){if($(padr).find('.tooltipflot').length!=0) {$(padr).find('.cont-tooltip').fadeOut(200)}});			
			$(elemento).change(function(){$(padr).find(".cont-tooltip").remove();$(padr).removeClass('has-error');});
		});
		if(band)
			document.getElementById("formu").submit();
		else {
			return false;
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
				mensaje='Formulario de ingreso de promocion de un establecimiento';
				break;
			case 11:
				mensaje='Filtros aplicables para especificar una búsqueda';
				break;
			case 12:
				mensaje='Resultado en pantalla de una consulta';
				break;
			case 13:
				mensaje='Formulario de ingreso de empleados participantes';
				break;
			case 14:
				mensaje='Lista de empleados participantes';
				break;
			case 15:
				mensaje='Formulario de ingreso de capacitaciones';
				break;
			case 16:
				mensaje='Lista de capacitaciones registradas';
				break;
		}
		alerta("Ayuda", mensaje);
		return false;
	});
});
function mensaje_tooltip(obj, men, y) {
	if($(obj).find('.tooltipflot').length==0) {
		var w=Number($(obj).width())-20;
		if(w<212)
			w="auto";
		$('<div class="cont-tooltip"><div id="tooltip" class="tooltipflot">'+men+'</div></div>').css( {
			position: 'absolute',
			top: 0,
			left: 10,
			right: 10,
			margin: "0 auto",
			"min-width": y-20,
			"max-width": w,
			"z-index":1,
			"text-align": "center"
		}).appendTo(obj).fadeOut(0);
	}
}
function showTooltip(x, y, contents) {
	jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
		position: 'absolute',
		display: 'none',
		top: y + 5,
		left: x + 5
	}).appendTo("body").fadeIn(200);
}
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
				if($("#calendar_dia").data("val")=="1") {
					$('#cont-calendario').load(base_url()+'index.php/promocion/calendario/'+$("#id_empleado").val());
					$('#cont-institucion').load(base_url()+'index.php/promocion/institucion_visita/'+$("#id_empleado").val());
					modal("Programación del día",base_url()+'index.php/promocion/calendario_dia/'+$("#id_empleado").val()+'/'+fecha_actual);
				}
				if($("#calendar_dia").data("val")=="2") {
					$('#cont-calendario').load(base_url()+'index.php/verificacion/calendario/'+$("#id_empleado").val());
					$('#cont-institucion').load(base_url()+'index.php/verificacion/institucion_visita/'+$("#id_empleado").val());
					modal("Programación del día",base_url()+'index.php/verificacion/calendario_dia/'+$("#id_empleado").val()+'/'+fecha_actual);
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