extends CharacterBody3D

@onready var material = get_node("MeshInstance3D").mesh.material
@onready var collider = $CollisionShape3D
@onready var original_color = "#ff312e"

@export_range(1, 1000) var hp: int = 100


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test_key"):
		injured(10)
	

func injured(damage: int):
	hp-=damage
	if hp == 0:
		material.albedo_color = Color(1.0, 0.323, 0.272, 1.0)
		return
	
	material.albedo_color = Color("#ffadad")
	
	if material.albedo_color != Color(original_color):
		await get_tree().create_timer(0.15).timeout
		material.albedo_color = Color(original_color)
	
