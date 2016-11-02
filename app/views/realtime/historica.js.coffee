$("#resultado").html("<%= j render "/realtime/historic" %>")
$("#promedio2").html("<%= @promedio.round(2) %> kWh")
$("#costo2").html("$<%= @costo.round(2) %>")