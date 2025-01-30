extends BTAction

@export var target_pos_var : StringName = &"target_pos"

var noise = generate_noise(30)
const epsilon = 1

func generate_noise(std_dev: float) -> Vector2:
	var e1 = randfn(0, std_dev)
	var e2 = randfn(0, std_dev)
	var res = Vector2(e1, e2)
	while (res.length() < 10):
		e1 = randfn(0, std_dev)
		e2 = randfn(0, std_dev)
		res = Vector2(e1, e2)
	return res
	
func _enter() -> void:
	agent.linear_velocity = Vector2.ZERO

func _tick(_delta: float) -> Status:
	agent.rotation_degrees = 0
	var player = agent.target
	var predicted_pos = PredictPlayer.predict_direction(
							player.global_position,
							agent.global_position,
							agent.speed,
							player.velocity)
	var pos_with_noise = predicted_pos + noise
	var direction = pos_with_noise.normalized()
	if (pos_with_noise.length() < epsilon):
		return SUCCESS
	
	agent.position += direction * agent.speed * _delta
	return RUNNING
