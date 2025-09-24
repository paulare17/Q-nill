extends CanvasLayer
var pessetes = 0

func _ready():
	var jugador = get_parent().get_node("Jugador")
	jugador.recollir_pesseta_signal.connect(_on_jugador_recollir_pesseta_signal)

func _on_jugador_recollir_pesseta_signal() -> void:
	print ("Has recollit una pesseta!")
	pessetes+=1
	$recolect_pessetes.text = str(pessetes)
