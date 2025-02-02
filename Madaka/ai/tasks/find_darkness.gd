extends BTAction

@export var darkness_var : StringName = &"darkness"

func _tick(_delta: float) -> Status:
	# Find darkness in tree
	var darkness = agent.get_tree().get_first_node_in_group("darkness")
	blackboard.set_var(darkness_var, darkness);
	
	return SUCCESS
