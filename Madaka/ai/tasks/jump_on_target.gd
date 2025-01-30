extends BTAction

@export var initial_speed: float = 300.0  # Speed when launched
@export var target_pos_var : StringName = &"target_pos"
var velocity: Vector2

func _enter() -> void:
	var predicted_pos = blackboard.get_var(target_pos_var)
	velocity = predicted_pos.normalized() * initial_speed
	agent.linear_velocity = velocity

func _tick(_delta: float):

	return RUNNING
		
