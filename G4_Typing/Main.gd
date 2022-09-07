extends Node2D

var Enemy = preload("res://G4_Typing/Enemy.tscn")
 # preloads Enemy scene

onready var enemy_container = $EnemyContainer # dynamically handle enemies
onready var spawn_container = $SpawnContainer
onready var spawn_timer = $SpawnTimer

onready var score_value = $CanvasLayer/VBoxContainer/TopRow2/TopRow/EnemiesKilledValue
onready var game_message = $CanvasLayer/VBoxContainer/BottomRow/HBoxContainer/Message
# links score (enemies killed) to label display. 

var active_enemy = null
var current_letter_index: int = -1 

# var difficulty. not using bcse we dont have lvls. 
var enemies_killed: int = 0

func _ready() -> void:
	randomize() # built-iin godot method to change random number seed. aka make randomized numbers rly random
	spawn_timer.start()
	spawn_enemy() # spawns enemy immediately on game start
	
func find_new_active_enemy(typed_character: String): #finds new active enemy
	for enemy in enemy_container.get_children():
		var prompt = enemy.get_prompt()
		var next_character = prompt.substr(0, 1)
		if next_character == typed_character:
			var message = ("New Word Challenge: Begins with %s" % next_character)
			game_message.text = message
			active_enemy = enemy
			current_letter_index = 1
			active_enemy.set_next_character(current_letter_index) # video 2
			return # stop iteration after finding new enemy

func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventKey and event.is_pressed() and not event.is_echo():
			var typed_event = event as InputEventKey
			var key_typed = PoolByteArray([typed_event.unicode]).get_string_from_utf8()
			
			if active_enemy == null:
				find_new_active_enemy(key_typed)
			else:
				var prompt = active_enemy.get_prompt()
				var next_character = prompt.substr(current_letter_index, 1)
				if key_typed == next_character:
					var message = "Success! Typed %s" % key_typed
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
				else: #error message
					var message = "Incorrect. Correct: %s . Typed: %s ." % [next_character, key_typed]
					game_message.text = str(message)



func _on_SpawnTimer_timeout(): # spawns enemy
	spawn_enemy()
	
func spawn_enemy():
	var enemy_instance = Enemy.instance()
	var spawns = spawn_container.get_children() # only needs call get_children() once
	var index = randi() % spawns.size()
	enemy_instance.global_position = spawns[index].global_position
	enemy_container.add_child(enemy_instance)
	
func game_over(): #clear out existing enemies, reset connections, etc
	start_game()
	
func start_game():
	pass
