class_name Przydupas extends RigidBody2D
@onready var anim= $AnimatedSprite2D
const speed = 50.0
var target : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0
	contact_monitor = true
	max_contacts_reported = 3
	anim.play("walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func _on_body_entered(body):
	if body is Player:
		body.apply_slow(0.8, 3)
		queue_free()
