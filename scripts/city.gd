extends Node2D

@export var influence_radius: float = 250.0

func _ready() -> void:
    Influence.add_zone(global_position, influence_radius)

