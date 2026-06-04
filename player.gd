extends Sprite2D

var move_speed: float = 400.0

# Animation properties
var current_dir: int = 0      # 0: Down, 1: Right, 2: Up, 3: Left
var anim_frame: int = 0       # 0, 1, 2, or 3 (columns)
var anim_timer: float = 0.0   # Tracks time for frame updates
var anim_fps: float = 8.0     # Frames per second for walking

func _process(delta: float) -> void:
    # 1. Handle Movement
    var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    position += input_dir * move_speed * delta
    
    # 2. Handle Direction and Animation
    if input_dir.length() > 0:
        # Determine current row (direction)
        if input_dir.y > 0:
            current_dir = 0 # Down (Row 0)
        elif input_dir.x > 0:
            current_dir = 1 # Right (Row 1)
        elif input_dir.y < 0:
            current_dir = 2 # Up (Row 2)
        elif input_dir.x < 0:
            current_dir = 3 # Left (Row 3)
            
        # Update animation frame timer
        anim_timer += delta
        if anim_timer >= 1.0 / anim_fps:
            anim_timer -= 1.0 / anim_fps
            anim_frame = (anim_frame + 1) % 4
    else:
        # If not moving, snap back to the standing frame (column 0)
        anim_frame = 0
        anim_timer = 0.0

    # 3. Apply the calculated frame
    # Formula: (Row * Total_Columns) + Current_Column
    frame = (current_dir * 4) + anim_frame
