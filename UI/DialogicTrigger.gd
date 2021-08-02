extends Node2D

onready var animatedSprite = $AnimatedSprite
export(String) var dialog = ""
signal dialog_finished
signal dialog_started

func _ready():
	animatedSprite.visible = false
	
func _input(event):
	if get_node_or_null("DialogNode") == null:
		if event.is_action_pressed("ui_select") && animatedSprite.visible:
			get_tree().paused = true
			var dialog = Dialogic.start("mom1")
			# emit_signal("dialog_started")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect("timeline_end", self, "unpause")
			add_child(dialog)
			

func unpause(_param):
	print(_param)
	get_tree().paused = false
	# emit_signal("dialog_finished")

func _on_DialogicTrigger_body_entered(body):
	animatedSprite.visible = true

func _on_DialogicTrigger_body_exited(body):
	animatedSprite.visible = false
