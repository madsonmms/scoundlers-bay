class_name Player
extends CharacterBody2D

@onready var stats : StatsHandler = $StatsHandler
@onready var input_dir : Vector2
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var attack_component : AttackComponent = $AttackComponent

func _physics_process(_delta: float) -> void:
	
	#controla o movimento
	input_dir = Input.get_vector("left","right","up","down")
	
	if attack_component.attacking != true:
		velocity = input_dir * stats.move_speed
		move_and_slide()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("z_button"):
		if attack_component.attacking == true:
			attack_component.try_next_combo()
		else:
			attack_component.attacking = true
