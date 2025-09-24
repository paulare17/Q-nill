extends CharacterBody2D

@export var velocitat: float
@export var salt: float 
@onready var qnill_animat = $"Q-nill"
var respawn_point = null
var esta_girat_dreta = true
var viu_caiguda = true
var gravetat = ProjectSettings.get_setting("physics/2d/default_gravity")
#var respawnPosition = position
#x = 137 y = 175
#y = 250

func _ready():
	# Cerca el node 'PuntRespawn' dins de l'escena actual.
	#var current_scene_root = get_tree().get_current_scene()
	#if current_scene_root != null:
			#respawn_point = current_scene_root.find_node("PuntRespawn", true, false)
	pass

func _physics_process(delta):
	update_animacions()
	moviment_horitzontal()
	girar()
	saltar(delta)
	move_and_slide()


func update_animacions():
	if not is_on_floor():
		if velocity.y < 0:
			qnill_animat.play("saltar")
		
	if velocity.x:
		qnill_animat.play("caminar")
	else:
		qnill_animat.play("normal")

func moviment_horitzontal():
	var input_axis = Input.get_axis("moure_esq", "moure_dreta")
	velocity.x = input_axis * velocitat

func girar():
	if (esta_girat_dreta and velocity.x <0) or (not esta_girat_dreta and velocity.x > 0):
			scale.x *= -1
			esta_girat_dreta = not esta_girat_dreta
			
func saltar(delta):
#si volem salt senzill, comentar segona línea
#si volem salt infinit, comentar primera línea	
	if Input.is_action_just_pressed("saltar") and is_on_floor(): #comentar si volem salt múltiple
	#if Input.is_action_just_pressed("saltar"): #comentar si volem salt normal
		velocity.y = -salt
	if not is_on_floor():
		velocity.y += gravetat * delta
