extends Node2D
class_name Pong

func win() -> void:
	$WinScreen.visible = true


func loose() -> void:
	$LoosScreen.visible = true


func restart() -> void:
# warning-ignore:standalone_expression
	get_tree().reload_current_scene()


# warning-ignore:unused_argument
func _on_BotLoss_body_entered(body: Node) -> void:
	loose()


# warning-ignore:unused_argument
func _on_PlayerLoss_body_entered(body: Node) -> void:
	win()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("restart"):
		restart()
