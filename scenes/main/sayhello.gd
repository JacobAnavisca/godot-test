extends Panel

func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")
	PlayerVariables.connect("userDied", self, "playerDied")

func _on_Button_pressed():
	PlayerVariables.playerHealth -= 10
	var greeting = "HELLO %s! health at %d"
	get_node("Label").text = greeting % [PlayerVariables.playerName, PlayerVariables.playerHealth]
	PlayerVariables.save_game()

func playerDied():
	get_node("AcceptDialog").popup()
