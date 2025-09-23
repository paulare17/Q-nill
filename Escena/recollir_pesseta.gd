extends Area2D

signal recollir_pesseta_signal

func _on_body_entered(body):
	#if body.get_name()==$"Jugador":
		emit_signal("recollir_pesseta_signal")
		queue_free()
	
