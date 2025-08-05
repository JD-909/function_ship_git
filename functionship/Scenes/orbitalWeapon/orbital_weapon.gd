class_name OrbitalWeapon
extends CharacterBody2D

@export var n : float = 0
@export var d : float = 1
@export var baseRadius : float = 200
@export var theta : float = 0
@export var orbitSpeed : float = 5
@export var orbitDamage : float = 0

var radius : float = 100

func _physics_process(delta: float) -> void:
	theta = theta + delta*orbitSpeed
	radius = cos((n/d)*theta)*baseRadius
	position.x = radius*cos(theta)
	position.y = radius*sin(theta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.recieve_damage(orbitDamage+(n/d))													#mientras mas n, mejor; mientras mas d, peor
