extends Control


export(NodePath) var QuizTemplate_path
export(NodePath) var AssessmentBackground_path


onready var quiz_template = get_node(QuizTemplate_path)
onready var assessment_background = get_node(AssessmentBackground_path)
onready var i = 0
var vocab_list
var assessment_score
#var question


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	load_file()
	#question_order(vocab_list)
	$QuizTemplate/LineEdit.connect("text_entered", self, "_on_LineEdit_text_entered")
	$AssessmentBackground/HUDLayer/BackButton.connect("pressed", self, "_on_BackButton_pressed")
	generate_test(vocab_list)


# Loads .json file information.
func load_file(): # opens JSON file. returns nested dictionary
	var f = File.new()
	f.open("res://G5_Assessment/Typing Segment Score Screen/glossary_list.json", File.READ)
	var vocab_data_json = JSON.parse(f.get_as_text())
	f.close()
	vocab_list = vocab_data_json.result
	return vocab_list


#func question_order(vocab_list):
#	while vocab_list.size() > 0:
#		var question_index = randi() % vocab_list.size()
#		var question = question_index[i]
#		return question


# Generates test items from .json file. Props to Sabrina for her help!
func generate_test(vocab_list):
	var image = vocab_list[i]["Image"]
	$QuizTemplate/TextureRect.set_texture(load(image))
	$InstructionLabel.text = "TYPE IN THE MIXTEC WORD THAT MATCHES THE PICTURE AND PRESS ENTER."
	return i


# Checks the inputted text for correctness after user presses Enter,
# then displays appropriate message and makes the entry field uneditable.
# After $AnswerFeedbackTimer counts down, switches to next question (if appropriate) and allows input into text entry field.
func _on_LineEdit_text_entered(new_text):
	var word = vocab_list[i]["Mixteco"]
	if new_text == word:
		var message = "Correct Answer! Great job!"
		$InstructionLabel.text = str(message)
	else:
		var message = "Incorrect Answer. Correct answer: %s." % [word]
		$InstructionLabel.text = str(message)
	$AnswerFeedbackTimer.start()
	$QuizTemplate/LineEdit.set_editable(false)
	yield($AnswerFeedbackTimer, "timeout")
	next_question()
	$QuizTemplate/LineEdit.set_editable(true)


# Switches to the next question on entering a word, or opens final score screen if on last question.
func next_question():
	if i < 24:
		i += 1
		generate_test(vocab_list)
	else:
		get_tree(). change_scene("res://G5_Assessment/Assessment.tscn")
		i = 0
	return i


# Switches to the previous question on pressing BackButton, or returns to the main menu if on the first question.
func _on_BackButton_pressed():
	get_tree(). change_scene("res://G1_Menu/Menu.tscn")
