extends WindowDialog


export (NodePath) var GlossaryOption_path
onready var glossary = get_node(GlossaryOption_path)

var vocab_list


# Called when the node enters the scene tree for the first time.
func _ready():
	load_file()
	generate_selection(vocab_list)

# Loads .json file information.
func load_file(): # opens JSON file. returns nested dictionary
	var f = File.new()
	f.open("res://G5_Assessment/Typing Segment Score Screen/glossary_list.json", File.READ)
	var vocab_data_json = JSON.parse(f.get_as_text())
	f.close()
	vocab_list = vocab_data_json.result
	return vocab_list


# Generates OptionButton items from .json file. Props to Sabrina for her help!
func generate_selection(vocab_list):
	for i in vocab_list.size():
		var word = vocab_list[i]["Mixteco"]
		glossary.add_item(word)
	return "dummy"


# Switches texture and audio file linked to AudioButton.
func _on_GlossaryOption_item_selected(i):
	var image = vocab_list[i]["Image"]
	var audio = vocab_list[i]["Audio"]
	$TextureRect.set_texture(load(image))
	$VocabAudio.set_stream(load(audio))


func _on_AudioButton_pressed():
	$VocabAudio.play()
