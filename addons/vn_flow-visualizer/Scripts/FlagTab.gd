extends TabContainerControl


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setCustomAttributes(instance):
	instance.setName(nameInput.text)
	pass
