extends MarginContainer

@export var deleteButton : Button
@export var loadButton : Button
@export var sceneNameLabel : Label

signal sceneDeletedPressed
signal sceneLoadedPressed

# Called when the node enters the scene tree for the first time.
func _ready():
	deleteButton.pressed.connect(_on_delete)
	loadButton.pressed.connect(_on_load)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setNameLabel(name):
	sceneNameLabel.text = name

func _on_delete():
	sceneDeletedPressed.emit(self)
	
func _on_load():
	sceneLoadedPressed.emit(self)
