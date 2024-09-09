extends CharacterBody2D


const SPEED = 100.0

func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = SPEED * direction;
	move_and_slide()
