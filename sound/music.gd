extends AudioStreamPlayer

func _ready():
	var music = load("res://sound/music_game_wizard_hero.wav")
	play_song(music)

func play_song(music: AudioStream) -> void:
	stream = music
	play()
