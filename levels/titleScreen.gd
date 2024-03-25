extends Node2D
#these varibles are autoloaded and can be used in other files
var witchColor = ranColor()
var tabPlace = 0
var coins = 1000 
var score = 0
var flowerColors = {"white": [1, 1, 1], "black": [0, 0, 0], "red": [1, 0, 0], "green": [0, 1, 0], "blue": [0, 0, 1], "yellow": [1, 1, 0], "cyan": [0, 1, 1], "magenta": [1, 0, 1]}
var flowers = {}
var cauldronColors = []
var questColors = []
var glassColors = []
var bottleHolding = -1
var modes = [0, 2]

# Called when the node enters the scene tree for the first time.
func _ready():
	#adding color
	for i in flowerColors:
		flowers[i] = 0
	for i in range(5):
		questColors.append(ranColor())
		glassColors.append(Color(0, 0, 0, 0))

#compers to color and makes a score used in both with witch color and quest
func findScore(trueColor, guessColor, margin, multi):
	var change = 2**(titleScreen.modes[1]-2)
	margin = float(margin)
	margin /= change
	multi *= change
	var total = 0
	var addScore = 0
	for i in range(3):
		total += abs(trueColor[i] - guessColor[i])
	if total < margin:
		addScore = (pow((margin - total)/(margin), 2)*multi)
	else:addScore = 0
	return round(addScore)

func ranColor():
	var aColor = Color(randf(), randf(), randf(), 1)
	return aColor

func _on_load_button_down():
	#load value that get saved
	titleScreen.score = save.loadValue("main", "score", 0)
	titleScreen.coins = save.loadValue("main", "coins", 0)
	titleScreen.flowers = save.loadValue("main", "flowers", 0)
	titleScreen.cauldronColors = save.loadValue("main", "cauldronColors", 0)
	titleScreen.glassColors = save.loadValue("main", "glassColors", 0)
	get_tree().change_scene_to_file("res://levels/witch.tscn")

func _on_new_button_down():
	#reset saved value
	save.saveValue("main", "score", titleScreen.score)
	save.saveValue("main", "coins", titleScreen.coins)
	save.saveValue("main", "flowers", titleScreen.flowers)
	save.saveValue("main", "cauldronColors", titleScreen.cauldronColors)
	save.saveValue("main", "glassColors", titleScreen.glassColors)
	get_tree().change_scene_to_file("res://levels/witch.tscn")
