@tool
extends Control
class_name Cheveron
@export var button: Button
@export var hideBox: Control

var isOpen:bool = false

static var instances = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	button.pressed.connect(_on_pressed);
	instances += 1
	print(instances)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pressed():
	isOpen = !isOpen
	hideBox.visible = isOpen

static func test():
	print("test")
