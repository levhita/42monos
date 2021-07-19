extends Camera2D

onready var topLeft = $Limits/TopLeft.position
onready var bottomRight = $Limits/BottomRight.position
export(NodePath) var player_path
var player = null

func _ready():
	limit_top = topLeft.y
	limit_left = topLeft.x
	limit_bottom = bottomRight.y
	limit_right = bottomRight.x
	player = get_node(player_path)

func _physics_process(_delta):
	var target_position = Vector2.ZERO
	target_position.x = int(lerp(global_position.x, player.position.x, 0.2))
	target_position.y = int(lerp(global_position.y, player.position.y, 0.2))
	global_position = target_position
