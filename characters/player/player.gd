extends Sprite2D

var move_speed: float = 400.0

# Animation properties
var anim_frame: int = 0       # 0, 1, 2, or 3
var anim_timer: float = 0.0   # Tracks time for frame updates
var anim_fps: float = 8.0     # Frames per second for walking

func _process(delta: float) -> void:
	# 1. Handle Movement
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += input_dir * move_speed * delta
	
	# 2. Handle Direction and Animation
	if input_dir.length() > 0:
		# Flip the sprite if moving left, un-flip if moving right.
		# If moving strictly up/down, it keeps its last facing direction.
		if input_dir.x < 0:
			flip_h = true
		elif input_dir.x > 0:
			flip_h = false
			
		# Update animation frame timer
		anim_timer += delta
		if anim_timer >= 1.0 / anim_fps:
			anim_timer -= 1.0 / anim_fps
			anim_frame = (anim_frame + 1) % 4
	else:
		# If not moving, snap back to the standing frame
		anim_frame = 0
		anim_timer = 0.0

	# 3. Apply the calculated frame
	# Since there is only 1 row, the frame directly equals the anim_frame
	frame = anim_frame
