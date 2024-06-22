extends Cheveron

var soundScene = preload("res://addons/vn_flow-visualizer/sound_ui.tscn")
var sounds: Array
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
	for item in sounds:
		item.visible = isOpen
	
func _on_add_pressed():
	var temp = soundScene.instantiate()
	temp.visible = isOpen
	sounds.append(temp)
	temp.get_node("./").sound_deleted.connect(_on_sound_deleted)
	get_parent().add_child.call_deferred(temp)
	
func _on_sound_deleted(node:Node):
	var index = sounds.find(node)
	sounds[index].queue_free()
	sounds.remove_at(index)
