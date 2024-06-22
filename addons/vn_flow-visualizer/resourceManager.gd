extends Node
class_name ResourceManager

static var metadataKeys
static var typeDefaults

static var flagData
static var variableData
static var soundData
static var characterData
static var sceneData = []

static var _test_occured : Signal = (func():
	(ResourceManager as Object).add_user_signal("_test_occured")
	# Now return a reference to the signal we just defined.
	return Signal(ResourceManager, "_test_occured")
	pass).call()

# Called when the node enters the scene tree for the first time.
func _ready():
	#TODO: Read files (would actually be done on project load or file import
	#TODO: Store them where they can be easily retreived	
	var metaFile = FileAccess.open("res://addons/vn_flow-visualizer/EditorDefaults/meta_data_key_defaults.json",FileAccess.READ)
	var data = JSON.parse_string(metaFile.get_as_text())
	metadataKeys = data

	var typeFile = FileAccess.open("res://addons/vn_flow-visualizer/EditorDefaults/type_defaults.json",FileAccess.READ)
	var typeData = JSON.parse_string(typeFile.get_as_text())
	typeDefaults = typeData


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
