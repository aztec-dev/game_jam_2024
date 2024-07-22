extends Node2D

const slot_class = preload("res://Alchemy/Slot.gd")
@onready var alchemy_slots = $GridContainer
var holding_item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for alch_slot in alchemy_slots.get_children():
		alch_slot.gui_input.connect(slot_gui_input.bind(alch_slot))

func slot_gui_input(event : InputEvent, slot : slot_class):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					slot.put_into_slot(holding_item)
					holding_item = null
				else:
					var temp_item = slot.item
					slot.pick_from_slot()
					temp_item.global_position = event.global_position
					slot.put_into_slot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pick_from_slot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
				
				
