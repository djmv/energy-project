$(document).ready(function(){
   var doStuff = function () {
		$.ajax({
		   url: '/realtime/obtain',
		   dataType: 'json',
		   success: function(data) {
				$('#valor').html(data.ultimo.value)
				var fecha = new Date(data.ultimo.created_at)
				$('#fecha').html(fecha)
				$('#promedio').html('<p>'+data.promedio+' kW/h</p>')
				$('#grafica').load('/realtime/refresh_part');
		   },
		   type: 'GET'
		});
	};
	setInterval(doStuff, 1000);
});