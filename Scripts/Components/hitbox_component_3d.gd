class_name HitboxArea3D extends Area3D
## An [Area3D] that detects [HurtboxComponent3D]'s
## and hits them. 

var collider: CollisionShape3D = null
var attacker: Node3D = null


@export var damage: int = 10
@export_subgroup("can_hit", "can_hit")
@export var can_hit_player: bool = false
@export var can_hit_enemy: bool = true
@export var can_hit_ally: bool = false

func _ready() -> void:
	for child in get_children():
		if child is CollisionShape3D:
			collider = child
	assert(collider, str("HitboxComponent3D: ", self.get_path(), " has no child of type CollisionShape3D."))
	
	collision_layer = 0
	area_entered.connect(_on_area_entered)
	_set_masks()
	

func enable():
	monitoring = true
	

func disable():
	monitoring = false
	

func _on_area_entered(area: Area3D) -> void:
	if area is HurtboxComponent3D:
		area.hit(damage, attacker)
	

func _set_masks():
	set_collision_mask_value(3, can_hit_player)
	set_collision_mask_value(5, can_hit_enemy)
	set_collision_mask_value(7, can_hit_ally)
	
