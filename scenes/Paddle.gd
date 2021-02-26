extends KinematicBody2D
class_name Paddle

export var speed: float = 20.0
export var max_speed: float = 200.0
var velocity: Vector2 = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = 0
	velocity = move_and_slide(velocity, Vector2(0, -1))
