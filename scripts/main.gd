extends Node2D

const WORLD_SIZE := Vector2i(2000, 2000)

var capital_scene: PackedScene = preload("res://scenes/Capital.tscn")

@onready var tile_map: TileMap = $TileMap
var capital: Node2D

var simulation_time: float = 0.0
var event_queue: Array = []

func _ready() -> void:
    # Populate the world with plain tiles
    var tile_id := 0
    for x in range(WORLD_SIZE.x):
        for y in range(WORLD_SIZE.y):
            tile_map.set_cell(0, Vector2i(x, y), tile_id)
    # Instantiate the capital at the center of the world
    capital = capital_scene.instantiate()
    capital.global_position = WORLD_SIZE / 2
    add_child(capital)
    # Register the capital influence and spawn the first builder
    Influence.add_zone(capital.global_position, capital.influence_radius)
    capital.spawn_builder()

func _process(delta: float) -> void:
    simulation_time += delta
    _process_events()

func schedule_event(delay: float, action: Callable) -> void:
    event_queue.append({"time": simulation_time + delay, "action": action})
    event_queue.sort_custom(func(a, b): return a["time"] < b["time"])

func _process_events() -> void:
    while event_queue.size() > 0 and event_queue[0]["time"] <= simulation_time:
        var event = event_queue.pop_front()
        var action: Callable = event["action"]
        action.call()
