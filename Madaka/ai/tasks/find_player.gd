extends BTAction

@export var target_var : StringName = &"target"
@export var darkness_var : StringName = &"darkness"

func _tick(_delta: float) -> Status:
	# Find player in tree
	var target = agent.get_tree().get_first_node_in_group("player")
	blackboard.set_var(target_var, target);
	
	# Find darkness in tree
	var darkness = agent.get_tree().get_first_node_in_group("darkness")
	blackboard.set_var(darkness_var, darkness);
	
	return SUCCESS
