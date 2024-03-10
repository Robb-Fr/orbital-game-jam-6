extends Area2D
class_name Player

@export var mov_length = 36
@export var speed = 300
var prev_pos: Vector2
var moving: bool
var can_move: bool = true
var target: Vector2
var dead: bool = false
signal hit_other

func get_input() -> Vector2:
	return Vector2.ZERO

func start(pos: Vector2 = position):
	position = pos
	prev_pos = pos
	moving = false
	target = pos
	visible = false
	dead = false

func _ready():
	start()
	visible = true

func _process(delta):
	if not moving and not dead and can_move:
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
		# prevent moving again
		dead = true
	elif area is Wall:
		var wall: Wall = area
		if not wall.is_burnt or self is Wizard:
			target = prev_pos
	else:
		target = prev_pos
		
