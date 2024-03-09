extends Player
class_name Hero

func _ready():
	super._ready()
	$AnimatedSprite2D.play("hero")

func get_input() -> Vector2:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_just_pressed("left_move_right"):
		velocity.x += 1
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_just_pressed("left_move_left"):
		velocity.x -= 1
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_just_pressed("left_move_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("left_move_up"):
		velocity.y -= 1
		
	return velocity

