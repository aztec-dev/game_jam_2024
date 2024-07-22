extends Button

var alchemy_reference = preload("res://Alchemy/alchemy.tscn").instantiate()

func _on_pressed():
	var parent = find_parent("World")
	parent.add_child(alchemy_reference)
