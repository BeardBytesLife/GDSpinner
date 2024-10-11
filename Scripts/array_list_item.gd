class_name ArrayListItem extends HBoxContainer

@export var label: Label
#Emitting the "delete" button signal to the rest of the program.
signal deleteListItem(ArrayListItem)

var text: String:
	set(value):
		text = value
		label.text = value

#This takes the signal sent by the button, and sends it to the signal "deleteListItem" for retransmition to the rest of the program.
func DeleteButtonPressed():
	deleteListItem.emit(self)
