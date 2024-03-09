extends Node

const NUMBER_CLOUDS = 100
var visible;

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
		cloud_sprite.position = coords[i]
		add_child(cloud_sprite)
		visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_x
	var move_y
	if visible:
		for i in range(NUMBER_CLOUDS):
			get_children()[i].position += velocities[i]


func show_clouds():
	for cloud in get_children():
		cloud.self_modulate.a = 1.0

func hide_clouds():
	for cloud in get_children():
		cloud.self_modulate.a = 0.0

func _on_flash_timer_timeout():
	show_clouds()


func _on_dark_timer_timeout():
	hide_clouds();
