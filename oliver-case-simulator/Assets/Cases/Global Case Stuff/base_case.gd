extends Node
class_name BaseCase
##Crate Customisable Stuff
@export var value : int
@export var index : int
##Loot for crate 0, Done by index of oliver's
@export var loot : Array
@onready var pressed = false
@onready var itemrarityarray = []
@onready var itemoddsarray = []
var rng = RandomNumberGenerator.new()


func open():
	##Open Animation Here
	oliverloot(loot)
	pass
	##open code


func sell():
	if pressed == false:
		pressed = true
	Globals.oliverBucks = Globals.oliverBucks + value
	queue_free()
func oliverloot(loot):
	##Decide loot based on array
	for item in loot:
		var itemrarity = "Index" + str(item) + "Rarity"
		itemrarity = Olivers.get(itemrarity)
		itemrarityarray.append(itemrarity)
		##Checks index with global oliver's
		##Gets rarity for global oliver
	var tempsum = 0
	for items in itemrarityarray:
		tempsum = tempsum + items
	for item in itemrarityarray:
		var tempitem = float(item)
		var oddsforitem = 100/(tempsum/tempitem) 
		itemoddsarray.append(oddsforitem)
	var weights = PackedFloat32Array([itemoddsarray[0],itemoddsarray[1],itemoddsarray[2]])
	var my_array = itemoddsarray
	var choice = loot[rng.rand_weighted(weights)]
	###Work out modifiers here
	##The modifiers will then go in an array that is sent in the signal.
	##The rest like cash etc will be worked out elsewhere.
	
	###PLAY ANIMATION HERE!!!
	###I WANT THE CASE TO FLASH WHITE OR SMTH THEN OPEN UP AND THE OLIVER IS THERE IDK
	
	################
	###send signal to spawn oliver with index choice here.
	get_tree().get_root().get_node("Factory").call("spawn",choice)
	queue_free()

	
