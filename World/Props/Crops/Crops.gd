extends Node2D

export(String, "Wheat", "Rice") var crop = "Wheat"
onready var animatedSprite = $AnimatedSprite

func _ready():
	var cropToLoad = "res://World/Props/Crops/" + crop + ".tres"
	var cropSpriteFrames = load(cropToLoad)
	animatedSprite.frames = cropSpriteFrames
	
func destroy():
	animatedSprite.play("cut")
	pass

func _on_Hurtbox_area_entered(area):
	destroy()
	

func _on_Sprite_animation_finished():
	queue_free()
