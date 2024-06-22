extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	clear()
	for item in ResourceManager.metadataKeys:
		add_item(item)
	add_item("dynamic")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
