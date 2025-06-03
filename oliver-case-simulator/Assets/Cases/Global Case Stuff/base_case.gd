extends Node
class_name BaseCase

##Crate Customisable Stuff
@export var value : int
@export var index : int
##Loot for crate 0, Done by index of oliver's
@export var loot : Array
@onready var pressed = false


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
	pass
