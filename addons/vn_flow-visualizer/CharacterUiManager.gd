extends Cheveron

var characterLinkScene = preload("res://addons/vn_flow-visualizer/character_link.tscn")
var characterLinks: Array
@export var addButton: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	addButton.pressed.connect(_on_add_pressed);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	isOpen = !isOpen
	#for var i = 0; i < characterLinks.count(); i++:
	for item in characterLinks:
		item.visible = isOpen
	
func _on_add_pressed():
	var temp = characterLinkScene.instantiate()
	temp.visible = isOpen
	characterLinks.append(temp)
	temp.get_node("./").character_deleted.connect(_on_character_deleted)
	get_parent().add_child.call_deferred(temp)
	
func _on_character_deleted(node:Node):
	var index = characterLinks.find(node)
	characterLinks[index].queue_free()
	characterLinks.remove_at(index)
