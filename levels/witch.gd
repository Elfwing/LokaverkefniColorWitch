extends Node2D


func _process(_delta):
	#lets you enter a guess
	if Input.is_action_just_released("enterGuess"):
		$canvasLayer/witchColor.displayColor = titleScreen.witchColor
		
func _on_arrow_left_pressed():
	get_tree().change_scene_to_file("res://levels/cauldron.tscn")

func _on_arrow_right_pressed():
	get_tree().change_scene_to_file("res://levels/store.tscn")

