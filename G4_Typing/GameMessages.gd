extends CanvasLayer

func _ready():
	pass # Replace with function body.



func _on_RestartButton_pressed():
	emit_signal("restart_pressed")
	
