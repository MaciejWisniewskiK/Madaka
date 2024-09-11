extends StaticBody2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func fire_on():
	state_machine.travel("FireOn")

func fire_off():
	state_machine.travel("FireOff")
	
func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_O) and just_pressed:
		fire_on()
	if Input.is_key_pressed(KEY_P) and just_pressed:
		fire_off()
