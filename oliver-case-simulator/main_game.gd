extends Node2D
##Define Buttons:
@onready var cases = $"Menu Container/CanvasLayer/ColorRect/HBoxContainer/Cases"
@onready var shop = $"Menu Container/CanvasLayer/ColorRect/HBoxContainer/Shop"
@onready var olivers = $"Menu Container/CanvasLayer/ColorRect/HBoxContainer/Olivers"
@onready var prestige = $"Menu Container/CanvasLayer/ColorRect/HBoxContainer/Prestige"
@onready var rebirth = $"Menu Container/CanvasLayer/ColorRect/HBoxContainer/Rebirth"
@onready var settings = $"Menu Container/CanvasLayer/ColorRect/VBoxContainer/Settings"
@onready var leaderboard = $"Menu Container/CanvasLayer/ColorRect/VBoxContainer/Leaderboard"
@onready var second = $Second
@onready var bucks = $"Menu Container/CanvasLayer/ColorRect/VBoxContainer2/OliverBucks"
@onready var luck = $"Menu Container/CanvasLayer/ColorRect/VBoxContainer2/Luck"
@onready var pp = $"Menu Container/CanvasLayer/ColorRect/VBoxContainer2/PrestigePoints"
@onready var rp = $"Menu Container/CanvasLayer/ColorRect/VBoxContainer2/RebirthPoints"


func _ready():
	second.connect("timeout", _on_timer_timeout)

func _process(_delta):
	pass

func secondPassed():
	print("second")
	Globals.oliverBucks = Globals.oliverBucks + Globals.bucksPerSecond
	var buckstext = "Oliver Bucks: "
	buckstext = buckstext + str(Globals.oliverBucks)
	buckstext = buckstext + "   (" + str(Globals.bucksPerSecond) + "/s)"
	bucks.text = buckstext
	
	
	
func _on_timer_timeout():
	secondPassed()
