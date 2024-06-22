extends Cheveron

var routeScene = preload("res://addons/vn_flow-visualizer/route_ui.tscn")
var routes: Array;
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
	for item in routes:
		item.visible = isOpen
	
func _on_add_pressed():
	print("adding")
	var temp = routeScene.instantiate()
	temp.visible = isOpen
	temp.get_node("./").route_deleted.connect(_on_route_deleted)
	routes.append(temp)
	get_parent().add_child.call_deferred(temp)
	
func _on_route_deleted(node:Node):
	var index = routes.find(node)
	routes[index].queue_free()
	routes.remove_at(index)
