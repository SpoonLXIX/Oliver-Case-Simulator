extends Node
class_name BaseOliver

##Base Oliver Stats
@export var index : int
@export var value : int
@export var modifiers : int


func init():
	Globals.bucksPerSecond = Globals.bucksPerSecond + (value * modifiers)
	pass
	###adds to the money per second
	#ran after instantiated


func sell():
	Globals.bucksPerSecond = Globals.bucksPerSecond - (value * modifiers)
	##takes from the money per second
	queue_free()
