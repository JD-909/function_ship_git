class_name OrbitalWeapon
extends CharacterBody2D

@export var n : float = 0
@export var d : float = 1
@export var radius : float = 100
@export var theta : float = 0
@export var orbitSpeed : float = 5

func _physics_process(delta: float) -> void:
	theta = theta + delta*orbitSpeed
	radius = cos((n/d)*theta)*100
	position.x = radius*cos(theta)
	position. y = radius*sin(theta)
