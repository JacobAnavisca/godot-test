extends Node


var master_volume: float = 1.0
var music_volume: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	load_settings()


func save_settings():
	var save_dict = {
		"MasterVolume" : master_volume,
		"MusicVolume" : music_volume
	}

	var save_settings = File.new()
	save_settings.open("user://savesettings.save", File.WRITE)
	save_settings.store_var(save_dict, true)
	save_settings.close()

func load_settings():
	var save_settings = File.new()
	if not save_settings.file_exists("user://savesettings.save"):
		return # Error! We don't have a save to load.

	save_settings.open("user://savesettings.save", File.READ)
	var save_dict = save_settings.get_var(true)

	master_volume = save_dict.MasterVolume
	music_volume = save_dict.MusicVolume

	save_settings.close()
