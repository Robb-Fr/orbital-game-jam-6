extends AudioStreamPlayer

var sounds = {
	'ouch': load('res://sound/ouch.mp3'),
	'woosh': load('res://sound/woosh.wav'),
	'hsoow': load("res://sound/hsoow.wav"),
	'jingle_hero': load("res://sound/jingle_hero.wav"),
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_sound(sound_name):
	stream = sounds[sound_name]
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hero_hit_other():
	play_sound('ouch')
	
func _on_flash_timer_timeout():
	play_sound('hsoow')

func _on_dark_timer_timeout():
	play_sound('woosh')

func _on_main_hero_wins():
	await get_tree().create_timer(1).timeout
	play_sound('jingle_hero')
