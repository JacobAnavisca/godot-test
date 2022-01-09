extends MarginContainer

onready var _master_bus := AudioServer.get_bus_index("Master")
onready var _music_bus := AudioServer.get_bus_index("Music")

onready var _master_slider: HSlider = get_node("VBoxContainer/MasterVolumeContainer/MasterVolumeSlider")
onready var _music_slider: HSlider = get_node("VBoxContainer/MusicVolumeContainer/MusicVolumeSlider")

onready var _master_stream: AudioStream = preload("res://assets/main_menu/master.mp3")
onready var _music_stream: AudioStream = preload("res://assets/main_menu/music.mp3")
onready var _test_player: AudioStreamPlayer = $VolumeTestPlayer

var master_slider_load_changed := false
var music_slider_load_changed := false

func _ready() -> void:
	print("game settings")
	print(GameSettings.masterVolume)
	print(GameSettings.musicVolume)
	_master_slider.value = GameSettings.masterVolume
	_music_slider.value = GameSettings.musicVolume
	AudioServer.set_bus_volume_db(_master_bus, linear2db(GameSettings.masterVolume))
	AudioServer.set_bus_volume_db(_music_bus, linear2db(GameSettings.musicVolume))

#func _on_MasterVolumeSlider_value_changed(value: float):
#	print(value)
#	AudioServer.set_bus_volume_db(_bus, linear2db(value))

func _on_VolumeSlider_value_changed(value: float, bus: String):
	var load_change = "%s_slider_load_changed" % bus.to_lower()
	if self[load_change]:
		var bus_variable = "_%s_bus" % bus.to_lower()
		var stream_variable = "_%s_stream" % bus.to_lower()
		AudioServer.set_bus_volume_db(self[bus_variable], linear2db(value))

		if _test_player.stream != self[stream_variable]:
			_test_player.stream = self[stream_variable]
			_test_player.bus = bus

		if !_test_player.playing:
			_test_player.play()

		print(AudioServer.get_bus_volume_db(_master_bus))
		print(AudioServer.get_bus_volume_db(_music_bus))
	else:
		self[load_change] = true


func _on_DoneButton_pressed():
	if !_test_player.playing:
		_test_player.stop()
	print("I've been clicked D:")
	GameSettings.masterVolume = _master_slider.value
	GameSettings.musicVolume = _music_slider.value
	GameSettings.save_settings()
	print("game settings")
	print(GameSettings.masterVolume)
	print(GameSettings.musicVolume)
	get_tree().change_scene("res://scenes/menu/MainMenu.tscn")


#func _on_VolumeSlider_gui_input(event, name: String):
#	var slider_variable = "_%s_slider" % name.to_lower()
#	var slider_value: float = self[slider_variable].value
#	var bus_variable = "_%s_bus" % name.to_lower()
#	var stream_variable = "_%s_stream" % name.to_lower()
#	AudioServer.set_bus_volume_db(self[bus_variable], linear2db(slider_value))
#
#	if _test_player.stream != self[stream_variable]:
#		_test_player.stream = self[stream_variable]
#		_test_player.bus = name
#
#	if !_test_player.playing:
#		_test_player.play()
#
#	print(AudioServer.get_bus_volume_db(_master_bus))
#	print(AudioServer.get_bus_volume_db(_music_bus))
