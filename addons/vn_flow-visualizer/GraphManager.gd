extends GraphEdit

var graphNode = preload("res://addons/vn_flow-visualizer/graph_node_ui.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var temp:GraphNode = graphNode.instantiate()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func LoadScene(scene):
	var events = scene.data.events
	var index = 0
	for e in events:
		var temp:GraphElement = graphNode.instantiate()
		print(temp)
		var position = Vector2(400 * index,temp.get_position_offset().y)
		temp.set_position_offset(position)
		self.add_child(temp)
		index += 1

