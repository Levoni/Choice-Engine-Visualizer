extends Cheveron

var metaDataRowScene = preload("res://addons/vn_flow-visualizer/meta_data_row.tscn")
var metaDatas: Array
@export var addButton: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	addButton.pressed.connect(_on_add_button_press)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_pressed():
	isOpen = !isOpen
	#for var i = 0; i < characterLinks.count(); i++:
	for item in metaDatas:
		item.visible = isOpen

func _on_add_button_press():
	var temp = metaDataRowScene.instantiate()
	temp.visible = isOpen
	metaDatas.append(temp)
	temp.get_node("./MetaDataRowManager").metadata_deleted.connect(_on_delete_button_press)
	get_parent().add_child.call_deferred(temp)
	
func _on_delete_button_press(node:Node):
	var index = metaDatas.find(node)
	metaDatas[index].queue_free()
	metaDatas.remove_at(index)
