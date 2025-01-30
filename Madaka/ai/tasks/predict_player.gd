class_name PredictPlayer

static func predict_direction(player_pos: Vector2, agent_pos: Vector2, agent_speed: float, player_velocity: Vector2, max_iterations: int = 5) -> Vector2:
	var dist = player_pos - agent_pos
	var t = dist.length() / agent_speed
	var predicted_pos = player_pos + player_velocity * t
	
	# Iteratively refine t
	for i in range(max_iterations):
		t = (predicted_pos - agent_pos).length() / agent_speed
		var new_predicted_pos = player_pos + player_velocity * t
		if (new_predicted_pos - predicted_pos).length() < 1.0:  # Stop if change is small
			break
		predicted_pos = new_predicted_pos

	return predicted_pos - agent_pos
