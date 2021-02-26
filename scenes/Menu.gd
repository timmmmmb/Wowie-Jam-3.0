extends Node2D
class_name Menu

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("enter"):
		get_tree().change_scene("res://scenes/Pong.tscn")
