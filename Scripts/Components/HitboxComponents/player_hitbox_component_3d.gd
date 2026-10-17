class_name PlayerHitboxArea3D extends HitboxArea3D

func _ready() -> void:
	super._ready()
	
	collision_mask = 1 << 4
	
	# TODO: Call attacker = GameManager.player here when the game manager is made
	
