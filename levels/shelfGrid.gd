extends GridContainer
var flowers = titleScreen.flowers
var price = 100
func _ready():
	#adds flowers to store display
	for i in flowers:
		var displayFlower = TextureButton.new()
		add_child(displayFlower)
		var flowerTexture = load("res://assets/"+i+"Flower.png")
		displayFlower.texture_normal = flowerTexture
		displayFlower.connect("pressed", buyFlowers.bind(i))
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func buyFlowers(flower):
	#let you buy flowers
	if titleScreen.coins >= price and flowers[flower] < 99:
		titleScreen.flowers[flower] += 1
		titleScreen.coins -= price
		save.saveValue("main", "coins", titleScreen.coins)
		save.saveValue("main", "flowers", titleScreen.flowers)
	$"../tabs".updateChildren()
	

