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

#per passar de nivell: s'ha de tenir 4 o més monedes i estar a la posició 455
func _process(_delta):
	if pessetes>=4 and jugador.global_position.x > 455:
		#comentar o una o l'altra (la primera porta al menú i la segona al nivell 2):
		#get_tree().change_scene_to_file("res://Escena/menu.tscn")
		get_tree().change_scene_to_file("res://Escena/level_2.tscn")
