extends Node2D
class_name Bot


export var ball_path: NodePath
var ball: Ball

func _ready():
	ball = get_node(ball_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:	
	var direction = Vector2(0, 0)

	if ball.global_position.x - position.x > 50:
		direction.x -= 1
	elif ball.global_position.x - position.x < 50:
		direction.x += 1
	
	$Paddle.velocity += direction.normalized() * $Paddle.speed
