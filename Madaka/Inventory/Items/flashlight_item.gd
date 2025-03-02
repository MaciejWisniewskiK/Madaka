extends Node2D

@onready var interactable = $interactable


func _ready():
	interactable.interact = _on_interact


func _on_interact():
	queue_free()
	# add yourself to players inventory
	pass
