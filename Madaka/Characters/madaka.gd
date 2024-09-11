extends CharacterBody2D

@onready var level = get_parent()
@onready var projectile = load("res://scenes/projectile.tscn")
@onready var timer = $Timer

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	level.add_child.call_deferred(instance)

func _physics_process(delta):
	rotation_degrees += 50 * delta	
