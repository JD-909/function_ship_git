class_name TrigBullet
extends Bullet


@export var frequency : float = 1
@export var amplitude : float = 11

var initial_pos
var sign : int 

func _readySign() -> void:
	pass

func _ready() -> void:
	
	collision_layer = 2
	initial_pos = global_position.x
	_readySign()
	_readyPosition()

func movement(velocity_var : Vector2, delta : float) -> void:
	velocity.x = velocity_var.x
	movement_Y(delta)

func _readyPosition() -> void:
	pass

func movement_Y(delta : float) -> void:
	pass
