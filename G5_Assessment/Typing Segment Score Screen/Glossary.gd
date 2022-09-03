extends WindowDialog


export (NodePath) var GlossaryOption_path
onready var glossary = get_node(GlossaryOption_path)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vocab_list
#var image
var audio
signal vocab_set
#var i


# Called when the node enters the scene tree for the first time.
func _ready():
	load_file()
	generate_selection(vocab_list)
	#yield(_on_GlossaryOption_item_selected(i), "vocab_set")
	#load_audio()

# Loads .json file information, I think.
func load_file(): # opens JSON file. returns nested dictionary
	var f = File.new()
	f.open("res://G5_Assessment/Typing Segment Score Screen/glossary_list_test.json", File.READ)
	var vocab_data_json = JSON.parse(f.get_as_text())
	f.close()
	vocab_list = vocab_data_json.result
	#print(vocab_list)
	return vocab_list


# Generates OptionButton items from .json file.
func generate_selection(vocab_list):
	for i in vocab_list.size():
		var word = vocab_list[i]["Mixteco"]
		glossary.add_item(word)
	return "dummy"
	
# Original code for func generate_selection (thanks Sabrina!)
#func generate_selection(vocab_list):
#	var glossary_node = OptionButton.new()
#	for i in vocab_list.size():
#		var word = vocab_list[i]["Mixteco"]
#		glossary_node.add_item(word)
#	return "word"

# Switches texture and audio file linked to AudioButton.
func _on_GlossaryOption_item_selected(i):
	for i in vocab_list.size():
		#var image = vocab_list[i]["Image"]
		var audio = vocab_list[i]["Audio"]
		#$TextureRect.set_texture() as Object
		$VocabAudio.set_stream(load(audio))
		emit_signal("vocab_set")
	

# Allows audio stream in VocabAudio to be changed by _on_GlossaryOption_item_selected.
#func load_audio():
#	var sound_player = AudioStreamPlayer.new()
#	var sfx = load(audio)
#	sound_player.stream = sfx
#	sound_player.play()


func _on_AudioButton_pressed():
	$VocabAudio.play()
