extends Node2D

const ANIMAL = preload("res://scenes/animal/animal.tscn")
@onready var animal_start = $AnimalStart
const MAIN = preload("res://main/main.tscn")
func _ready():
	add_animal()
	SignalManager.on_animal_died.connect(add_animal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_packed(MAIN)

func add_animal() -> void:
	var animal = ANIMAL.instantiate()
	animal.position = animal_start.position
	add_child(animal)
