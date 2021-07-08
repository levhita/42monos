extends Node2D

export(String, "Wheat", "Rice") var crop = "Wheat"

onready var animatedSprite = $AnimatedSprite
onready var collision = $StaticBody2D/CollisionShape2D

func _ready():
	var cropToLoad = "res://World/Props/Crops/" + crop + ".tres"
	var cropSpriteFrames = load(cropToLoad)
	animatedSprite.frames = cropSpriteFrames
	
func destroy():
	collision.set_deferred('disabled', true)
	animatedSprite.play("cut")

func _on_Hurtbox_area_entered(_area):
	destroy()
	

func _on_Sprite_animation_finished():
	queue_free()
