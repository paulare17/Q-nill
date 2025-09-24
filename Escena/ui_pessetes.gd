extends CanvasLayer
var pessetes = 0
var jugador = Node2D

func _ready():
	jugador = get_parent().get_node("Jugador")
	jugador.recollir_pesseta_signal.connect(_on_jugador_recollir_pesseta_signal)

func _on_jugador_recollir_pesseta_signal() -> void:
	print ("Has recollit una pesseta!")
	pessetes+=1
	$recolect_pessetes.text = str(pessetes)
	print(jugador.global_position.x)

#per passar de nivell: s'ha d'estar a la posició 455 (es pot posar un numero mínim de monedes(q-atre?)
func _process(_delta):
	var nivell_actual = (int(get_tree().current_scene.name))
	var nivell_seguent = nivell_actual+1
	if jugador.global_position.x > 455:
		var ruta_seguent = "res://Escena/level_"+str(nivell_seguent)+".tscn"
		#si el nivell seguent existeix, porta al següent nivell
		if FileAccess.file_exists(ruta_seguent):
			get_tree().change_scene_to_file(ruta_seguent)	
		# si no, porta al menú:
		else:
			get_tree().change_scene_to_file("res://Escena/menu.tscn")
