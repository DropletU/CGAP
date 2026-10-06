class_name MovementComponent extends Node

func apply_horizontal_movement(entity: Entity3D, direction: Vector3, delta: float, speed_multi: float):
	if direction:
		entity.velocity.x = direction.x * entity.speed*delta * speed_multi
		entity.velocity.z = direction.z * entity.speed*delta * speed_multi
	else:
		entity.velocity.x = move_toward(entity.velocity.x, 0, entity.speed)
		entity.velocity.z = move_toward(entity.velocity.z, 0, entity.speed)
	

func apply_gravity(entity: Entity3D, delta: float):
	if not entity.is_on_floor():
		entity.velocity += entity.get_gravity() * delta * 2
	

func apply_jump(entity: Entity3D):
	entity.velocity.y += entity.jump_velocity
	
