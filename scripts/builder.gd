extends Node2D
class_name Builder

signal cycle_completed(city: Node)

@@export var speed: float = 100.0

var built_city: Node = null
var return_path: Array[Vector2] = []
var travel_path: Array[Vector2] = []
var returning: bool = false
var direction: Vector2 = Vector2.ZERO
var rng := RandomNumberGenerator.new()

func _ready() -> void:
    rng.randomize()
    direction = Vector2.RIGHT.rotated(rng.randf() * TAU).normalized()
    return_path.append(global_position)

func _physics_process(delta: float) -> void:
    if returning:
        _return_step(delta)
    else:
        _explore_step(delta)

func _explore_step(delta: float) -> void:
    global_position += direction * speed * delta
    return_path.append(global_position)
    if not Influence.is_influenced(global_position):
        _build_city()
        travel_path = return_path.duplicate() as Array[Vector2]
        travel_path.reverse()
        returning = true

func _return_step(delta: float) -> void:
    if travel_path.is_empty():
        _arrive_at_capital()
        return
    var target: Vector2 = travel_path[0]
    var to_target: Vector2 = target - global_position
    var max_dist: float = speed * delta
    if to_target.length() <= max_dist:
        global_position = target
        travel_path.remove_at(0)
    else:
        global_position += to_target.normalized() * max_dist

func _build_city() -> void:
    var city_scene: PackedScene = preload("res://scenes/City.tscn")
    built_city = city_scene.instantiate()
    built_city.global_position = global_position
    get_tree().current_scene.add_child(built_city)

func _arrive_at_capital() -> void:
    if built_city and return_path.size() > 0:
        Roads.create_road(return_path, built_city)
    cycle_completed.emit(built_city)
    queue_free()
