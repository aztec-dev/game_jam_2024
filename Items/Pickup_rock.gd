extends Area2D
@export var resource_type : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(area : Area2D):
	var inventory = area.find_child("Inventory")
	
	if(inventory):
		inventory.add_resources(resource_type, 1)
		queue_free()



