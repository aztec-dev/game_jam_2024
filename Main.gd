extends Node
var alchemyRef = preload("res://Alchemy/PotionMakingHud.tscn").instantiate()

func _ready():
	$Alchemy.hide()
	$ExitButton.hide()

func play_game():
	$MainMenuHud.hide()
	$Alchemy.show()
	$ExitButton.show()


func _on_alchemy_pressed():
	add_child(alchemyRef)

func _on_exit_button_pressed():
	remove_child(alchemyRef)

