$("#resultado").html("<%= j render "/realtime/historic" %>")
$("#promedio2").html("<%= @promedio.round(4) %>")