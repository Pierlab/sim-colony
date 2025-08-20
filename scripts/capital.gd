extends Node2D

@@export var influence_radius: float = 250.0
var resources: Dictionary = {}
const Inhabitant = preload("res://scripts/inhabitant.gd")

func add_resource(resource_type: String, amount: int) -> void:
    resources[resource_type] = resources.get(resource_type, 0) + amount

func get_resource(resource_type: String) -> int:
    return resources.get(resource_type, 0)

func spawn_builder() -> Node:
    var builder_scene: PackedScene = preload("res://scenes/Builder.tscn")
    var builder = builder_scene.instantiate()
    builder.global_position = global_position
    builder.cycle_completed.connect(_on_builder_cycle_completed)
    get_tree().current_scene.add_child(builder)
    return builder

func _on_builder_cycle_completed(city: Node) -> void:
    spawn_inhabitant(city)

func spawn_inhabitant(_city: Node) -> void:
    var inhabitant: Node2D = Inhabitant.new()
    inhabitant.global_position = global_position
    inhabitant.set_path(Roads.get_path_to(_city), _city)
    get_tree().current_scene.add_child(inhabitant)
