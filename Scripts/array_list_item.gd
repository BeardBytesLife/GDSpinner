class_name ArrayListItem extends HBoxContainer

@export var label: Label

var text: String:
	set(value):
		text = value
		label.text = value
