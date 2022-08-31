extends CanvasLayer

signal newGame
signal assessment

func _on_newGame_pressed():
	#get_tree(). change_scene("res://G4_Typing/Main.tscn")
	$Clicksound.play()
	$newGame.hide()
	$assessment.hide()
	$title.hide()
	emit_signal("newGame")
	
func _on_assessment_pressed():
	#get_tree(). change_scene("res://G5_Assessment/Assessment.tscn")
	$assessment.hide()
	$newGame.hide()
	$title.hide()
	emit_signal("assessment")
	$Clicksound.play()


func show_game_over():
	$title.text = "FINISH！"
	$title.show()
	$Gameoversound.play()
	$title.text = "TITLE"
	$newGame.show()
	$assessment.show()


