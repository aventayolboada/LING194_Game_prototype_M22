extends Node

var vocab_list = [
	"nùnì", 
	"iti",
	"kuàntxii",
	"yòò",
	"txìkuìí",
	"ntuchì",
	"ñu'un", 
	"shìtà"	
]

func get_prompt() -> String:
	var vocab_index = randi() % vocab_list.size()
	var word = vocab_list[vocab_index]
	return word 


#var vocab_list
#var final_list = []
#var rng = RandomNumberGenerator.new()
#
#func _ready() -> void:
#	rng.randomize()
#	convert_list()
#
#func load_file():
#	var f = File.new()
#	f.open("res://assets/mixtec_vocab.json", File.READ)
#	var vocab_data_json = JSON.parse(f.get_as_text())
#	f.close()
#	vocab_list = vocab_data_json.result
#	return vocab_list
#
#func convert_list():
#	load_file()
#	for i in range(0, 9): 
#		var new_word = convert_list_2(i)
#		final_list.append(new_word)
#	return final_list
#
#func convert_list_2(index: int) -> String: 
#	var word = vocab_list[index]
#	var actual_word = word[str(index + 1)]["Mixteco"]
#	return(actual_word)
#
#func get_prompt() -> String:
#	var word_index = randi() % final_list.size()
#	var word = final_list[word_index]
#	return word



