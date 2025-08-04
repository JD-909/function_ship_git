class_name  SineBullet
extends TrigBullet

func _readyPosition() -> void:
	position.y = position.y

func movement_Y(delta : float) -> void:
	position.y += sign*cos((initial_pos - position.x)*delta*frequency)*amplitude
