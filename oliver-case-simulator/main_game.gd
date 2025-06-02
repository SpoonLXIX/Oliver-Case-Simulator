extends Node2D
##Define Buttons:
@export var cases: Button
@export var shop: Button
@export var olivers: Button
@export var prestige: Button
@export var rebirth: Button
@export var settings: Button
@export var leaderboard: Button

##Define Timer:
@onready var second = $Second

##Define Currency Labels:
@export var bucks: Label
@export var luck: Label
@export var pp: Label
@export var rp: Label

##Define Canvas Layers For Buttons:
@export var prestigecanvas: CanvasLayer
@export var rebirthcanvas: CanvasLayer
@export var tutorialcanvas: CanvasLayer


##Blank So Far!
func _process(_delta):
	pass
	##nothin yet
##
	
	
func _ready():
	##Connect 1 Second Timer To Script
	second.connect("timeout", _on_timer_timeout)
	###If First Time Playing:
	if Globals.firstTimePlaying == false:
		tutorialcanvas.hide()
func secondPassed():
	print("second")
	Globals.oliverBucks = Globals.oliverBucks + Globals.bucksPerSecond
	var buckstext = "Oliver Bucks: "
	buckstext = buckstext + str(Globals.oliverBucks)
	buckstext = buckstext + "  (" + str(Globals.bucksPerSecond) + "/s)"
	bucks.text = buckstext
func _on_timer_timeout():
	secondPassed()

###All Main Menu Buttons:
func _on_prestige_button_down() -> void:
	prestigecanvas.show()

func _on_rebirth_button_down() ->void:
	rebirthcanvas.show()
##? Tutorial Button
func _on__button_down() -> void:
	tutorialcanvas.show()


###All Close Menu Buttons:
func _on_prestige_exit_pressed() -> void:
	prestigecanvas.hide()
func _on_rebirth_exit_pressed() -> void:
	rebirthcanvas.hide()


func _on_tutorial_exit_pressed() -> void:
	Globals.firstTimePlaying = false
	tutorialcanvas.hide()
	
