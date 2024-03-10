extends Node2D

signal ended_replay
signal hero_wins

func start():
	for node in get_children():
		if node is Wall:
			var wall: Wall = node
			wall.unburn()
	$Hero.start($HeroStartPosition.position)
	$Wizard.start($WizardStartPosition.position)
	$Hero.can_move = false
	$Wizard.can_move = false
	for m in [Vector2.RIGHT, Vector2.RIGHT, Vector2.RIGHT, Vector2.RIGHT, Vector2.RIGHT, Vector2.RIGHT, Vector2.DOWN, Vector2.DOWN, Vector2.RIGHT, Vector2.RIGHT, Vector2.DOWN, Vector2.DOWN, Vector2.DOWN]:
		$Hero.move(m)
		await get_tree().create_timer(0.25).timeout
	for m in [Vector2.UP, Vector2.UP, Vector2.UP, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.UP, Vector2.LEFT, Vector2.LEFT, Vector2.LEFT, Vector2.UP, Vector2.UP]:
		$Wizard.move(m)
		await get_tree().create_timer(0.15).timeout
	await get_tree().create_timer(1).timeout
	$HUD.show_message("Get ready")
	await get_tree().create_timer(3).timeout
	$DarkTimer.start()
	$Hero.start($HeroStartPosition.position)
	$Wizard.start($WizardStartPosition.position)
	$Music.play_song()
	$CloudManager.show_clouds()
	for node in get_children():
		if node is Wall:
			var wall: Wall = node
			wall.unburn()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_flash_timer_timeout():
	$Hero.can_move = true
	$Wizard.can_move = true
	$DarkTimer.start()
	print("flash timer timeout")

func game_over(hero_wins: bool):
	$HUD.show_game_over(hero_wins)
	await get_tree().create_timer(3).timeout
	$Music.play()
	var hero_moves = $Hero.played_moves
	var wizard_moves = $Wizard.played_moves
	$Hero.start($HeroStartPosition.position)
	$Wizard.start($WizardStartPosition.position)
	for node in get_children():
		if node is Wall:
			var wall: Wall = node
			wall.unburn()
	$Hero.replay_moves(hero_moves)
	$Wizard.replay_moves(wizard_moves)
	ended_replay.emit()

func _on_dark_timer_timeout():
	$Hero.can_move = false
	$Wizard.can_move = false
	if $Hero.dead or $Wizard.dead:
		print("finished")
		$Music.stop()
		hero_wins.emit()
		game_over(true)
	else:
		$FlashTimer.start()
	print("dark timer timeout")

func _on_music_curse_ended():
	$FlashTimer.stop()
	$DarkTimer.stop()
	$CloudManager.hide_clouds()
	
	$Hero.can_move = false
	$Wizard.can_move = false
	print("finished")
	game_over(false)
