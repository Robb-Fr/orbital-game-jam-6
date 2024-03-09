extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$DarkTimer.start()
	$Hero.visible = false
	$Wizard.visible = false
	$Clouds.visible = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_flash_timer_timeout():
	$Clouds.visible = true
	$Hero.visible = false
	$Wizard.visible = false
	$Hero.can_move = true
	$Wizard.can_move = true
	$DarkTimer.start()
	print("flash timer timeout")


func _on_dark_timer_timeout():
	$Clouds.visible = false
	$Hero.visible = true
	$Wizard.visible = true
	$Hero.can_move = false
	$Wizard.can_move = false
	if $Hero.dead or $Wizard.dead:
		print("finished")
	else:
		$FlashTimer.start()
	print("dark timer timeout")
	
