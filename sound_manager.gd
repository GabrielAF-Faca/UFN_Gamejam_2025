extends Node

@onready var hit: AudioStreamPlayer = $Hit
@onready var soundtrack: AudioStreamPlayer = $Soundtrack

func play_hit_sound():
	hit.pitch_scale = Global.rng.randf_range(0.9, 1.1)
	hit.play()
	

func start_soundtrack():
	soundtrack.play()

func end_soundtrack():
	soundtrack.stop()
