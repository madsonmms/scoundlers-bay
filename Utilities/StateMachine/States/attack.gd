extends State
class_name AttackState

@onready var animation_handler : AnimationHandler = $"../../AnimationHandler"
@onready var player : Player = $"../.."

signal AnimFinished

func Enter():
	player.velocity = Vector2.ZERO
	
	print_debug(animation_handler.last_facing_direction)
	
	player.attack_component.start_attack()
	
	var anim_length = animation_handler.animation_player.get_animation("left_combo1").length
	await get_tree().create_timer(anim_length).timeout
	
	if not player.attack_component.Combo_Finished.is_connected(_check_combo_status):
		player.attack_component.Combo_Finished.connect(_check_combo_status)
	
	
	pass

func Physics_Update(_delta):
	pass

func _check_combo_status() -> void:
	
	if player.attack_component.attacking == false:
		AnimFinished.connect(_on_attack_finished, CONNECT_ONE_SHOT)
		emit_signal("AnimFinished")

func _on_attack_finished() -> void:
	
	
	if player.velocity != Vector2.ZERO:
		emit_signal("Transitioned", self, "WalkState")
	else:
		emit_signal("Transitioned", self, "IdleState")

func _on_combo_finished() -> void:
	print_debug("combo finalizado")
	pass
