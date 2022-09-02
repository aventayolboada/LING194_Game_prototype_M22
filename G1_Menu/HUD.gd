extends CanvasLayer

signal game_started
signal assessment_started

func show_message(text):
	$Title.text = text
	$Title.show()

func _on_newGame_pressed():
	get_tree(). change_scene("res://G4_Typing/Main.tscn")
	$ClickSound.play()
	$NewGameButton.hide()
	$AssessmentButton.hide()
	$Title.hide()
	emit_signal("game_started")
	
func _on_assessment_pressed():
	get_tree(). change_scene("res://G5_Assessment/Assessment.tscn")
	$ClickSound.play()
	$AssessmentButton.hide()
	$NewGameButton.hide()
	$Title.hide()
	emit_signal("assessment_started")

func show_game_over():
	$Title.text = "FINISH!"
	$Title.show()
	$GameOverSound.play()
	$Title.text = "MIXTYPE"
	$NewGameButton.show()
	$AssessmentButton.show()
