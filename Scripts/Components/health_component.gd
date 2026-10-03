extends Node

@export_range(1, 1000) var _hp: int = 100
@export_range(1, 1000) var _max_hp: int = 100

var _alive: = true

signal damaged(damage: int, current_health: int, attacker: Node3D)
signal healed(health: int, current_health: int)
signal health_set(health: int)
signal max_health_set(max_health: int)
signal died
signal health_changed(new_hp: int)

func _ready() -> void:
	if _hp > _max_hp:
		_change_health(mini(_hp, _max_hp))
	

func _change_health(new_health: int) -> void:
	if not is_alive():
		return
	_hp = new_health
	health_changed.emit(new_health)
	

func set_max_health(amount: int) -> void:
	var new_max_hp = maxi(1, amount)
	if new_max_hp == _max_hp:
		return
	_max_hp = new_max_hp
	max_health_set.emit(_max_hp)
	
	if _max_hp<_hp:
		set_health(_max_hp)
	

func set_health(amount: int) -> void:
	if not is_alive():
		return
	var new_hp = clampi(amount, 0, _max_hp)
	if _hp==new_hp:
		return
	
	_change_health(new_hp)
	health_set.emit(_hp)
	
	if _hp == 0:
		_died()
	

func take_damage(damage: int, attacker: Node3D = null) -> void:
	if not is_alive():
		return
	if damage <= 0:
		return
	
	damage = mini(damage, _hp)
	_change_health(_hp-damage)
	damaged.emit(damage, _hp, attacker)
	
	if _hp == 0:
		_died()
	

func heal(health: int) -> void:
	if not is_alive():
		return
	if health<=0:
		return
	if _hp==_max_hp:
		return
	
	health = mini(_max_hp-_hp, health)
	_change_health(_hp+health)
	healed.emit(health, _hp)
	

func _died() -> void:
	if not is_alive():
		return
	
	_alive = false
	died.emit()
	

func get_health() -> int:
	return _hp
	

func get_max_health() -> int:
	return _max_hp
	


func is_alive() -> bool:
	return _alive
