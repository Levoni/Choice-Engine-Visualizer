extends Cheveron
@export var deleteButton: Button

signal character_deleted

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	deleteButton.pressed.connect(_on_delete_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_delete_pressed():
	character_deleted.emit(self)
