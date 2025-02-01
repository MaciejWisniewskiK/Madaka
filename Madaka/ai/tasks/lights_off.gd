extends BTAction

@export var darkness_var : StringName = &"darkness"

func _tick(_delta: float) -> Status:
	var darkness: Node2D = blackboard.get_var(darkness_var)
	darkness.show()
	return SUCCESS
