extends Area2D
class_name Player

@export var mov_length = 36
var prev_pos
signal hit_other

func get_input() -> Vector2:
	return Vector2.ZERO

func _ready():
	prev_pos = position

func _process(delta):
	var velocity = get_input()
	
	if velocity.x != 0 and velocity.y != 0:
		velocity.y = 0
		
	if velocity != Vector2.ZERO:
		prev_pos = position
		position += velocity * mov_length

func _on_area_entered(area):
	if area is Player:
		hit_other.emit()
		print("hit other")
	elif area is Wall:
		var wall: Wall = area
		if not wall.is_burnt:
			position = prev_pos
	else:
		position = prev_pos
	
