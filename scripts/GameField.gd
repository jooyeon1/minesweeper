extends Node2D

var scene: PackedScene = load('res://unopened_tile.tscn')
var tile_array = []

# Modules
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_tiles(16, 16, 40)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_tiles(x, y, num):
	var current_pos = Vector2(0, 0)
	
	for i in range(y):
		for j in range(x):
			var inst = scene.instantiate()
			inst.position = current_pos
			tile_array.append(inst)
			
			current_pos.x += 16
		
		current_pos.x = 0; current_pos.y += 16
	
	spawn_mines(num)
	for mine in tile_array:
		add_child(mine)


func spawn_mines(num):
	for _i in range(num):
		var i = rng.randi_range(0, tile_array.size() - 1)		
		while tile_array[i].mine:
			i = rng.randi_range(0, tile_array.size() - 1)
			
		tile_array[i].mine = true
			
