extends Control

@export var fileDiaolog : FileDialog
@export var importType : String
@export var importButton : Button
@export var pathLabel : Label

var scenes : Array
var sceneRow = preload("res://addons/vn_flow-visualizer/scene_import_row.tscn")

signal loadSceneIntoGraph
signal deleteScene

var isImporting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	fileDiaolog.file_selected.connect(_on_file_selected)
	importButton.pressed.connect(_on_import_button_pressed)
	if importType == "scene":
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_import_button_pressed():
	fileDiaolog.visible = true
	isImporting = true
	
func _on_file_selected(path):
	if isImporting:
		var file = FileAccess.open(path,FileAccess.READ)
		var text = file.get_as_text()
		pathLabel.text = path
		pathLabel.tooltip_text = path
		if importType == "flag":
			var parsedText = JSON.parse_string(text)
			ResourceManager.flagData = {
				"data": parsedText,
				"filePath": path
			}
			print(ResourceManager.flagData)
		if importType == "variable":
			var parsedText = JSON.parse_string(text)
			ResourceManager.variableData = {
				"data":parsedText,
				"filePath": path
			}
			print(ResourceManager.variableData)
		if importType == "sound":
			var parsedText = JSON.parse_string(text)
			ResourceManager.soundData = {
				"data":parsedText,
				"filePath": path
			}
			print(ResourceManager.soundData)
		if importType == "character":
			var parsedText = JSON.parse_string(text)
			ResourceManager.characterData = {
				"data":parsedText,
				"filePath": path
			}
			print(ResourceManager.characterData)
		if importType == "scene":
			var parsedText = JSON.parse_string(text)
			ResourceManager.sceneData.append({
				"data":parsedText,
				"filePath": path
			})
			var temp = sceneRow.instantiate()
			scenes.append(temp)
			temp.sceneDeletedPressed.connect(_on_imported_scene_delete_pressed)
			temp.sceneLoadedPressed.connect(_on_imported_scene_load_pressed)
			temp.setNameLabel(parsedText.name)
			get_parent().add_child.call_deferred(temp)
			print(ResourceManager.sceneData)
	isImporting = false
	
	
func _on_imported_scene_delete_pressed(row):
	var index = scenes.find(row)
	scenes[index].queue_free()
	scenes.remove_at(index)
	pass
	
func _on_imported_scene_load_pressed(row):
	var index = scenes.find(row)
	get_node("%Graph").LoadScene(ResourceManager.sceneData[index])
	print(ResourceManager.sceneData[index])
	pass
