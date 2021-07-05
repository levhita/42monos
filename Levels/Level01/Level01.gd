extends Node2D

onready var environmentAnimation = $WorldEnvironment/AnimationPlayer

func _ready():
	environmentAnimation.play("Dawn")
