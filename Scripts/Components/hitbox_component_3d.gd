class_name HitboxComponent3D extends Area3D

var collider: CollisionShape3D = null
var attacker: Node3D = null

@export var damage: int = 10

var already_hit: Array[HurtboxComponent3D]

enum Team { PLAYER, ENEMY, ALL }

const TARGET_MASKS := {
	Team.PLAYER: 1 << 3, 
	Team.ENEMY: 1 << 4, 
	Team.ALL: (1 << 3) | (1 << 4),
}

@export var targets: Team = Team.ALL:
	set(t):
		targets = t
		collision_mask = TARGET_MASKS[t]

func _ready() -> void:
	for child in get_children():
		if child is CollisionShape3D:
			collider = child
	assert(collider, str("HitboxComponent3D: ", self.get_path(), " has no child of type CollisionShape3D."))
	
	# Handle Layers
	collision_mask = TARGET_MASKS[targets]
	collision_layer = 0
	
	disable()
	area_entered.connect(_on_area_entered)
	

func enable():
	monitoring = true
	

func disable():
	monitoring = false
	already_hit.clear()
	

func _on_area_entered(area: Area3D) -> void:
	if area is HurtboxComponent3D:
		if area in already_hit:
			return
		area.hit(damage, attacker)
		already_hit.append(area)
	
