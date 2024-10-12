extends Control

@export var lineedit: LineEdit
var List: Array[ArrayListItem]
var listItemScene = preload("res://Scenes/ArrayListItem.tscn")

#For Debugging Purpouses, we are creating a default list of items as soon as the program loads. Comment out from final build, save for future debugging purpouses.
#func _ready():
	#var values: Array[String] = ["Item 1","Item 2","Item 3","Item 4","Item 5","Item 6","Item 7","Item 8","Item 9","Item 10"]
	#for i in values:
		#appendList(i)


func appendList(text=""):
	var listItem: ArrayListItem = listItemScene.instantiate()
	listItem.text = text
	$ListContainer.add_child(listItem)
	List.append(listItem)
	lineedit.clear()
	lineedit.grab_focus()
	print("Item Added", List) #debugging Print
	#The below connects the signal from the delete item button in the ArrayListItem Script to this script.
	listItem.deleteListItem.connect(deleteItem)

func AddItem():
	appendList(lineedit.text)

func deleteItem(listItem: ArrayListItem):
	#Delete the item from the "List" array and then delete from the scene with queue_free
	List.erase(listItem)
	print("Item Removed", List) #debugging Print
	listItem.queue_free()

func _on_spin_button_pressed():
	#When the SpinButton is pressed, we assign a random item from the array to the chosenItem String and then assign that to the Label which displays the random item.
	#This function will need to change and evolve to accomodate the spinning animation once implimented.
	#Added if statement to check if list of items is empty, and if empty do nothing otherwise app crashes.
	if List.is_empty():
		pass
	else:
		var chosenItem: String = List.pick_random().text
		$SpinContainer/RandomItem.text = chosenItem
