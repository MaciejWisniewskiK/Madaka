extends BTAction

@export var target_var : StringName = &"target"

const PRZYDUPAS = preload("res://Characters/przydupas.tscn")

func _tick(_delta: float) -> Status:
	var target: Player = blackboard.get_var(target_var)
	var instance = PRZYDUPAS.instantiate()
	instance.target = target
	agent.add_child.call_deferred(instance)
	
	return SUCCESS
