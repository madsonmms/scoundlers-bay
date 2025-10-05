class_name AttackComponent
extends Node

signal Next_Combo
signal Combo_Finished
signal Combo_Reset

@onready var player : Player = $".."
@onready var combo_timer : Timer = $Timer

var current_combo_step : int = 0
var attacking : bool = false

func _ready() -> void:
	combo_timer.timeout.connect(_on_combo_timeout)

func start_attack() -> void:
	current_combo_step = 1
	combo_timer.start()

func try_next_combo() -> bool:
	if attacking and not combo_timer.is_stopped():
		if current_combo_step == 1:
			current_combo_step += 1
		else:
			current_combo_step -= 1
			
		combo_timer.start()
		Next_Combo.emit(current_combo_step)
		print_debug("Próximo combo: ", current_combo_step)
		return true
	return false

func _on_combo_timeout() -> void:
	print_debug("finalizando ataque")
	attacking = false
	current_combo_step = 0
	Combo_Finished.emit()
