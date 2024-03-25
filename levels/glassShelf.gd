extends Sprite2D

var glassColors = titleScreen.glassColors
var glass = preload("res://objects/glassBottle.tscn")

func _ready():
	#place glass bottels on shelf
	var margin = 100
	var errorCore = 27
	var xPos
	for i in range(glassColors.size()):
		var glassIns = glass.instantiate()
		xPos = margin*(i-(glassColors.size()-1)/2)-errorCore
		glassIns.position = Vector2(xPos, -125)
		glassIns.name = "glass"+str(i)
		add_child(glassIns)
		get_child(i).colorPoison(i)
		
func _on_cauldron_area_entered(area):
	#changes the color of glass when is enters a none empty cauldron
	var glassNum = area.name.trim_prefix("glass")
	glassNum = int(glassNum)
	if titleScreen.cauldronColors:
		var mixColor = $"../cauldron/potion".color
		titleScreen.glassColors[glassNum] = Color(mixColor)
		get_child(glassNum).colorPoison(glassNum)
	titleScreen.cauldronColors = []
	save.saveValue("main", "cauldronColors", titleScreen.cauldronColors)
	
