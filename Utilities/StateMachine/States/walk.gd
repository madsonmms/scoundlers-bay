extends State
class_name WalkState

@onready var player : Player = $"../.."

func Enter():
	pass

func Physics_Update(_delta):
	if player.input_dir == Vector2.ZERO:
		Transitioned.emit(self, "IdleState")
		
	if player.attack_component.attacking == true:
		Transitioned.emit(self, "AttackState")
