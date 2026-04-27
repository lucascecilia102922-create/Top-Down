extends CharacterBody2D

@export var speed = 4000
@onready var anim = $AnimatedSprite2D
var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	Move(delta)
	Anim()
	pass

func Move(delta: float):
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	if direction != Vector2.ZERO:
		velocity = direction * speed * delta

	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	move_and_slide()

func Anim():		
	if direction == Vector2.ZERO:
		anim.play("Idle")
	else:
		if abs(direction.x) > abs(direction.y):
			anim.play("walk_side")
			if direction.x < 0:
				anim.flip_h = true
			else:
				anim.flip_h = false
		elif direction.y > 0:
			anim.play("walk_down")
		else:
			anim.play("walk_up")
	pass
	
