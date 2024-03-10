extends Node2D

func start():
	$DarkTimer.start()
	$HUD.show_message("Get ready")
	$Hero.start($HeroStartPosition.position)
	$Wizard.start($WizardStartPosition.position)
	$Music.play_song()
	$CloudManager.show_clouds()

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

func _on_dark_timer_timeout():
	$Hero.can_move = false
	$Wizard.can_move = false
	if $Hero.dead or $Wizard.dead:
		print("finished")
		$HUD.show_game_over(true)
	else:
		$FlashTimer.start()
	print("dark timer timeout")

func _on_music_curse_ended():
	$FlashTimer.stop()
	await $DarkTimer.stop()
	
	$Hero.can_move = false
	$Wizard.can_move = false
	print("finished")
	$HUD.show_game_over(false)
