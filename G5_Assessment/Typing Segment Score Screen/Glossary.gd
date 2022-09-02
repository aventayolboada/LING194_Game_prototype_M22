extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vocab_list


# Called when the node enters the scene tree for the first time.
func _ready():
	#load_file()
	pass

# Function loads .json file information, I think.
#func load_file(): # opens JSON file. returns nested dictionary
#	var f = File.new()
#	f.open("res://G4_Typing/assets/vocab/mixtec_vocab.json", File.READ)
#	var vocab_data_json = JSON.parse(f.get_as_text())
#	f.close()
#	vocab_list = vocab_data_json.result
#	return vocab_list 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function to generate OptionButton items from .json file will go here.
#func generate_selection(vocab):
#	var glossary_node = OptionButton.new()
#	for item in vocab:
#		glossary_node.add_item(item)
#	return glossary_node

# Function to switch vocab texture/audio will go here.
#func _on_GlossaryOption_item_selected(index):
	pass # Replace with function body.
