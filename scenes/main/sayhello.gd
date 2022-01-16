extends Panel

func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")
	PlayerVariables.connect("user_died", self, "player_died")

func _on_Button_pressed():
	PlayerVariables.player_health -= 10
	var greeting = "HELLO %s! health at %d"
	get_node("Label").text = greeting % [PlayerVariables.player_name, PlayerVariables.player_health]
	PlayerVariables.save_game()

func player_died():
	get_node("AcceptDialog").popup()
