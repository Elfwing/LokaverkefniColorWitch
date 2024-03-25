extends TextureButton

func updataDisplay(flower):
	#updata the flowers that appere in inventroy
	var flowerTexture = load("res://assets/"+flower+"Flower.png")
	texture_normal = flowerTexture
	var count = titleScreen.flowers[flower]
	$flowerCount.text = str(count)
