extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

onready var _animated_sprite = $AnimatedSprite

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		_animated_sprite.play("move")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		_animated_sprite.play("move")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		_animated_sprite.play("move")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		_animated_sprite.play("move")
	else:
		_animated_sprite.stop()
	velocity = velocity.normalized() * speed

# gdlint: disable=unused-argument
func _physics_process(delta):
	# do nothing with delta
	get_input()
	velocity = move_and_slide(velocity)
# gdlint: enable=unused-argument
