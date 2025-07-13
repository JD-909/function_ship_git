class_name NegSineBullet
extends Bullet

var initial_pos

func _ready() -> void:
	
	collision_layer = 2
	initial_pos = global_position.x

#funciona mas o menos bien, no grafica realmente la funcion seno
func movement(velocity_var : Vector2, delta : float) -> void:
	velocity.x = velocity_var.x
	position.y += cos((initial_pos - position.x)*delta*frequency)*amplitude
