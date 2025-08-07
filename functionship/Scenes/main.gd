extends Node2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ESC"):
		get_tree().quit()


#Damage edit
func _on_more_damage_pressed() -> void:
	$Ship.increase_damage(1)

func _on_less_damage_pressed() -> void:
	$Ship.increase_damage(-1)


#Amount edit
func _on_more_amount_pressed() -> void:
	$Ship.increase_amount(1)

func _on_less_amount_pressed() -> void:
	$Ship.increase_amount(-1)


#Burst edit
func _on_more_burst_pressed() -> void:
	$Ship.increase_burst(1)

func _on_less_burst_pressed() -> void:
	$Ship.increase_burst(-1)

#Trigonometrics
func _on_more_trig_pressed() -> void:
	$Ship.level_up_trig(1)

func _on_less_trig_pressed() -> void:
	$Ship.level_up_trig(-1)
