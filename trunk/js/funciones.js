$(document).ready(function(){
	$('.table').dataTable({
		"sPaginationType": "full_numbers"
	});
	
	$("select").chosen({
		'min-width': '100px',
		'white-space': 'nowrap'
	});
});