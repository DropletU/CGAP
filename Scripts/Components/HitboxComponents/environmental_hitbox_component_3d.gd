class_name EnvironmentalHitboxComponent3D extends HitboxComponent3D

func _ready() -> void:
	super._ready()
	
	collision_mask = (1 << 3) | (1 << 4)
	
