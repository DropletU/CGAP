extends CharacterBody3D

@onready var health_component: HealthComponent = $HealthComponent

@export_range(1, 1000) var hp: int = 100

func _ready() -> void:
	health_component.health_changed.connect(_on_health_changed)
	health_component.max_health_changed.connect(_on_max_health_changed)
	

func _on_max_health_changed():
	pass
	

func _on_health_changed():
	pass
	

func take_damage(damage: int, attacker: Node3D = null):
	health_component.take_damage(damage, attacker)
	

func heal(health: int):
	health_component.heal(health)
	
