class_name PlayerHitboxComponent3D extends HitboxComponent3D

func _ready() -> void:
	super._ready()
	
	collision_mask = 1 << 4
	
	# TODO: Call attacker = GameManager.player here when the game manager is made
	
