extends AudioStreamPlayer

var game_music = load("res://sound/music_game_wizard_hero.wav")
var menu_music = load("res://sound/music_menu.wav")
signal curse_ended

var on_menu = true

func _ready():
	play_menu()

func play_menu() -> void:
	stream = menu_music
	play()

func play_song() -> void:
	stream = game_music
	play()


func _on_finished():
	if stream == menu_music:
		play()
	else:
		print("curse ended")
		curse_ended.emit()
