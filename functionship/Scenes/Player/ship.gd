class_name PlayerShip
extends CharacterBody2D

@export var speed : float = 400
@export var damage : float = 1
@export var amount : int = 1
@export var burst : int = 1
@export var fireRate : float = 1
@export var spreadAngle : float = TAU/36												#siendo TAU=2*PI=360 grados y TAU/36=10 grados
@export var bulletArray : Array[Resource] = [Globals.linearBulletResource]

var initialAngle : float

func _ready() -> void:
	bulletArray.append(Globals.sineBulletResource)
	bulletArray.append(Globals.cosineBulletResource)
	bulletArray.append(Globals.negSineBulletResource)
	bulletArray.append(Globals.negCosineBulletResource)
	$ShootTimer.wait_time = 1.0/(fireRate)
	initialAngle = (spreadAngle/2)*(amount-1)
	$OrbitalWeapon.orbitDamage = damage

func _physics_process(delta: float) -> void:
	
	# Movement handler
	var input_vector = Input.get_vector("leftShip","rightShip","upShip","downShip")
	
	velocity = input_vector*speed
	move_and_slide()
	# End
	

func _on_shoot_timer_timeout() -> void:
	shoot()
	$ShootTimer.stop()


func shoot() -> void:
	for n in burst:
		for i in bulletArray.size():												#todas las balas a disparar
			var actualBullet : Resource = bulletArray[i]
			
			if i==0 :
				for j in amount:
					var projectileInstance = actualBullet.instantiate()						#instancio la bala lineal
					projectileInstance.position = Vector2(position.x, position.y)
					projectileInstance.rotation = ((-1)*initialAngle)+((j)*spreadAngle)
					projectileInstance.bulletDamage = damage
					#add bullet ot scene
					get_parent().get_node("Proyectiles").add_child(projectileInstance)
			else:
				var projectileInstance = actualBullet.instantiate()						#instancio las balas trigonometricas
				projectileInstance.position = Vector2(position.x, position.y)
				projectileInstance.bulletDamage = damage + bulletArray.size() -2
				get_parent().get_node("Proyectiles").add_child(projectileInstance)
		#shooting sound
		#$AudioStreamPlayer2D.play()
		$BurstTimer.start()
		await $BurstTimer.timeout
	
	$ShootTimer.start()
