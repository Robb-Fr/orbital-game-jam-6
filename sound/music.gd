extends AudioStreamPlayer

var music: AudioStream

func _ready():
	music = load("res://sound/music_game_wizard_hero.wav")

func play_song() -> void:
	stream = music
	play()
