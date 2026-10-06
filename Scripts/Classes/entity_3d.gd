class_name Entity3D extends CharacterBody3D

@export var speed = 600.0
@export var jump_velocity = 6.0
@export_category("Components")
@export var health_component: HealthComponent = null
@export var hurtbox: HurtboxComponent3D = null
@export var movement_component: MovementComponent = null

func _ready() -> void:
	assert(hurtbox, str(self.get_path(), " has no child of type HurtboxComponent3D or has not yet been assigned one."))
	assert(health_component, str(self.get_path(), " has no child of type HealthComponent or has not yet been assigned one."))
	if not movement_component:
		push_warning(self.get_path(), " has no child of type MovementComponent or has not yet been assigned one.")
	hurtbox.hit_received.connect(_on_hit_received)
	health_component.died.connect(_on_died)
	

func _on_hit_received(damage: int, attacker: Node3D):
	health_component.take_damage(damage, attacker)
	

## Heals through the [HealthComponent]
func heal(health: int):
	health_component.heal(health)
	

## Disables the [HurtboxComponent3D]
func _on_died():
	hurtbox.disable()
	
