extends Control
const MAIN = preload("res://scenes/main/main.tscn")
@onready var level_label: Label = $MarginContainer/VB/LevelLabel
@onready var attempts: Label = $MarginContainer/VB/Attempts
@onready var game_sound: AudioStreamPlayer = $GameSound
@onready var vb_2: VBoxContainer = $MarginContainer/VB2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text= "LEVEL %s" %ScoreManager.get_level_selected()
	update_attempts(0)
	SignalManager.on_score_updated.connect(update_attempts)
	SignalManager.on_level_complete.connect(on_level_complete)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu")==true:
		get_tree().change_scene_to_packed(MAIN)


func update_attempts(attemptsNumber:int)->void:
	attempts.text="Attempts %s" %attemptsNumber

func on_level_complete()->void:
	vb_2.show()
	game_sound.play()
