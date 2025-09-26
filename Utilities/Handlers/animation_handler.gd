class_name AnimationHandler
extends Node

@onready var animation_player : AnimationPlayer = $"../AnimationPlayer"
@onready var animation_tree : AnimationTree = $"../AnimationTree"
@onready var player : Player = get_owner()

func _physics_process(_delta: float) -> void:
	
	var velocity = player.velocity
	animation_tree.set("parameters/Walk/blend_position", velocity)
