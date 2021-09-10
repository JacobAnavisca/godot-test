extends Node

signal userDied
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerName: String = 'User'
var playerHealth: int = 100 setget setHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setHealth(value):
	playerHealth = value

	if playerHealth <= 0:
		playerHealth = 100
		emit_signal("userDied")

func save_game():
	var save_dict = {
		"playerName" : playerName,
		"playerHealth" : playerHealth
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

	playerName = save_dict.playerName
	playerHealth = save_dict.playerHealth

	save_game.close()
