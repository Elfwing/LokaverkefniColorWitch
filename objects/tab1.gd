extends Sprite2D
var place
var userGuess = []
var inputCount
var currentScene
func _ready():
	inputCount = get_children().size()
	currentScene = get_tree().current_scene.name
	#sets upp tab1 one based on the current sceen
	if currentScene == "witch":
		$witchText.text = "Try and guess the color, the closer you are the more money I'll give you"
		for i in range(1, inputCount):
			get_child(i).visible = true
			get_child(i).connect("focus_entered", setPlace.bind(i))
	else:
		$witchText.text = "Please go talk to the witch to get a question"
		for i in range(1, inputCount):
			get_child(i).visible = false
	
func _process(_delta):
	#check guess and gives you coins
	if Input.is_action_just_pressed("enterGuess") and currentScene == "witch":
		userGuess = []
		var witchColor = titleScreen.witchColor
		var realNum = true
		for i in range(1, inputCount):
			if not int(get_child(i).text):
				$witchText.text = "Please enter only real numbers between 1 and 999"
				realNum = false
			else:
				userGuess.append(float(get_child(i).text)/1000)
		if realNum:
			for i in range(1, inputCount):
				get_child(i).text = ""
			var guessScore = titleScreen.findScore(witchColor, userGuess, 1, 1000)
			titleScreen.coins += guessScore
			save.saveValue("main", "coins", titleScreen.coins)
			#text based on how close you are
			if guessScore == 0:$witchText.text = "Nice try, lets try a different color"
			elif guessScore > 500: $witchText.text = "Wow, your great at this, here is a new color"
			else:$witchText.text = "Good job, here is a new color"
			titleScreen.witchColor = Color(randf(), randf(), randf(), 1)
	
	#lets you press tab to change what input your on
	elif Input.is_action_just_pressed("changeLineEdit"):
		place += 1
		if place == inputCount:
			place = 1
		get_child(place).grab_focus()
	
#called in signal
func setPlace(num):
	place = num

