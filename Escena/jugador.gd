extends CharacterBody2D

@export var velocitat: float
@export var salt: float 
@onready var qnill_animat = $"Q-nill"
@onready var respawn_point = $"../PuntRespawn"
var esta_girat_dreta = true
var viu_caiguda = true
var gravetat = ProjectSettings.get_setting("physics/2d/default_gravity")
#var respawnPosition = position
#x = 137 y = 175
#y = 250


func _physics_process(delta):
	update_animacions()
	moviment_horitzontal()
	girar()
	saltar(delta)
	move_and_slide()
	morir_salt()

func morir_salt():
	#de moment funciona però es pot millorar més endavant: https://www.youtube.com/watch?v=7S9zzpRSglw&list=PLNEAWvYbJJ9nNOpe6fun7m6L_M8xslYnT&index=6
	if global_position.y >= 250:
		# Teleportar al jugador a la posició global del punt de respawn
		position = respawn_point.global_position
		# Assegurar-se que el jugador s'atura en respawnar
		velocity = Vector2.ZERO
		


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
