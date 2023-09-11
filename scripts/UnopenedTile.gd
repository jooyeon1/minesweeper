extends Sprite2D

var mine: bool
var mouse_over: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if mine:
		scale = Vector2(scale.x/2, scale.y/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_unopened_tile_clickable_input_event(viewport, event, shape_idx):
	if event.type == InputEventMouseButton and event.pressed:
		print("dasdn")

