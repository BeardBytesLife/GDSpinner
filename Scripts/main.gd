extends Control

@export var lineedit: LineEdit
var List: Array[ArrayListItem]
var listItemScene = preload("res://Scenes/ArrayListItem.tscn")

func appendList(text=""):
	var listItem: ArrayListItem = listItemScene.instantiate()
	listItem.text = text
	$VBoxContainer.add_child(listItem)
	List.append(listItem)
	lineedit.clear()
	lineedit.grab_focus()
	print(List) #debugging Print

func AddItem():
	appendList(lineedit.text)
