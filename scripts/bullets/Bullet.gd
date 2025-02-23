class_name Bullet
extends RigidBody2D

@export var collision_shape: CollisionShape2D
@export var hitbox: HitboxComponent
@export var attack_component: AttackComponent
@export var bullet_resource: BulletResource

var active: bool

func _ready():
	hitbox.connect("hit", _on_hit)

func activate():
	active = true
	show()
	collision_shape.disabled = false
	hitbox.monitoring = true

func deactivate():
	freeze = true
	active = false
	hide()
	if collision_shape:
		collision_shape.disabled = true
	if hitbox:
		hitbox.monitoring = false
	
func set_attack_data(attack_resource: AttackResource):
	if attack_component:
		attack_component.set_attack_resource(attack_resource)

func set_bullet_resource(new_bullet_resource: BulletResource):
	bullet_resource = new_bullet_resource.duplicate() # Might need to change to (true) if I want large data structures

func _on_hit():
	if bullet_resource.pierces <= 0:
		deactivate()
