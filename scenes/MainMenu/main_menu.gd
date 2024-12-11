class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/Quit_Button as Button

@export var start_level = preload("res://scenes/main.tscn") as PackedScene
var wining_score
var contor_length: bool = false # short game


func _ready() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	HideOptionsMenu()
	$ControlMusic/backgroundMusic.play()

## Main Menu Button Pressed
func on_start_pressed():
	ButtonSoundPressed()
	$ControlMusic/backgroundMusic.stop()
	get_tree().change_scene_to_packed(start_level)
	
func on_options_pressed():
	ButtonSoundPressed()
	HideMainMenu()
	ShowOptionsMenu()
	pass

func on_quit_pressed():
	ButtonSoundPressed()
	get_tree().quit()



### Options Button

func _on_game_length_pressed() -> void:
	ButtonSoundPressed()
	if contor_length == false :
		$"MarginContainer/VBoxContainer2/Game length".text = "Length of a game: Long Game"
		Global.wining_score = 7
		#print(Global.wining_score)
	if contor_length == true :
		$"MarginContainer/VBoxContainer2/Game length".text = "Length of a game: Short Game"
		Global.wining_score = 4
		#print(Global.wining_score)
	contor_length = !contor_length


func _on_game_mode_pressed() -> void:
	ButtonSoundPressed()
	if Global.is_vs_ai:
		$"MarginContainer/VBoxContainer2/Game Mode".text = "Game mode: 1 vs 1"
		Global.is_vs_ai = false
	else:
		$"MarginContainer/VBoxContainer2/Game Mode".text = "Game mode: vs AI"
		Global.is_vs_ai = true



func _on_back_to_main_menu_pressed() -> void:
	ButtonSoundPressed()
	$MarginContainer/VBoxContainer2.hide()
	ShowMainMenu()



func ButtonSoundPressed():
	$ControlMusic/accesButtonSound.play()


## Show - Hide Menu's
func ShowMainMenu():
	$MarginContainer/VBoxContainer.show()
	$MarginContainer/HBoxContainer.show()

func HideMainMenu():
	$MarginContainer/VBoxContainer.hide()
	$MarginContainer/HBoxContainer.hide()

func ShowOptionsMenu():
	$MarginContainer/VBoxContainer2.show()
	
func HideOptionsMenu():
	$MarginContainer/VBoxContainer2.hide()
