extends Node2D


func _ready():
	modeSwitch(titleScreen.modes[1])
	$scoreTag/scoreAmount.text = str(titleScreen.score)
	$coinTag/coinAmount.text = str(titleScreen.coins)
	#conncets signals to mode buttons
	for i in range(get_children().size()):
		if i > 1 and i != get_children().size()-1:
			get_child(i).connect("pressed", modeSwitch.bind(i-2))

func _process(_delta):
	#updates score and coin tags
	$scoreTag/scoreAmount.text = str(titleScreen.score)
	$coinTag/coinAmount.text = str(titleScreen.coins)

func modeSwitch(num):
	#lets you can modes
	if num <= 1:
		titleScreen.modes[0] = num
	else:
		#shows which difficulty is active
		var inactive = load("res://assets/inactive.png")
		var active = load( "res://assets/active.png")
		for i in range(3):
			if i != num-2:
				get_child(i+4).texture_normal = inactive
			else:
				get_child(i+4).texture_normal = active
		titleScreen.modes[1] = num


func _on_help_button_button_down():
	get_tree().change_scene_to_file("res://levels/tutorial.tscn")
