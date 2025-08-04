class_name Enemy
extends CharacterBody2D

var damage_recieved : float = 0

func _ready() -> void:
	$DamageLabel.text = str(damage_recieved)

func recieve_damage(damage : float):
	damage_recieved = damage_recieved + damage
	$DamageLabel.text = str(damage_recieved)
