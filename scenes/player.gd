extends Area2D
class_name Player

@export var mov_length = 36
var prev_pos

func get_input() -> Vector2:
	return Vector2.ZERO

func _process(delta):
	var velocity = get_input()
	if $NextArea.get_overlapping_areas().is_empty():
		position += velocity * mov_length
