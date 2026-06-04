extends Sprite2D

var move_speed: float = 400.0
var fps: float = 12.0 # Animation speed (frames per second)
var anim_timer: float = 0.0

func _process(delta: float) -> void:
	# 1. Handle Movement
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += input_dir * move_speed * delta
	
	# 2. Handle Animation
	if input_dir.length() > 0:
		# Flip the sprite visually if moving left
		if input_dir.x != 0:
			flip_h = input_dir.x < 0
			
		# Advance the animation timer
		anim_timer += delta
		if anim_timer >= 1.0 / fps:
			anim_timer = 0.0
			# Loop through frames 0, 1, 2, 3
			frame = (frame + 1) % hframes 
	else:
		# Reset to the standing/idle frame if no keys are pressed
		frame = 0
		anim_timer = 0.0
