extends KinematicBody2D
class_name Ball

export var speed: Vector2 = Vector2(200.0, 200.0)
export var player: NodePath
var player_paddle: Paddle
export var bot: NodePath
var bot_paddle: Paddle
var velocity: Vector2 = Vector2(1,1)
var direction: bool = false

func _ready():
	player_paddle = get_node(player)
	bot_paddle = get_node(bot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2(1,1)
	if direction:
		velocity *= Vector2(1, -1)
		if bot_paddle.global_position.x - position.x < 10:
			velocity *= Vector2(-1, 1)
		elif bot_paddle.global_position.x - position.x > 10:
			velocity *= Vector2(1, 1)
		else:
			velocity *= Vector2(0, 1)
	else:
		if player_paddle.global_position.x - position.x < 10:
			velocity *= Vector2(-1, 1)
		elif player_paddle.global_position.x - position.x > 10:
			velocity *= Vector2(1, 1)
		else:
			velocity *= Vector2(0, 1)
	velocity *= speed 
	var collision = move_and_collide(velocity * delta)
	if collision:
		var motion = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
# warning-ignore:return_value_discarded
		move_and_collide(motion)
		if collision.collider.is_in_group("paddle"):
			direction = !direction
