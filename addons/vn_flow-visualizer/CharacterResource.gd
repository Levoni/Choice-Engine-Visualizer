extends Cheveron
@export var deleteButton : Button
@export var header : Label

signal resource_deleted

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	deleteButton.pressed.connect(_on_delete_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setHeader(headerString):
	header.text = headerString
	
func _on_delete_pressed():
	resource_deleted.emit(self)
