extends State
class_name AttackState

@onready var animation_handler : AnimationHandler = $"../../AnimationHandler"
@onready var player : Player = $"../.."

func Enter():
	player.velocity = Vector2.ZERO
	
	var anim_length = animation_handler.animation_player.get_animation("left_combo1").length
	await get_tree().create_timer(anim_length).timeout
	
	#Conecta ao sinal para utilizá-lo quando o combo finalizar
	player.attack_component.Combo_Finished.connect(_on_attack_finished, CONNECT_ONE_SHOT)
	
	pass
	
func Update(_delta):
	player.velocity = Vector2.ZERO
	pass
	
func Physics_Update(_delta):
	player.velocity = Vector2.ZERO
	pass
	
func _on_attack_finished() -> void:
	if player.velocity != Vector2.ZERO:
		emit_signal("Transitioned", self, "WalkState")
	else:
		emit_signal("Transitioned", self, "IdleState")
