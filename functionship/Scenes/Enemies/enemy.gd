class_name Enemy
extends CharacterBody2D

func recieve_damage(damage : float):
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.die()
