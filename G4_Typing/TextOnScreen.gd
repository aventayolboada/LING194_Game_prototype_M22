extends RichTextLabel

func show_value(value, duration, defeat=false):
	# value: string to display
	# duration: how long text lasts
	# defeat: if enemy defeated OR enemy reached player
	text = value
	if defeat:
		modulate = Color( 0, 0.545098, 0.545098, 1)
	elif defeat == false:
		modulate = Color(1, 0, 0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
