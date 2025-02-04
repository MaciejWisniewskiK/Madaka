extends Control

@onready var inv: Inv = preload("res://Inventory/player_inventory.tres")
@onready var slots: Array = $ColorRect/GridContainer.get_children()

func _ready():
	update_slots()

func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])
