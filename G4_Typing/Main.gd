extends Node2D

var Enemy = preload("res://G4_Typing/Enemy.tscn")
 # preloads Enemy scene

onready var enemy_container = $EnemyContainer # dynamically handle enemies
onready var spawn_container = $SpawnContainer
onready var spawn_timer = $SpawnTimer

onready var score_value = $GameMessages/VBoxContainer/TopRow2/TopRow/EnemiesKilledValue
onready var game_message = $GameMessages/VBoxContainer/BottomRow/HBoxContainer/Message
#onready var final_score = $GameMessages/GameOverScreen/CenterContainer/VBoxContainer2/ScoreLabel
onready var final_score = $TypingScoreControl/WindowScreen/ScoreLabel
# links score (enemies killed) to label display. 
onready var game_over_screen = $GameMessages/GameOverScreen

var active_enemy = null
var current_letter_index: int = -1

# var difficulty. not using bcse we dont have lvls. 
var enemies_killed: int = 0

var enemies = 0

func _ready() -> void:
	randomize() # built-in godot method to change random number seed. aka make randomized numbers rly random
	spawn_timer.start()
	spawn_enemy()
	enemies = 1
	$TypingScoreControl/WindowScreen.connect("restart_pressed", self, "restart_received")

#func _process(delta): # deletes enemy instance after certain time. NOT WORKING. do not uncomment for now. 
#	for enemy in enemy_container.get_children():
#		active_enemy = enemy
#		var pos = enemy.get_global_position()
#		if pos[1] > 435:
#			enemy.queue_free()
#			active_enemy = null
#			var event = InputEvent
#			if event is InputEventKey and event.is_pressed() and not event.is_echo():
#				_unhandled_input(event)
			# need to find new enemy

func find_new_active_enemy(typed_character): #finds new active enemy
	for enemy in enemy_container.get_children():
		var prompt = enemy.get_prompt()
		if prompt == "over": # need change
			game_over()
		else:
			var next_character = prompt.substr(0, 1)
			if ord(next_character) == typed_character:
				var message = ("New Word Challenge: Begins with %s" % next_character)
				game_message.text = message
				active_enemy = enemy
				current_letter_index = 1
				active_enemy.set_next_character(current_letter_index) # video 2
				return # stop iteration after finding new enemy

func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventKey and event.is_pressed() and not event.is_echo():
			var typed_event = event as InputEventKey
			#var key_typed = PoolByteArray([typed_event.unicode]).get_string_from_utf8()
			
			if active_enemy == null:
				find_new_active_enemy(typed_event.unicode)
			else:
				var prompt = active_enemy.get_prompt()
				var next_character = prompt.substr(current_letter_index, 1)
				if typed_event.unicode == ord(next_character):
					var message = "Success! Typed: %s" %  next_character
					game_message.text = message # correct message
					current_letter_index += 1
					active_enemy.set_next_character(current_letter_index)
					if current_letter_index == prompt.length():
						message = "Word challenge defeated! Typed: %s" % prompt # victory message. NO method called prompt.text()
						game_message.text = message
						current_letter_index = -1
						active_enemy.queue_free()
						active_enemy = null
						enemies_killed += 1
						score_value.text = str(enemies_killed)
						final_score.text = str(enemies_killed)
				else: #error message
					var message = "Incorrect. Correct: %s ." % [next_character]
					game_message.text = str(message)



func _on_SpawnTimer_timeout(): # spawns enemy
	if (enemies>=24) :
		game_over()
	else:
		spawn_enemy()
		enemies = enemies + 1
	
func spawn_enemy():
	var enemy_instance = Enemy.instance()
	var spawns = spawn_container.get_children() # only needs call get_children() once
	var index = randi() % spawns.size()
	enemy_instance.global_position = spawns[index].global_position
	enemy_container.add_child(enemy_instance)
	
func game_over(): #clear out existing enemies, reset connections, etc
	$TypingScoreControl/WindowScreen.show()
	spawn_timer.stop()
	active_enemy = null
	current_letter_index = -1
	
	
func start_game():
	$TypingScoreControl/WindowScreen.hide()
	score_value = 0
	randomize() # built-iin godot method to change random number seed. aka make randomized numbers rly random
	spawn_timer.start()
	spawn_enemy() # spawns enemy immediately on game start
	enemies = 1

	
func restart_received(): # connects signals across GameMessage.tcsn and TypingCompleteScreen.tscn
	start_game()


func _on_GameOverTimer_timeout():
	game_over() # NOT WORKING
	
