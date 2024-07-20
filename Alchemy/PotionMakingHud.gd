extends Node2D
signal exit

const SlotClass = preload("res://Alchemy/Slot.gd")
@onready var inventory_slots = $GridContainer
var holding_item = null

func _ready():
	#self.MainHUD.connect(get_parent()._on_exit_pressed)
	for inv_slot in inventory_slots.get_children():
		inv_slot.gui_input.connect(slot_gui_input.bind(inv_slot))
		
func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item: # Place
					slot.putIntoSlot(holding_item)
					holding_item = null
				else: # Swap
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()




func _on_button_pressed():
	$Label.text = "Mixed"
	pass # Replace with function body.




func _on_exit_pressed():
	#$".".queue_free()
	exit.emit()
