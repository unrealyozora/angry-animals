extends TextureButton

const HOVER_SCALE: Vector2 = Vector2(1.1, 1.1)
const DEFAULT_SCALE: Vector2 = Vector2(1.0, 1.0)
@export var level_number: int = 1
@onready var level_label: Label = $MC/VBoxContainer/LevelLabel
@onready var score_label: Label = $MC/VBoxContainer/ScoreLabel
@onready var fade: AnimationPlayer = $Fade

var read:bool=false
var _level_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_title_animation_finsihed.connect(play_animation)
	var _best_score=ScoreManager.get_best_for_level(str(level_number))
	score_label.text=str(_best_score)
	level_label.text=str(level_number)
	_level_scene=load("res://scenes/level/level%s.tscn" % level_number)


func _on_pressed() -> void:
	if ready:
		ScoreManager.set_level_selected(level_number)
		get_tree().change_scene_to_packed(_level_scene)


func _on_mouse_entered() -> void:
	if ready:
		scale=HOVER_SCALE


func _on_mouse_exited() -> void:
	if ready:
		scale=DEFAULT_SCALE

func play_animation()->void:
	show()
	fade.play("Fade")
