extends Node

const NUMBER_CLOUDS = 300
var clouds_visible = false
enum FadingState {IN, OUT, NONE}

var fading_state = FadingState.NONE
var curr_self_modulate = 0.0;
var velocities = []
var coords = []

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	coords.resize(NUMBER_CLOUDS)
	velocities.resize(NUMBER_CLOUDS)
	for i in range(NUMBER_CLOUDS):
		coords[i] = Vector2(rng.randi_range(0, 1200), rng.randi_range(0, 1200))
		velocities[i] = Vector2(rng.randf_range(-1,1), rng.randf_range(-1,1))
		var cloud_sprite = Sprite2D.new()
		cloud_sprite.texture = load("res://art/cloud.png")
		cloud_sprite.position = coords[i] + Vector2.ZERO
		cloud_sprite.self_modulate.a = curr_self_modulate
		add_child(cloud_sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_x
	var move_y
	
	print(curr_self_modulate)
	
	if fading_state != FadingState.NONE:
		var sign = 1.0 if fading_state == FadingState.IN else -1.0
		curr_self_modulate = clamp(curr_self_modulate + delta * sign, 0.0, 1.0)
		for i in range(NUMBER_CLOUDS):
			get_children()[i].self_modulate.a = curr_self_modulate
		if curr_self_modulate == 0.0 or curr_self_modulate == 1.0:
			fading_state = FadingState.NONE
	if 0.0 < curr_self_modulate:
		for i in range(NUMBER_CLOUDS):
			get_children()[i].position += velocities[i]


func show_clouds():
	fading_state = FadingState.IN
	for i in range(NUMBER_CLOUDS):
		get_children()[i].position = coords[i] + Vector2.ZERO

func hide_clouds():
	fading_state = FadingState.OUT

func _on_flash_timer_timeout():
	show_clouds()


func _on_dark_timer_timeout():
	hide_clouds();


