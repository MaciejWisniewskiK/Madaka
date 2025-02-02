extends TextureProgressBar

@export var health : Health

func _ready():
	health.damaged.connect(animate_hp_change)
	value = health.get_current()
	max_value = health.max_health
	visible = false

func animate_hp_change(amount: float, current_hp: float) -> void:
	print("hp:", current_hp)
	visible = current_hp < health.max_health
	var tween = create_tween()
	tween.tween_property(self, "value", current_hp, 0.3).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

