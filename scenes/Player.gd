extends Node2D
class_name Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:	
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")

	var direction = Vector2(0, 0)

	if left:
		direction.x -= 1
	if right:
		direction.x += 1
	
	$Paddle.velocity += direction.normalized() * $Paddle.speed
