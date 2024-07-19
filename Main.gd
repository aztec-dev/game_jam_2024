extends Node
var alchemyRef = preload("res://Alchemy/PotionMakingHud.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func play_game():
	$MainMenuHud.hide()
	add_child(alchemyRef)
