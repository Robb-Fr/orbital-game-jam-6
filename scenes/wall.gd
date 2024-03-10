extends Area2D
class_name Wall

var is_burnt = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if area is Hero:
		$AnimatedSprite2D.play("hidden")
		set_deferred("is_burnt", true)
	elif area is Wizard:
		$AnimatedSprite2D.play("visible")
		set_deferred("is_burnt", false)

func _on_animated_sprite_2d_animation_changed():
	if z_index == 0:
		z_index = -1
	else:
		z_index = 0
