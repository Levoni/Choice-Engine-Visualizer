extends Control
class_name DeletableRow
@export var delButton : Button
signal item_deleted

# Called when the node enters the scene tree for the first time.
func _ready():
	delButton.pressed.connect(_on_del_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_del_pressed():
	item_deleted.emit(self)
