extends Node2D

var vocab_list
func _ready():
	load_file()
	get_prompt()

func load_file(): # opens JSON file. returns nested dictionary
	var f = File.new()
	f.open("res://G4_Typing/assets/vocab/mixtec_vocab.json", File.READ)
	var vocab_data_json = JSON.parse(f.get_as_text())
	f.close()
	vocab_list = vocab_data_json.result
	return vocab_list 

func get_prompt() -> String:
	var word_index = randi() % vocab_list.size()
	var word = vocab_list[word_index]["Mixteco"]
	return word
