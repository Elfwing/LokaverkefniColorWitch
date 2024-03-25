extends ColorRect

var displayColor = titleScreen.witchColor

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	color = displayColor
