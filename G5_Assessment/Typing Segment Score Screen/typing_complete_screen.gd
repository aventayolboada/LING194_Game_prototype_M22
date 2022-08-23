extends Control

# Variables and signals needed: 
	# var typing_score (in Main), set to 100. 
	# Score could also be calculated over in Main, 
	# in which case there will be no need for 
	# the following two variables here in Assessment.
	#
	# signal on_spelling_error or similar, see doc. above corresponding func here
	# signal on_tone_error or similar, see doc. above corresponding func here

signal newGame
signal assessment

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.text = str(typing_score)


# _on_spelling_error is a placeholder for the signal that will be sent out 
# upon the event of an incorrectly spelled word.
func _on_spelling_error():
	typing_score -=1


# _on_tone_error is a placeholder for the signal that will be sent out 
# upon the event of an incorrectly typed tone.
func _on_tone_error():
	typing_score -=1

# Pressing RetryButton hides the window and starts the typing game again.
func _on_RetryButton_pressed():
	$TypingScoreScreen.hide()
	emit_signal("newGame")

# Pressing AssessmentButton hides the window and starts the assessment.
func _on_AssessmentButton_pressed():
	$TypingScoreScreen.hide()
	emit_signal("assessment")
