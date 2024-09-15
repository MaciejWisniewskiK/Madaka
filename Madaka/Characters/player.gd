class_name Player extends CharacterBody2D


const SPEED = 100.0
@onready var health : Health = $Health


func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = SPEED * direction;
	move_and_slide()


func _on_health_damaged(amount, knockback):
	print("player damaged by: %d" % amount)
