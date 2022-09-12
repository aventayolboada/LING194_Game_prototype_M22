extends KinematicBody2D

#colors changing characters as player types them
export (Color) var blue = Color("#4682b4") #previously typed character
export (Color) var green = Color("#639765") #current character to type
export (Color) var red = Color("#a65455") #upcoming character to type

export (float) var speed = 0.8 # Vid2: float bcse enemy is a sprite. moving position not based on velocity

onready var prompt = $RichTextLabel
onready var prompt_text = prompt.text

func _ready() -> void:
	prompt_text = PromptList.get_prompt()
	prompt.parse_bbcode(set_center_tags(prompt_text))

func _physics_process(delta: float) -> void:
	global_position.y += speed #vid2: CHANGE. global_position.y so moves top down. 

func get_prompt() -> String: 
	return prompt_text

func set_next_character(next_character_index: int):
# determines what color each character will be. video 2
# helper func: get_bbcode_color_tag
	var blue_text = get_bbcode_color_tag(blue) + prompt_text.substr(0, next_character_index) + get_bbcode_end_color_tag() # index 0 bcse first chara
	var green_text = get_bbcode_color_tag(green) + prompt_text.substr(next_character_index, 1) + get_bbcode_end_color_tag()
	var red_text = "" # red text handling includes if statement

	if next_character_index != prompt_text.length():
		red_text = get_bbcode_color_tag(red) + prompt_text.substr(next_character_index + 1, prompt_text.length() - next_character_index + 1) + get_bbcode_end_color_tag()

	prompt.parse_bbcode(set_center_tags(blue_text + green_text + red_text))
	# alternative: pen_bbcode. but parse overwrites prev bbcode

func set_center_tags(string_to_center: String):
	return "[center]" + string_to_center + "[/center]"

func get_bbcode_color_tag(color: Color) -> String: # helper funct for set_next_character. param: color. output: string. 
	return "[color=#" + color.to_html(false) + "]" # gives us new bbcode string in correct format. don't forget #

func get_bbcode_end_color_tag() -> String:
	return "[/color]"
