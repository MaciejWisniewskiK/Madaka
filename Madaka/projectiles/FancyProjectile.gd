class_name FancyProjectile extends Area2D

var enemy_position: Vector2
var player_position: Vector2
var control_point: Vector2
var t: float = 0.0  # The interpolation factor (between 0 and 1)
var speed: float = 1.0  # Speed of the projectile
var projectile_position: Vector2
var bend_intensity: float = 100.0  # Controls how strong the curve is
var curve_direction = 1

func _ready():
	enemy_position = global_position  # Starting position of the enemy
	control_point = calculate_control_point(enemy_position, player_position)  # Curve control
	
	# Initial position
	projectile_position = enemy_position
	
	# Start the projectile's movement
	set_process(true)

# Main process loop for updating projectile's position
func _process(delta):
	# Move along the curve using the parametric formula
	t += delta * speed
	
	# Cap 't' at 1.0 to stop when it reaches the player
	if t > 1.0:
		t = 1.0
		set_process(false) # Stop processing once the projectile hits the player

	# Calculate the new position using the quadratic Bezier formula
	projectile_position = calculate_bezier_position(enemy_position, control_point, player_position, t)
	global_position = projectile_position

# Function to calculate the Bezier curve position
func calculate_bezier_position(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	var one_minus_t = 1.0 - t
	return one_minus_t * one_minus_t * p0 + 2 * one_minus_t * t * p1 + t * t * p2

# Function to calculate the control point (for curve bending)
func calculate_control_point(start: Vector2, end: Vector2) -> Vector2:
	# Direction vector from enemy to player
	var direction = (end - start).normalized()
	
	# Perpendicular vector to the direction (this is the "side" direction)
	var perpendicular = Vector2(-direction.y, direction.x)  # Rotate 90 degrees to the left
	
	# You can flip this to curve to the opposite side:
	# var perpendicular = Vector2(direction.y, -direction.x)  # Rotate 90 degrees to the right

	# Calculate the control point based on the perpendicular vector
	# The intensity of the curve is controlled by bend_intensity
	var control_offset = perpendicular * bend_intensity * curve_direction
	
	# The control point is placed at the midpoint between start and end, with the offset applied
	var mid_point = (start + end) / 2
	
	return mid_point + control_offset


func _on_body_entered(body):
	if body is Player:
		body.health.take_damage(1, Vector2.ZERO)
		queue_free()
