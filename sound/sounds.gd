extends AudioStreamPlayer

var sounds = {
	'ouch': load('res://sound/ouch.mp3')
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
