extends Node2D

var capital_scene: PackedScene = preload("res://scenes/Capital.tscn")

func _ready() -> void:
    var capital = capital_scene.instantiate()
    capital.global_position = Vector2(1000, 1000)
    add_child(capital)