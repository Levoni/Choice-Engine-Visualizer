extends TabBar


# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceManager._test_occured.connect(_on_test)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_test(testString):
	print("success")
	print(testString)

func _on_tab_changed(tab):
	ResourceManager._test_occured.emit("king")
	get_node("../characterContainer").visible = false
	get_node("../flagContainer").visible = false
	get_node("../variableContainer").visible = false
	get_node("../soundContainer").visible = false
	get_node("../importContainer").visible = false
	if tab == 1:
		get_node("../characterContainer").visible = true
	if tab == 2:
		get_node("../flagContainer").visible = true
	if tab == 3:
		get_node("../variableContainer").visible = true
	if tab == 4:
		get_node("../soundContainer").visible = true
	if tab == 5:
		get_node("../importContainer").visible = true
	pass # Replace with function body.
