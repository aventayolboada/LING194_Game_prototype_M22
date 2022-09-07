extends Control

# Variables and signals needed: 
	# var typing_score (in Main), set to 100. 
	# Score could also be calculated over in Main, 
	# in which case there will be no need for 
	# the following variable here in Assessment.
	#
	# signal error or similar, see doc. above corresponding func here

signal game_started
signal assessment_started
signal glossary_opened

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$WindowScreen.show()
	#$ScoreLabel.text = score_value as int


# Pressing RetryButton hides the window and starts the typing game again.
func _on_RetryButton_pressed():
	get_tree(). change_scene("res://G4_Typing/Main.tscn")
	$WindowScreen.hide()
	emit_signal("game_started")


# Pressing AssessmentButton hides the window and starts the assessment.
func _on_AssessmentButton_pressed():
	get_tree(). change_scene("res://G5_Assessment/Assessment.tscn")
	$WindowScreen.hide()
	emit_signal("assessment_started")

# Pressing GlossaryButton shows the glossary.
func _on_GlossaryButton_pressed():
	$Glossary.show()
	emit_signal("glossary_opened")

# Pressing the window's X returns player to Menu. Not functioning ATM.
func _on_WindowScreen_modal_closed():
	get_tree(). change_scene("res://G1_Menu/Menu.tscn")
	$WindowScreen.hide()
