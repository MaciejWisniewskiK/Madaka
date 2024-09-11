extends Sprite2D


@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func turn_on():
	state_machine.travel("sports")

func turn_off():
	state_machine.travel("Off")
	
func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_O) and just_pressed:
		turn_on()
	if Input.is_key_pressed(KEY_P) and just_pressed:
		turn_off()
