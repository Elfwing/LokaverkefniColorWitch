extends Area2D
var mousePosition = Vector2()
var startPosition
var dragging = false

func _ready():
	startPosition = position

func colorPoison(num):
	$potion.color = titleScreen.glassColors[num]


func _on_input_event(_viewport, event, _shape_idx):
	#makes it so you can dragg glass bottels around the screen
	if event.is_action_pressed("dragg"):
		get_viewport().set_input_as_handled()
		mousePosition = event.position
		dragging = true
		var glassNum = int(name.trim_prefix("glass"))
		titleScreen.bottleHolding = glassNum


func _input(event):
	if not dragging:
		return
		
	#send the bottel back to the shelf if mouse lets go
	if event.is_action_released("dragg"):
		position = startPosition
		mousePosition = Vector2()
		dragging = false
		titleScreen.bottleHolding = -1
	
	#actully moves the sprit for the glass
	if dragging and event is InputEventMouseMotion:
		position += event.position - mousePosition
		mousePosition = event.position
		var glassNum = int(name.trim_prefix("glass"))
		colorPoison(glassNum)
