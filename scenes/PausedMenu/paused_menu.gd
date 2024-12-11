extends Control

@export var main_pause_var = load("res://scenes/MainMenu/main_menu.tscn") as PackedScene

var _is_paused: bool = false:
	set = set_pause


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused


func set_pause(value: bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused
	

func _on_resume_button_pressed() -> void:
	_is_paused = false
	get


func _on_quit_button_pressed() -> void:
	_is_paused = false
	get_tree().change_scene_to_packed(main_pause_var)
