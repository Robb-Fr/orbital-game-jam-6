extends Player

func get_input() -> Vector2:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_just_pressed("right_move_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("right_move_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("right_move_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("right_move_up"):
		velocity.y -= 1
		
	return velocity
