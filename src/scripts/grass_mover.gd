@tool
extends Node

@onready var ScatterItem = get_node("/root/World/Grass/ScatterItem")

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	ScatterItem.get_property_list()
	#ScatterItem.override_process_material.set_shader_parameter("player_pos", get_parent().global_transform.origin)
