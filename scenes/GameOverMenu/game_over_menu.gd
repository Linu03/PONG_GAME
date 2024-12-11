extends Control


@export var mainMenu_var = load("res://scenes/MainMenu/main_menu.tscn") as PackedScene
@export var game_var = load("res://scenes/main.tscn") as PackedScene

var _is_over: bool = false:
	set = set_pause
	
#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("pause"):
		#_is_over = !_is_over
#func game_done(): -> void:
	#is_end_game = true

func set_pause(value: bool) -> void:
	_is_over = value
	get_tree().paused = _is_over
	visible = _is_over
	
func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(game_var)
	
func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(mainMenu_var)
