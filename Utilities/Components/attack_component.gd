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
	combo_timer.start()

func _on_combo_timeout() -> void:
	attacking = false
	Combo_Finished.emit()
