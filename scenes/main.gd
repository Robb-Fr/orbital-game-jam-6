extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$DarkTimer.start()
	#$Hero.visible = false
	#$Wizard.visible = false
	#$Clouds.visible = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_flash_timer_timeout():
	$Clouds.visible = true
	$Hero.visible = false
	$Wizard.visible = false
	$DarkTimer.start()
	print("flash timer timeout")


func _on_dark_timer_timeout():
	$Clouds.visible = false
	$Hero.visible = true
	$Wizard.visible = true
	$FlashTimer.start()
	print("dark timer timeout")
	
