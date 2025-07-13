class_name Bullet
extends CharacterBody2D

@export var speed : float = 800
@export var frequency : float = 1
@export var amplitude : float = 9

func _ready() -> void:
	collision_layer = 2

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	
	movement(direction*speed, delta)
	
	var collision = move_and_collide(velocity*delta)
	
	if collision:
		queue_free()

func movement(velocity_var : Vector2, delta_var : float) -> void:
	velocity = velocity_var
