class_name HitboxComponent3D extends Area3D

var collider: CollisionShape3D = null
var attacker: Node3D = null

@export var damage: int = 10

func _ready() -> void:
	for child in get_children():
		if child is CollisionShape3D:
			collider = child
	assert(collider, str("HitboxComponent3D: ", self.get_path(), " has no child of type CollisionShape3D."))
	
	collision_layer = 0
	disable()
	area_entered.connect(_on_area_entered)
	

func enable():
	monitoring = true
	

func disable():
	monitoring = false
	

func _on_area_entered(area: Area3D) -> void:
	if area is HurtboxComponent3D:
		area.hit(damage, attacker)
	
