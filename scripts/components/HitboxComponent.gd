class_name HitboxComponent
extends Area2D

@export var attack: AttackComponent

signal hit()

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D):
	if area.has_method("damage"):
		area.damage(attack)
		emit_signal("hit")
