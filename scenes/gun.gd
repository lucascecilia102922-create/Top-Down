extends Node2D
@onready var sprite = $"Gun Sprite"
@export var bullet_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shoot()
	aim()
	pass
	
	

func aim():
	
	look_at(get_global_mouse_position())
	sprite.flip_v = get_global_mouse_position().x < global_position.x

func shoot():
	if Input.is_action_just_pressed("Shoot") and bullet_scene:
		var bullet = bullet_scene.instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.global_position = $Bullet_Pos.global_position
		bullet.global_rotation = global_rotation
		pass
		 
