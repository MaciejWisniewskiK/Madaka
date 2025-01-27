class_name Player extends CharacterBody2D


var SPEED = 100.0
var slow_modifier = 0
@onready var health : Health = $Health
@onready var timer = $Timer

signal slowed(amount: float, knockback: Vector2)


func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	
	
	velocity = (SPEED * (1 - slow_modifier)) * direction;
	move_and_slide()


func _on_health_damaged(amount, knockback):
	print("player damaged by: %d" % amount)
	
func apply_slow(amount, duration):
	timer.start(duration)
	slow_modifier = amount
	print("Timer sta")

func _on_timer_timeout():
	slow_modifier = 0
	print("Timer stop")
