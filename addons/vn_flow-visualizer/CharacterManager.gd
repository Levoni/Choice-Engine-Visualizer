extends Cheveron
@export var delButton : Button
var characterName : String
var imageResourceManager
var animationResourceManager
var soundResourceManager

signal item_deleted

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	imageResourceManager = get_node("CharacterMargin/ResourcesMargin/CharacterImages")
	animationResourceManager = get_node("CharacterMargin/ResourcesMargin/CharacterAnimations")
	soundResourceManager = get_node("CharacterMargin/ResourcesMargin/CharacterSounds")
	delButton.pressed.connect(_on_delete_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setName(nameString):
	characterName = nameString
	var nameLabel = get_node("ChevName/name") as Label
	nameLabel.text = nameString

func _on_delete_pressed():
	item_deleted.emit(self)
