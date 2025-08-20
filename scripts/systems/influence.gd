extends Node
class_name Influence

static var zones: Array[Dictionary] = []

static func add_zone(position: Vector2, radius: float) -> void:
    zones.append({"position": position, "radius": radius})

static func is_influenced(position: Vector2) -> bool:
    for zone in zones:
        if position.distance_to(zone["position"]) <= zone["radius"]:
            return true
    return false

