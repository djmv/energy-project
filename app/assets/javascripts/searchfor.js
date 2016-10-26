$(document).ready(function(){
	document.getElementById("butoncito").addEventListener("click", function(){
    	$('#grafica2').load('/realtime/refresh_part?fechai=&fechaf=');
    	console.log($('#datetimepicker1').data("DateTimePicker").date().toString())
	});
});