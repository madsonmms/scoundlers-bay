class_name Player
extends CharacterBody2D

@onready var stats : StatsHandler = $StatsHandler
@onready var input_dir : Vector2
@onready var animation_tree : AnimationTree = $AnimationTree

func _physics_process(_delta: float) -> void:
	
	#controla o movimento
	input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * stats.move_speed
	move_and_slide()
	
