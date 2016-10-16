$(document).ready(function(){
   var doStuff = function () {
		$.ajax({
		   url: '/precios/obtener',
		   dataType: 'html',
		   success: function(data) {
				$('#valor').html($(data).filter("#result").text())	   
				$('#fecha').html($(data).filter("#result2").text())
				$('#grafica').load('/realtime/refresh_part');
		   },
		   type: 'GET'
		});
	};
	setInterval(doStuff, 1000);
});