<div class="col-md-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="minimize">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Datos de la visita</h3>
        </div>
        <div class="panel-body">
  			<form class="form-horizontal" name="formu" id="formu" method="post" action="<?php echo base_url()?>index.php/promocion/guardar_programacion">                
                <div class="form-group">
                    <label for="id_empleado" class="col-sm-3 control-label">Técnico <span class="asterisk">*</span></label>
                    <div class="col-sm-7">
                        <select class="form-control" name="id_empleado" id="id_empleado" data-placeholder="[Seleccione..]">
                            <option value=""></option>
                            <?php
                                foreach($tecnico as $val) {
                                    echo '<option value="'.$val['id'].'">'.ucwords($val['nombre']).'</option>';
                                }
                            ?>
                        </select>
                    </div>
                </div>
                
                <div class="form-group" id="cont-institucion">
                    <label for="id_institucion" class="col-sm-3 control-label">Institución <span class="asterisk">*</span></label>
                    <div class="col-sm-7">
                        <select class="form-control" name="id_institucion" id="id_institucion" data-placeholder="[Seleccione..]" disabled="disabled">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                
               	<div class="form-group" id="cont-lugar-trabajo">
                    <label for="id_lugar_trabajo" class="col-sm-3 control-label">Lugar de trabajo <span class="asterisk">*</span></label>
                    <div class="col-sm-7">
                        <select class="form-control" name="id_lugar_trabajo" id="id_lugar_trabajo" data-placeholder="[Seleccione..]" disabled="disabled">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                
               	<div class="form-group" id="cont-lugar-trabajo">
                    <label for="fecha_visita" class="col-sm-3 control-label">Fecha de visita <span class="asterisk">*</span></label>
                    <div class="col-sm-4">
                    	<div class="input-group">
                            <input type="text" class="form-control" id="fecha_visita" name="fecha_visita" readonly="readonly">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                      	</div>
                    </div>
                </div>
                
               	<div class="form-group" id="cont-lugar-trabajo">
                    <label for="hora_visita" class="col-sm-3 control-label">Hora de visita <span class="asterisk">*</span></label>
                    <div class="col-sm-4">
                    	<div class="input-group">
                            <div class="bootstrap-timepicker"><input id="timepicker" type="text" class="form-control" readonly="readonly"/></div>
                     		<span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                    	</div>
                    </div>
                </div>
                
                <ul class="pager wizard">
                    <li><button class="btn btn-success" type="submit" name="guardar" id="guardar"><span class="glyphicon glyphicon-floppy-save"></span> Guardar</button></li>
                    <li><button class="btn btn-warning" type="reset" name="limpiar" id="limpiar"><span class="glyphicon glyphicon-trash"></span> Limpiar</button></li>
                </ul>
            </form>
      	</div>
   	</div>
</div>
<div class="col-md-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
        <div class="panel-btns">
        	<a href="#" class="minimize">−</a>
        </div><!-- panel-btns -->
        	<h3 class="panel-title">Calendario de actividades</h3>
        </div>
        <div class="panel-body panel-body-nopadding">
  			<div id="calendar"></div>
      	</div>
   	</div>
</div>
<script>
	$(document).ready(function() {
		var date = new Date('2014-7-13 13:34:12');
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#id_empleado').change(function(){
			id=$(this).val();
			$('#cont-institucion').load(base_url()+'index.php/promocion/institucion_visita/'+id);
			$('#cont-lugar-trabajo').load(base_url()+'index.php/promocion/lugares_trabajo_institucion_visita/0/0/0');
		});
		
		$('#fecha_visita').datepicker({beforeShowDay: $.datepicker.noWeekends, minDate: '0D'});
		$('#timepicker').timepicker({defaultTIme: false});
		
		$('#calendar').fullCalendar({
			header: {
				right: 'today prev,next',
				center: 'title',
				left: ''
			},
			buttonText: {
				today : 'Hoy',
				month: 'Mes',
				agendaWeek: 'Semana',
				agendaDay: 'Día'
			},
			monthNamesShort : ['Enero' , 'Febrero' , 'Marzo' , 'Abril' , 'Mayo' , 'Junio' , 'Julio' , 'Agosto' , 'Septiembre' , 'Octubre' , 'Noviembre' , 'Diciembre' ],
			dayNamesShort : ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],   
			titleFormat : "MMM yyyy",  
			columnFormat:'ddd',  
			timeFormat: 'h:mm tt  - h:mm tt \n',  
			
			defaultView: 'month',
			editable: false,
			eventDurationEditable: false,
			eventStartEditable: false,
			droppable: false,
			selectHelper: false,
			slotMinutes: 60,
			selectable: false,
			minTime : 7,
			maxTime : 18,
			firstDay : 1,
			allDaySlot : false,
			weekends: false,
			defaultEventMinutes : 60,  
          	dragOpacity: "0.5",		
			slotEventOverlap: false,	
			unselectAuto: false,
			weekMode : false,  
			
			/*events: [
				{
					id: 1,
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					id: 2,
					title: 'Long  Event',
					start: new Date(y, m, d-5)
				},
				{
					id: 3,
					title: 'Repeating Event333333333333',
					start: new Date(y, m, d),
					allDay: false
				},
				{
					id: 4,
					title: 'Repeating Event22222222',
					start: new Date(y, m, d+1)
				},
				{
					id: 5,
					title: 'Click for Google',
					start: new Date(y, m, 28)
				}
			],*/
			
			dayClick: function(date, view) {
				alert('dayClick');
			},
			eventClick: function(event, jsEvent){
				alert('eventClick');
          	}
		});
	});
</script>