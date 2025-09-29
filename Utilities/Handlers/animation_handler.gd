class_name AnimationHandler
extends Node

@onready var animation_player : AnimationPlayer = $"../AnimationPlayer"
@onready var animation_tree : AnimationTree = $"../AnimationTree"
@onready var player : Player = get_owner()

var last_facing_direction : = Vector2(0, -1)

func _physics_process(_delta: float) -> void:
	
	var idle = !player.velocity
	
	if !idle:
		last_facing_direction = player.velocity.normalized()
	
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
	animation_tree.set("parameters/Walk/blend_position", last_facing_direction)
