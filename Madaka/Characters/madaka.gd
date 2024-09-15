extends CharacterBody2D

@onready var level = get_parent()
@onready var projectile = load("res://scenes/projectile.tscn")

func _physics_process(delta):
	#rotation_degrees += 50 * delta	
	pass

