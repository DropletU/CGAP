class_name Entity3D extends CharacterBody3D

@export var health_component: HealthComponent
@export var hurtbox: HurtboxComponent3D

func _ready() -> void:
	assert(get_children().any(func(c): return c is HurtboxComponent3D), str("HurtboxComponent3D: ", self.get_path(), " has no child of type HurtboxComponent3D."))
	assert(get_children().any(func(c): return c is HealthComponent), str("HurtboxComponent3D: ", self.get_path(), " has no child of type HealthComponent."))
	hurtbox.hit_received.connect(_on_hit_received)
	

func _on_hit_received(damage: int, attacker: Node3D):
	health_component.take_damage(damage, attacker)
	
