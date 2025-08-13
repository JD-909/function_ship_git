class_name PlayerShip
extends CharacterBody2D

@export var speed : float = 400
@export var damage : float = 1
@export var amount : int = 1
@export var burst : int = 1
@export var fireRate : float = 1
@export var spreadAngle : float = TAU/36												#siendo TAU=2*PI=360 grados y TAU/36=10 grados
@export var bulletArraySize : int = 1

var initialAngle : float
var bulletArray : Array[Resource] = [Globals.linearBulletResource,Globals.sineBulletResource,Globals.cosineBulletResource,Globals.negSineBulletResource,Globals.negCosineBulletResource]

func _ready() -> void:
	$ShootTimer.wait_time = 1.0/(fireRate)
	initialAngle = (spreadAngle/2)*(amount-1)
	$OrbitalWeapon.orbitDamage = damage

func _physics_process(delta: float) -> void:
	
	# Movement handler
	var input_vector = Input.get_vector("leftShip","rightShip","upShip","downShip")
	
	velocity = input_vector*speed
	move_and_slide()
	# End


#STATS EDITORS:
#DMG
func increase_damage(scalar: float) -> void:
	if damage+scalar >= 0:
		damage = damage + scalar
		$OrbitalWeapon.orbitDamage = damage
		$"../UI/VBoxContainer/Damage/Number".text = str(damage)

#AMNT
func increase_amount(scalar: int) -> void:
	if amount+scalar >= 0:
		amount = amount + scalar
		initialAngle = (spreadAngle/2)*(amount-1)
		$"../UI/VBoxContainer/Amount/Number".text = str(amount)

#BRST
func increase_burst(scalar: int) -> void:
	if burst+scalar >= 1:
		burst = burst + scalar
		$"../UI/VBoxContainer/Burst/Number".text = str(burst)

#TRIG
func level_up_trig(scalar: int) -> void:
	if bulletArraySize+scalar >= 1 and bulletArraySize+scalar <= 5:
		bulletArraySize = bulletArraySize + scalar
		$"../UI/VBoxContainer/Trigonometrics/Number".text = str(bulletArraySize-1)

#ORBIT STATS
#N
func increase_orbit_n(scalar: int) -> void:
	$OrbitalWeapon.n = $OrbitalWeapon.n + scalar
	$"../UI/VBoxContainer/Orbit_N/Number".text = str($OrbitalWeapon.n)

#D
func increase_orbit_d(scalar: int) -> void:
	if ($OrbitalWeapon.d + scalar >= 1):
		$OrbitalWeapon.d = $OrbitalWeapon.d + scalar
		$"../UI/VBoxContainer/Orbit_D/Number".text = str($OrbitalWeapon.d)

#SHOOTING HANDLER
func shoot() -> void:
	for n in burst:
		for i in bulletArraySize:												#todas las balas a disparar
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
				projectileInstance.bulletDamage = damage + bulletArraySize-2
				get_parent().get_node("Proyectiles").add_child(projectileInstance)
		#shooting sound
		#$AudioStreamPlayer2D.play()
		$BurstTimer.start()
		await $BurstTimer.timeout
	
	$ShootTimer.start()

func _on_shoot_timer_timeout() -> void:
	shoot()
	$ShootTimer.stop()

#DYING
func die() -> void:
	global_position = Vector2(640, 416)
	_ready()
