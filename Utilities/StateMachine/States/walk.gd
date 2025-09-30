extends State
class_name WalkState

@onready var player : Player = $"../.."

func Enter():
	pass

func Physics_Update(_delta):
	if player.input_dir == Vector2.ZERO:
		print_debug("transitioned")
		Transitioned.emit(self, "IdleState")
