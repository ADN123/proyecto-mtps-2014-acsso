<div class="row">
        <div class="col-md-3">
          <div class="panel panel-default panel-dark panel-alt">
            <div class="panel-heading">
              <h4 class="panel-title">Draggable Events</h4>
            </div>
            <div class="panel-body">
              <div id='external-events'>
                <div class='external-event'>My Event 1</div>
                <div class='external-event'>My Event 2</div>
                <div class='external-event'>My Event 3</div>
                <div class='external-event'>My Event 4</div>
                <div class='external-event'>My Event 5</div>
              </div>
            </div>
          </div>
        </div><!-- col-md-3 -->
        <div class="col-md-9">
          <div id="calendar"></div>
        </div><!-- col-md-9 -->
      </div>
<script>
jQuery(document).ready(function() {
	
	
		/* initialize the external events
		-----------------------------------------------------------------*/
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		jQuery('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			<?php
				$fecha = date('c');
				$nuevafecha = strtotime ( '+1 hour' , strtotime ( $fecha ) ) ;
			
			?>
			var eventObject = {
				title: $.trim($(this).text()), // use the element's text as the event title
				url: "http://www.as.com"
			};
			
			// store the Event Object in the DOM element so we can get to it later
			jQuery(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			jQuery(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	
	
		/* initialize the calendar
		-----------------------------------------------------------------*/
		
		jQuery('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultView: 'agendaWeek',
			editable: true,
			eventDurationEditable: true,
			eventStartEditable: true,
			droppable: true, // this allows things to be dropped onto the calendar !!!
			selectHelper: true,
			slotMinutes: 60,
			selectable: true,
			minTime : 7,
			maxTime : 18,
			firstDay : 1,
			allDaySlot : false,
			columnFormat:'ddd d/M',       
			titleFormat : "MMM d[ yyyy]{ '&#8212;'[MMM] dd 'del' yyyy}",
			weekends: false,
			defaultEventMinutes : 60,        
			buttonText: {
				today : 'Hoy',
				month: 'Mes',
				agendaWeek: 'Semana',
				agendaDay: 'Día'
			},		
			slotEventOverlap: false,	
			unselectAuto: false,
			weekMode : false,
			monthNamesShort : ['Enero' , 'Febrero' , 'Marzo' , 'Abril' , 'Mayo' , 'Junio' , 'Julio' ,
						'Agosto' , 'Septiembre' , 'Octubre' , 'Noviembre' , 'Diciembre' ],
			dayNamesShort : ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
			
			dayClick: function(date, view) {
				$('#calendar').fullCalendar('changeView', 'agendaDay');
				$('#calendar').fullCalendar('gotoDate', date);
			},
			
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 1,
					title: 'Repeating Event333333333333',
					start: new Date(y, m, d, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event22222222',
					start: new Date(y, m, d+1, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting ',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party2',
					start: new Date(y, m, d+1, 10, 0),
					end: new Date(y, m, d+1, 11, 0),
					allDay: false

				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			],
			
			eventClick: function(event, jsEvent){
              		if (confirm('Esta seguro de eliminar? Esta accion no se podra deshacer')) {
                		$('#calendar').fullCalendar( 'removeEvents', event.id);
						return false;
              		}
					else {
                		return false;
              		}
          	},
			
			timeFormat: 'h:mm t{ - h:mm t} ',
          	dragOpacity: "0.5",
			
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = jQuery(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
								
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				jQuery('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				jQuery(this).remove();
				
			},
			eventDragStop: function( event, jsEvent, ui, view ) { 
				//alert(event.end);
				return false;
			},
			eventResizeStop: function(event, delta, revertFunc) {
		
				alert(2);
		
			}
		});
        
		
	});
</script>