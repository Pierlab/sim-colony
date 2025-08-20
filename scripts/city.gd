extends Area2D

signal road_connected(road: Node)

@export var influence_radius: float = 250.0
var occupied: bool = false
var connected_road: Node = null

func occupy() -> void:
    if occupied:
        return
    Influence.add_zone(global_position, influence_radius)
    occupied = true

func connect_road(road: Node) -> void:
    connected_road = road
    road_connected.emit(road)
