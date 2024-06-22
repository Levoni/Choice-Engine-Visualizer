@tool
extends Node
class_name GraphBus


signal character_deleted(node)
signal route_deleted(node)


var graphNode = preload("res://addons/vn_flow-visualizer/graph_node_ui.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = graphNode.instantiate()
	get_parent().add_child.call_deferred(temp)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
