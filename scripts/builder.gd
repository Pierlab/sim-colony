extends Node2D
class_name Builder

var built_city: Node = null
var return_path: Array[Vector2] = []

func return_to_capital() -> void:
    if built_city and return_path.size() > 0:
        Roads.create_road(return_path, built_city)
    queue_free()
