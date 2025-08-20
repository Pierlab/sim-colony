extends Node2D
class_name Inhabitant

@export var speed: float = 100.0
var path: Array[Vector2] = []
var city: Node = null

func _ready() -> void:
    var sprite := Sprite2D.new()
    sprite.texture = preload("res://assets/sprites/inhabitant.png")
    add_child(sprite)

func set_path(path_points: Array[Vector2], target_city: Node) -> void:
    path = path_points.duplicate() as Array[Vector2]
    city = target_city

func _physics_process(delta: float) -> void:
    if path.is_empty():
        if city:
            city.occupy()
        queue_free()
        return
    var target: Vector2 = path[0]
    var to_target: Vector2 = target - global_position
    var max_dist: float = speed * delta
    if to_target.length() <= max_dist:
        global_position = target
        path.remove_at(0)
    else:
        global_position += to_target.normalized() * max_dist
