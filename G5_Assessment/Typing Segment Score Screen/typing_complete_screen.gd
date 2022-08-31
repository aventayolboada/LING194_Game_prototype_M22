extends Control

# Variables and signals needed: 
	# var typing_score (in Main), set to 100. 
	# Score could also be calculated over in Main, 
	# in which case there will be no need for 
	# the following variable here in Assessment.
	#
	# signal error or similar, see doc. above corresponding func here

signal newGame
signal assessment
signal glossary

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$WindowScreen.show()
	#$ScoreLabel.text = 100


# A placeholder for the function that will decrease player score upon an error.
#func _on_error():
	#typing_score -=1


# Pressing RetryButton hides the window and starts the typing game again.
func _on_RetryButton_pressed():
	get_tree(). change_scene("res://G4_Typing/Main.tscn")
	$WindowScreen.hide()
	emit_signal("newGame")


# Pressing AssessmentButton hides the window and starts the assessment.
func _on_AssessmentButton_pressed():
	get_tree(). change_scene("res://G5_Assessment/Assessment.tscn")
	$WindowScreen.hide()
	emit_signal("assessment")


func _on_GlossaryButton_pressed():
	$WindowScreen.hide()
	emit_signal("glossary")
