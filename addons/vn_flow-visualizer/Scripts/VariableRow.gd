extends DeletableRow
@export var variableName : Label
@export var variableValue : LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setName(nameString):
	variableName.text = nameString

func setValue(valueString):
	variableValue.text = valueString
