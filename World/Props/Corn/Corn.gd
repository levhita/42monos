extends Node2D

const Effect = preload("res://Effects/effect.tscn")

func create_grass_effect():
	var effect = Effect.instance()
	get_parent().add_child(effect)
	effect.position = position

func _on_Hurtbox_area_entered(area):
	create_effect()
	queue_free()
