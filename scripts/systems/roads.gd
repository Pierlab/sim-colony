extends Node
class_name Roads

static var roads: Dictionary = {}

static func create_road(points: Array[Vector2], city: Node) -> void:
    roads[city] = points.duplicate()

static func get_path_to(city: Node) -> Array[Vector2]:
    return roads.get(city, [])
