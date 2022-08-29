extends CanvasLayer

signal newGame
signal assessment

func show_message(text):
	$title.text = text
	$title.show()
	$messageTimer.start()

func _on_newGame_pressed():
	$newGame.hide()
	$assessment.hide()
	$title.hide()
	emit_signal("newGame")
	$Clicksound.play()
	
func _on_assessment_pressed():
	$assessment.hide()
	$newGame.hide()
	$title.hide()
	emit_signal("assessment")
	$Clicksound.play()

func _on_messageTimer_timeout():
	$title.hide()

func show_game_over():
	show_message("Finished!")
	$Gameoversound.play()
	yield($messageTimer, "timeout")
	$title.text = "TITLE"
	$title.show()
	yield(get_tree().create_timer(1), "timeout")
	$newGame.show()
	$assessment.show()


