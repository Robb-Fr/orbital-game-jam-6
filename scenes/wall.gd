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
		$CollisionShape2D.set_deferred("disabled", true)
	
