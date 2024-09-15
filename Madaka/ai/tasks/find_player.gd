extends BTAction

@export var target_var : StringName = &"target"

var target
var level

func _tick(_delta: float) -> Status:
	var target = agent.get_tree().get_first_node_in_group("player")
	blackboard.set_var(target_var, target);
	
	return SUCCESS
