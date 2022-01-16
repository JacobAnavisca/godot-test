extends Node

signal user_died
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_name: String = 'User'
var player_health: int = 100 setget set_health

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_health(value):
	player_health = value

	if player_health <= 0:
		player_health = 100
		emit_signal("user_died")

func save_game():
	var save_dict = {
		"PlayerName" : player_name,
		"PlayerHealth" : player_health
	}

	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_var(save_dict, true)
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	save_game.open("user://savegame.save", File.READ)
	var save_dict = save_game.get_var(true)

	player_name = save_dict.PlayerName
	player_health = save_dict.PlayerHealth

	save_game.close()
