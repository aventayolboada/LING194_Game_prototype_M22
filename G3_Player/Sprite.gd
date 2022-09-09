extends Sprite

var speed = 300 #The sprite will be roating to move around with the falling words
var angular_speed = PI


func _process(delta):
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
