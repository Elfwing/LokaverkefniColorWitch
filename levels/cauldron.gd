extends Node2D
var cauldronColors

func _process(_delta):
	cauldronColors = titleScreen.cauldronColors
	#updates the color of the potion in the cauldron
	mixColor()

func mixColor():
	var r = 0.0
	var g = 0.0
	var b = 0.0
	var rgb = [r, g, b]
	var colorSize = cauldronColors.size()
	#gets the avarege of all the colors mixed together
	for i in range(3):
		for j in titleScreen.cauldronColors:
			rgb[i] = rgb[i]+j[i]
	$canvasLayer/cauldron/potion.color = Color(rgb[0]/colorSize, rgb[1]/colorSize, rgb[2]/colorSize, 1)
	if not cauldronColors:
		$canvasLayer/cauldron/potion.color = Color(0.46, 0.76, 0.46, 1)
	else:
		save.saveValue("main", "cauldronColors", titleScreen.cauldronColors)
	

func _on_arrow_right_pressed():
	get_tree().change_scene_to_file("res://levels/witch.tscn")
