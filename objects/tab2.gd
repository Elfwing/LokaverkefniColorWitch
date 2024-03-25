extends Sprite2D
var questColors = titleScreen.questColors
var quest = preload("res://objects/quest.tscn")

func _ready():
	#add quests displays
	var margin = 120
	var errorCore = 51
	var xPos
	for i in range(questColors.size()):
		var questIns = quest.instantiate()
		xPos = margin*(i-(questColors.size()-1)/2)-errorCore
		questIns.position = Vector2(xPos, -60)
		questIns.name = "quest"+str(i)
		add_child(questIns)
		get_child(i).colorPoison(i)
