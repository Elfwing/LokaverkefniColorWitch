extends Area2D
var questMode = 0
var currentMode = 0


func _process(_delta):
	#look for if quest mode has changed and update if needs
	questMode = titleScreen.modes[0]
	if questMode != currentMode:
		currentMode = questMode
		if currentMode == 0:
			$QuestPaperNumber.visible = false
		else:
			$QuestPaperNumber.visible = true
		colorPoison(int(name.trim_prefix("quest")))

func colorPoison(num):
	#updates colors in quest
	if titleScreen.modes[0] == 0:
		$QuestPaperPotion/potion.color = titleScreen.questColors[num]
	else:
		for i in range(3):
			$QuestPaperNumber.get_child(i).text = str(int(titleScreen.questColors[num][i]*1000))

func _on_mouse_entered():
	#finds if mouse is inside quest and updates the score
	var bottleHolding = titleScreen.bottleHolding
	var colorHolding = titleScreen.glassColors[bottleHolding]
	var questNum = int(name.trim_prefix("quest"))
	var colorEntered = titleScreen.questColors[questNum]
	if bottleHolding != -1:
		if colorHolding[3] == 1:
			var questScore = titleScreen.findScore(colorHolding, colorEntered, 0.5, 1000)
			titleScreen.score += questScore
			save.saveValue("main", "score", titleScreen.score)
			titleScreen.questColors[questNum] = titleScreen.ranColor()
			titleScreen.glassColors[bottleHolding] = Color(0, 0, 0, 0)
			colorPoison(questNum)
			bottleHolding = -1
	save.saveValue("main", "glassColors", titleScreen.glassColors)
