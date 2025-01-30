extends BTAction

@export var initial_speed: float = 300.0  # Speed when launched
@export var charge_time: float = 2.0  # Charge duration (2 seconds)
@export var target_pos_var: StringName = &"target_pos"

var arrow: Polygon2D  # Dynamic arrow
var attack_direction: Vector2
var charge_timer: Timer
var tween: Tween

func create_arrow():
	arrow = Polygon2D.new()
	agent.add_child(arrow)  # Attach arrow to the agent (not the enemy scene)
	arrow.z_index = 1  # Ensure it's above other visuals
	arrow.color = Color(1, 0, 0, 0.8)  # Semi-transparent red

	# Define arrow shape (a simple triangle)
	arrow.polygon = PackedVector2Array([
		Vector2(0, -5),   # Top
		Vector2(20, 0),   # Tip
		Vector2(0, 5),    # Bottom
		Vector2(5, 0)     # Back part
	])
	
	arrow.visible = true

func _enter() -> void:
	# Get the player position and calculate attack direction
	var player = agent.target
	attack_direction = PredictPlayer.predict_direction(
		player.global_position,
		agent.global_position,
		initial_speed,
		player.velocity
	)
	blackboard.set_var(target_pos_var, attack_direction)

	# Ensure charge_timer exists and is added to the agent
	if charge_timer == null:
		charge_timer = Timer.new()
		charge_timer.one_shot = true
		agent.add_child(charge_timer)
	if arrow == null:
		create_arrow()

	charge_timer.wait_time = charge_time
	charge_timer.start()
	
	arrow.visible = true
	arrow.global_position = agent.global_position
	arrow.rotation = attack_direction.angle()
	arrow.scale = Vector2(0.5, 0.5)
	
	tween = agent.create_tween()
	tween.tween_property(arrow, "scale", Vector2(2, 2), charge_time)

	# Start the charge timer
	charge_timer.start()

func _tick(_delta: float) -> Status:
	if charge_timer.time_left == 0:
		arrow.visible = false
		return SUCCESS
	return RUNNING
