extends Sprite2D

var score := [0,0] # 0: Player1 ,  1: CPU / Player 2 
const PADDLE_SPEED: int = 500

var wining_score : int = Global.wining_score
var is_vs_ai: bool = Global.is_vs_ai
var is_end_game : bool = false

@export var game_is_done = load("res://scenes/GameOverMenu/game_over_menu.tscn") as PackedScene



func _on_ball_timer_timeout() -> void:
	if $Hud/WinMessage.visible != true:
		$Ball.new_ball()

func _on_score_left_body_entered(body: Node2D) -> void:
	score[0] += 1
	$Hud/CPUScore.text = str(score[0])
	go_to_initial_position()
	check_win_condition()
	$BallTimer.start()

func _on_score_right_body_entered(body: Node2D) -> void:
	score[1] += 1	
	$Hud/PlayerScore.text = str(score[1])
	go_to_initial_position()
	check_win_condition()
	$BallTimer.start()

func check_win_condition():
	
	if score[0] >= wining_score && Global.is_vs_ai != true :
		end_game("Player 2 Win!")
		$ControlSounds/WIN_SOUND.play()
		$Fireworks.emitting = true
		is_end_game = true
		$Timer.start()
	elif score[0] >= wining_score && Global.is_vs_ai == true :
		end_game(" BOT Win! =( ")
		$ControlSounds/Lose_Sound_vs_AI.play()
		is_end_game = true
		$Timer.start()
	elif score[1] >= wining_score:
		end_game("Player 1 Win!")
		$ControlSounds/WIN_SOUND.play()
		$Fireworks.amount = 200
		$Fireworks.emitting = true
		is_end_game = true
		$Timer.start()
		
func go_to_initial_position():
	$Player.position = Vector2(50,324)
	$CPU.position = Vector2(1082,324)


func end_game(message: String):
	$Hud/WinMessage.text = message
	$Hud/WinMessage.visible = true
	$Ball.queue_free() # ball node deleted 
	$BallTimer.stop()
	print("Meci done!")


func _on_timer_timeout() -> void:
	$Fireworks.emitting = false
	get_tree().change_scene_to_packed(game_is_done)  
