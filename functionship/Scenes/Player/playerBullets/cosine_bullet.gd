class_name CosineBullet
extends TrigBullet

func _readyPosition() -> void:
	position.y = position.y + sign*35

func movement_Y(delta : float) -> void:
	position.y += sign*sin((initial_pos - position.x)*delta*frequency)*amplitude
