extends Node2D

var WCT = preload("res://TextOnScreen.tscn")

export var duration = 2

func win_message(value, defeat = false):
	var win_msg = WCT.instance()
	add_child(win_msg)
	win_msg.show_value(str(value), duration, defeat)

