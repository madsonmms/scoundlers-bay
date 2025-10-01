extends Node
class_name StateMachine

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready() -> void:
	
	#Carrega os estados filho da State Machine
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition) #Conecta ao sinal responsável pela transição em cada um dos estados
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
		
func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
	pass
	
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)
		
func on_child_transition(state, new_state_name) -> void:
	
	#Para garantir que o estado que chamou é o atual
	if state != current_state:
		return 
	
	#Pega o nome do novo estado e garante que ele existe
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	#Sai do estado atual e entra no novo
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state
	
