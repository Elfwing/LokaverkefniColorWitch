extends Node2D
var tabPlace = titleScreen.tabPlace
var tabNumer = 3
var tabs = []
	

func _ready():
	for i in range(tabNumer*2):
		if i < 3: 
			get_child(i).connect("pressed", changeTab.bind(i))
		else: 
			tabs.append(get_child(i))
	changeTab(titleScreen.tabPlace)

func changeTab(place):
	for i in tabs:
		i.visible = false
	tabs[place].visible = true
	titleScreen.tabPlace = place

#called in a diffrent sceen
func updateChildren():
	$tab3.updateFlowersPages()
