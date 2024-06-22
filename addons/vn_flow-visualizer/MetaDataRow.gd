extends HSplitContainer

@export var lineKeyEdit:LineEdit
@export var optionKeyEdit:OptionButton
@export var lineValueEdit:LineEdit
@export var deleteButton:Button

signal metadata_deleted

# Called when the node enters the scene tree for the first time.
func _ready():
	lineKeyEdit.visible = false
	optionKeyEdit.visible = true
	lineValueEdit.visible = true
	optionKeyEdit.item_selected.connect(_on_selction_change)
	lineKeyEdit.text_changed.connect(_on_text_change)
	deleteButton.pressed.connect(_on_delete_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_selction_change(index):
	if optionKeyEdit.get_item_text(index) == "dynamic":
		optionKeyEdit.visible = false
		lineKeyEdit.visible = true
		lineKeyEdit.text = "temp"

func _on_text_change(text):
	if text == "text" || text == "name":
		optionKeyEdit.selected = -1
		optionKeyEdit.visible = true
		lineKeyEdit.visible = false
		
func _on_delete_pressed():
	metadata_deleted.emit(get_parent())
