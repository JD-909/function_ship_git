class_name CosineBullet
extends TrigBullet

func _readyPosition() -> void:
	position.y = position.y + sign*50

func movement_Y(delta : float) -> void:
	position.y += sign*sin((initial_pos - position.x)*delta*frequency)*amplitude
