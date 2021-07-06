extends Node2D

onready var animatedSprite = $AnimatedSprite

func destroy():
	animatedSprite.play("cut")
	pass

func _on_Hurtbox_area_entered(area):
	destroy()
	


func _on_Sprite_animation_finished():
	queue_free()
