class_name RealEnemy
extends Enemy

var health : float = 1
var speed : float = 0

func recieve_damage(damage : float):
	health = health - damage
	if health <=0 :
		queue_free()
