extends Sprite2D
var page = 0
#texts in tutorial
var texts = [
	"These are the basic RGB colors. (1000, 0, 0) is the first red one, (0, 1000, 0) is next and is the bright green one, finally (0, 0, 1000) which is blue",
	"These are colors where RGB values have two values at max, (1000, 1000, 0) yellow, (0, 1000, 1000) cyan and finally (1000, 0, 1000) which is magenta",
	"To make black you would use (0, 0, 0) and for white you would use (1000, 1000, 1000),  here the last color is (500, 500, 500) a gray color, perfect grays are just three of the same value",
	"A light gray color has bigger numbers like (800, 800, 800) and a darker gray has smaller numbers like (200, 200, 200) some colors look gray but have little of another color like (200, 200, 250)",
	"To make saturated colors one value is 0 and the another is 1000, here we have (0, 500, 1000) a blue cyan, (500, 0, 1000) a purple, and (1000, 0, 500) a bright pink",
	"Here we can see what happens when shifting the value that isn't 0, (1000, 250, 0) makes a red-orange, (1000, 500, 0) make a bright orange, and (1000, 750, 0) makes a yellow-orange",
	"To make colors lighter we simply increase the small values, like (500, 1000, 500) makes a light green, (1000, 1000, 800) makes a very light magenta, and (1000, 750, 500) makes a light orange",
	"To make colors darker we simply decrease the large values, like (0, 500, 0) makes a dark green, (200, 200, 0) makes a very dark magenta, and (500, 250, 0) makes a dark orange",
	"Muted color you do both at the same time, like a (250, 750, 250) is a muted green, (600, 600, 400) very muted magenta and (750, 500, 250) a muted orange"
]
#colr example for the tutoriol
var exampleColors = [
[Color(1, 0, 0, 1), Color(0, 1, 0, 1), Color(0, 0, 1, 1)], 
[Color(1, 1, 0, 1), Color(0, 1, 1, 1), Color(1, 0, 1, 1)], 
[Color(0, 0, 0, 1), Color(1, 1, 1, 1), Color(0.5, 0.5, 0.5, 1)],
[Color(0.8, 0.8, 0.8, 1), Color(0.2, 0.2, 0.2, 1), Color(0.2, 0.2, 0.25, 1)],
[Color(0, 0.5, 1, 1), Color(0.5, 0, 1, 1), Color(1, 0, 0.5, 1)], 
[Color(1, 0.25, 0, 1), Color(1, 0.5, 0, 1), Color(1, 0.75, 0, 1)], 
[Color(0.5, 1, 0.5, 1), Color(1, 0.8, 1, 1), Color(1, 0.75, 0.5, 1)],
[Color(0, 0.5, 0, 1), Color(0.2, 0, 0.2, 1), Color(0.5, 0.25, 0, 1)],
[Color(0.25, 0.75, 0.25, 1), Color(0.6, 0.4, 0.6, 1), Color(0.75, 0.5, 0.25, 1)]
]
var max = texts.size()-1

func _ready():
	loadPage()

func _on_arrow_left_button_down():
	page -= 1
	if page == 0:
		$arrowLeft.visible = false
	if page == max-1:
		$arrowRight.visible = true
	loadPage()

func _on_arrow_right_button_down():
	page += 1
	if page == max:
		$arrowRight.visible = false
	if page == 1:
		$arrowLeft.visible = true
	loadPage()

func loadPage():
	$RichTextLabel.text = texts[page]
	for i in range(3):
		get_child(i+2).get_child(0).color = exampleColors[page][i]


func _on_exit_button_button_down():
	get_tree().change_scene_to_file("res://levels/witch.tscn")
