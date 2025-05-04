extends Node2D

const ANIMAL = preload("res://scenes/animal/animal.tscn")
@onready var start_position: Marker2D = $StartPosition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_animal_died.connect(on_animal_died)
	spawn_animal()


func spawn_animal()->void:
	var animal=ANIMAL.instantiate()
	animal.position=start_position.position
	add_child(animal)

func on_animal_died()->void:
	spawn_animal()
	
