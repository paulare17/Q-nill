extends Area2D

#aquesta línea està feta a través dels nodes de l'inspector, seleccionant Pesseta2D 
func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Jugador":
		body.recollir_pesseta()
		print("moneda recollida")
		queue_free()
