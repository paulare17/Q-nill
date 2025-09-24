extends Area2D

#aquesta línea està feta a través dels nodes de l'inspector, seleccionant Pesseta2D 
func _on_body_entered(body: Node2D) -> void:
	print(body.get_name())
	if body.get_name() == "Jugador":
		get_tree().reload_current_scene()
