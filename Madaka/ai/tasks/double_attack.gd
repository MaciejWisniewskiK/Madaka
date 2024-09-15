extends BTAction

@export var target_var : StringName = &"target"

const FANCY_PROJECTILE = preload("res://scenes/fancy_projectile.tscn")

func _tick(_delta: float) -> Status:
	var target: Player = blackboard.get_var(target_var)
	var instance = FANCY_PROJECTILE.instantiate()
	instance.player_position = target.global_position
	instance.bend_intensity = 100.0
	instance.curve_direction = -1
	var instance2 = FANCY_PROJECTILE.instantiate()
	instance2.player_position = target.global_position
	instance2.bend_intensity = 100.0
	instance2.curve_direction = 1
	agent.add_child.call_deferred(instance)
	agent.add_child.call_deferred(instance2)
	
	return SUCCESS
