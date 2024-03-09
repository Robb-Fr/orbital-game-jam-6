extends Area2D
class_name Player

@export var mov_length = 36
@export var speed = 300
var prev_pos: Vector2
var moving: bool
var target: Vector2
signal hit_other

func get_input() -> Vector2:
	return Vector2.ZERO

func _ready():
	prev_pos = position
	moving = false
	target = position

func _process(delta):
	if not moving:
		var direction = get_input()
		if direction.x != 0 and direction.y != 0:
				direction.y = 0
				
		if direction != Vector2.ZERO:
			prev_pos = position
			moving = true
			target = position + direction * mov_length
		
func _physics_process(delta):
	position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		position += position.direction_to(target) * speed * delta
	else:
		position = target
		moving = false
		
func _on_area_entered(area):
	if area is Player:
		hit_other.emit()
		print("hit other")
	elif area is Wall:
		var wall: Wall = area
		if not wall.is_burnt or self is Wizard:
			target = prev_pos
	else:
		target = prev_pos
		
		
		
	
