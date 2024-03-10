extends CanvasLayer

@export var ui_grid_scene: PackedScene
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Hero Wins")
	await $MessageTimer.timeout
	
	$Message.text = "Hero catch the Wizard"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(32):
		var new_grid = ui_grid_scene.instantiate()
		new_grid.position = Vector2(36*i, 36*i)
		add_child(new_grid)
		move_child(new_grid, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_message_timer_timeout():
	$Message.hide()
