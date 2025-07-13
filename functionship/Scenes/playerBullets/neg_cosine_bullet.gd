class_name NegCosineBullet
extends Bullet

var initial_pos

func _ready() -> void:
	
	collision_layer = 2
	initial_pos = global_position.x
	position.y += 35

#funciona mas o menos bien, no grafica realmente la funcion coseno y empieza en 0 que esta mal
func movement(velocity_var : Vector2, delta : float) -> void:
	velocity.x = velocity_var.x
	position.y += sin((initial_pos - position.x)*delta*frequency)*amplitude
