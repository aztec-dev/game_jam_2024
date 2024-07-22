extends TextureRect

@onready var parent = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_texture = parent.resource_type.texture
	texture = new_texture
	
