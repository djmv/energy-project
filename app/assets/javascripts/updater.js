$(document).ready(function(){
   var doStuff = function () {
		$.ajax({
		   url: '/realtime/obtain',
		   dataType: 'json',
		   success: function(data) {
				$('#valor').html(data.value)
				var fecha = new Date(data.created_at)
				$('#fecha').html(fecha)
				$('#grafica').load('/realtime/refresh_part');
		   },
		   type: 'GET'
		});
	};
	setInterval(doStuff, 1000);
});