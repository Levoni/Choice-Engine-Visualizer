@tool
extends Control
class_name TabContainerControl
@export var addButton:Button
@export var nameInput:LineEdit
@export var resourcePath: String
@export var Scene : Resource


var characters:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	addButton.pressed.connect(_on_add_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_add_pressed():
	if nameInput.text != "":
		var temp = Scene.instantiate()
		characters.append(temp)
		temp.item_deleted.connect(_on_item_deleted)
		self.add_child.call_deferred(temp)
		setCustomAttributes(temp)
		
func _on_item_deleted(node):
	var index = characters.find(node)
	characters[index].queue_free()
	characters.remove_at(index)
	pass
	
func setCustomAttributes(instance):
	pass
