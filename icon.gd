extends Sprite2D

# The speed of rotation in radians per second
var rotation_speed: float = 3.0
# The speed of movement in pixels per second
var move_speed: float = 400.0

func _process(delta: float) -> void:
	# Keep the rotation logic
	rotation += rotation_speed * delta
	
	# Get the directional input from the arrow keys (or WASD / gamepad)
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Update the position based on the input and speed
	position += input_dir * move_speed * delta
