extends Node2D

##Define Public Variables:
@onready var amountOfPrestiges = 0
@onready var amountOfRebirths = 3
@onready var amountOfPrestigePoints = amountOfPrestiges*5
@onready var maxPrestigeCost = 0
@onready var maxRebirthCost = 0
@onready var costForOnePrestige = 0
@onready var costForOneRebirth = 0
@onready var pptext = ""
@onready var rptext = ""


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


##Prestige Purchase Button + Label:
@export var prestigepurchasebutton: Button
@export var prestigepurchaselabel: Label

##Rebirth Purchase Button + Label:
@export var rebirthpurchasebutton: Button
@export var rebirthpurchaselabel: Label

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
	Globals.oliverBucks = Globals.oliverBucks + Globals.bucksPerSecond*Globals.startMultiplier + Globals.extraBucksPerSecond
	print("second")
	update_currencies()
	##Calculate the amount of possible prestiges following future formula:
	##For access to the blog used:
	##https://blog.kongregate.com/the-math-of-idle-games-part-i/
	#Prestige Calculations:
	var n = 1
	var b = 100000
	var r = 1.07
	var k = Globals.currentPrestiges
	var c = Globals.oliverBucks
	costForOnePrestige = b*((r**k)*((r**n)- 1)/(r-1))
	var a = (((c*(r-1))/(b*(r**k))) + 1)
	var maxamountofupgrades = floor((log(a))/(log(r)))
	var maxupgradecost = b * (r**k) * ((r**maxamountofupgrades) -1) / (r-1)
	amountOfPrestiges = maxamountofupgrades
	amountOfPrestigePoints = amountOfPrestiges*5
	maxPrestigeCost = maxupgradecost
	update_prestige_price()
	##Calculate the amount of possible rebirths following future formula:
	n = 1
	b = 1000000
	r = 1.2
	k = Globals.currentRebirths
	c = Globals.prestigePoints
	costForOneRebirth = b*((r**k)*((r**n)- 1)/(r-1))
	a = (((c*(r-1))/(b*(r**k))) + 1)
	maxamountofupgrades = floor((log(a))/(log(r)))
	amountOfRebirths = maxamountofupgrades
	maxupgradecost = b * (r**k) * ((r**maxamountofupgrades) -1) / (r-1)
	var maxRebirthCost = maxupgradecost
	#######
	update_rebirth_price()
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
	
func update_currencies():
	var buckstext = "Oliver Bucks: "
	buckstext = buckstext + str(Globals.oliverBucks)
	buckstext = buckstext + "  (" + str(Globals.bucksPerSecond) + "/s)"
	bucks.text = buckstext
	
	var pptext = "Prestige Points: "
	pp.text = pptext + str(Globals.prestigePoints)	
	var rptext = "Rebirth Points: "
	rp.text = rptext + str(Globals.rebirthPoints)
	
	
func update_prestige_price():
	pptext = "Click the button to prestige the max possible amount that you can!
	This will reset all of your non Perm Oliver's, Boofs And Your Coins!
	Amount Of Prestiges: "
	pptext = pptext + str(amountOfPrestiges)
	var pptextcost = "
	Prestiging Costs: " + str(maxPrestigeCost)
	pptextcost = pptextcost + " Oliver Bucks"
	pptext = pptext + pptextcost
	
	var pptext2 = "
	You Will Recieve: "
	pptext2 = pptext2 + str(amountOfPrestigePoints)
	pptext = pptext + pptext2 + " Prestige Points"
	prestigepurchaselabel.text = pptext

func update_rebirth_price():
	rptext = "Click the button to rebirth the max possible amount that you can!
	This will reset all of your non Perm Oliver's, Boofs, Prestiges And Your Coins!
	Amount Of Rebirths: "
	rptext = rptext + str(amountOfRebirths)
	if amountOfRebirths == 0:
		maxRebirthCost = costForOneRebirth
	var rptextcost = "
	Rebirthing Costs: " + str(maxRebirthCost)
	rptextcost = rptextcost + " Prestige Points"
	rptext = rptext + rptextcost
	var rptext2 = "
	You Will Recieve: "
	rptext2 = rptext2 + str(amountOfRebirths)
	rptext = rptext + rptext2 + "Prestige Points"
	rebirthpurchaselabel.text = rptext


##Purchase Prestige+ Rebirth Here
func _on_prestige_purchase_button_pressed() -> void:
	if amountOfPrestiges > 0:
		reset_values(0)
		Globals.oliverBucks = 0
		Globals.prestigePoints = Globals.prestigePoints + amountOfPrestigePoints
		##Play Prestige Sound

func _on_rebirth_purchase_button_pressed() -> void:
	if amountOfRebirths > 0:
		reset_values(1)
		Globals.rebirthPoints = Globals.rebirthPoints + amountOfRebirths
		##Play Rebirth Sound


func reset_values(level):
	Globals.oliverBucks = 0
	Globals.extraBucksPerSecond = 0
	##Non Perm Boofs Reset Here
	if level == 1:
		Globals.prestigePoints = 0
		##Reset Prestige Extra Stuff Here!
	update_rebirth_price()
	update_prestige_price()
	update_currencies()
	
