extends State
class_name AttackState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var player : Player = $"../.."

signal AnimFinished

func Enter():
	print_debug("")
	print_debug("attacking!")
	player.velocity = Vector2.ZERO
	var anim_length = animation_player.get_animation("attack_left").length
	await get_tree().create_timer(anim_length).timeout
	AnimFinished.connect(_on_attack_finished, CONNECT_ONE_SHOT)
	emit_signal("AnimFinished")
	
	pass

func Physics_Update(_delta):
	pass
	
func _on_attack_finished() -> void:
	print_debug("done attacking!")
	player.attacking = false
	if player.velocity != Vector2.ZERO:
		emit_signal("Transitioned", self, "WalkState")
	else:
		emit_signal("Transitioned", self, "IdleState")
	
