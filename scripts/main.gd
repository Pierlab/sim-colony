extends Node2D
const WORLD_SIZE := Vector2i(2000, 2000)

var capital_scene: PackedScene = preload("res://scenes/Capital.tscn")

@onready var tile_map: TileMap = $TileMap
@onready var capital: Node2D = Node2D.new()

func _ready() -> void:
    # Populate the world with plain tiles
    var tile_id := 0
    for x in range(WORLD_SIZE.x):
        for y in range(WORLD_SIZE.y):
            tile_map.set_cell(0, Vector2i(x, y), tile_id)

    # Position the capital at the center of the world
    capital.name = "Capital"
    capital.position = WORLD_SIZE / 2
    add_child(capital)

func _process(delta: float) -> void:
    _simulate_step(delta)

func _simulate_step(_delta: float) -> void:
    # Placeholder for the simulation loop
    pass


func _ready() -> void:
    var capital = capital_scene.instantiate()
    capital.global_position = Vector2(1000, 1000)
    add_child(capital)

