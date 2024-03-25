extends Sprite2D

var flowers = titleScreen.flowers
var flowerOwned = preload("res://objects/flowerOwned.tscn")
var flowerColors = titleScreen.flowerColors
var page = 0

func _ready():
	for i in flowers:
		var flowerOwnedInt = flowerOwned.instantiate()
		flowerOwnedInt.connect("pressed", sellFlower.bind(i))
		$flowersOwned.add_child(flowerOwnedInt)
	updateFlowersPages()

#makes and updata that display for flowers that you own
func updateFlowersPages():
	var indexOn = 0
	var flowerVis = 0
	for i in flowers:
		$flowersOwned.get_child(indexOn).updataDisplay(i)
		$flowersOwned.get_child(indexOn).visible = false
		if flowers[i] != 0:
			if flowerVis < 4*(page+1) and flowerVis >= page*4:
				$flowersOwned.get_child(indexOn).visible = true
			flowerVis += 1
		indexOn += 1
	if page != 0:
		$smallArrowLeft.visible = true
	else:$smallArrowLeft.visible = false
	if page < floor((flowerVis-1)/4) and flowerVis != 0:
		$smallArrowRight.visible = true
	else:$smallArrowRight.visible = false

func sellFlower(flower):
	if flowers[flower] > 0 and get_tree().current_scene.name == "cauldron":
		titleScreen.flowers[flower] -= 1
		save.saveValue("main", "flowers", titleScreen.flowers)
		titleScreen.cauldronColors.append(flowerColors[flower])
		updateFlowersPages()

func _on_small_arrow_left_button_down():
	page -= 1
	updateFlowersPages()

func _on_small_arrow_right_button_down():
	page += 1
	updateFlowersPages()
