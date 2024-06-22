extends Cheveron
@export var addButton : Button
@export var addNode : Control
var controlScene = preload("res://addons/vn_flow-visualizer/UI/character_resource_ui.tscn")


var resourceArray : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	addButton.pressed.connect(_on_add_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_add_pressed():
	var temp = controlScene.instantiate()
	temp.resource_deleted.connect(_on_delete)
	resourceArray.append(temp)
	addNode.add_child.call_deferred(temp)
	pass
	
func _on_delete(node):
	var index = resourceArray.find(node)
	resourceArray[index].queue_free()
	resourceArray.remove_at(index)
	pass
