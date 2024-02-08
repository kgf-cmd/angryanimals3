extends TextureButton

const HOVER_SCALE: Vector2 = Vector2(1.1, 1.1)
const DEFAULT_SCALE: Vector2 = Vector2(1.0, 1.0)
@onready var level_label = $MC/VBoxContainer/LevelLabel

@onready var score_label = $MC/VBoxContainer/ScoreLabel


@export var level_number: int = 1

var _level_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	level_label.text = str(level_number)
	_level_scene = load("res://scenes/Level/level%s.tscn" % level_number)




func _on_pressed():
	get_tree().change_scene_to_packed(_level_scene)


func _on_level_label_mouse_entered():
	scale = HOVER_SCALE


func _on_level_label_mouse_exited():
	scale = DEFAULT_SCALE
