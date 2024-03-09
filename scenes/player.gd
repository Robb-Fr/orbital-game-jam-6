extends Area2D
class_name Player

@export var mov_length = 36
var prev_pos

func get_input() -> Vector2:
	return Vector2.ZERO

func _process(delta):
	var velocity = get_input()
	if velocity != Vector2.ZERO:
		print(velocity)
	var prev_pos = position
	
	position += velocity * mov_length
	
	var next_area: Area2D = new Area2D()
