extends Node

@export var mob_spawner: MobSpawner
@export var initial_spawn_rate: float = 60.0
@export var mobs_increses_per_minutes: float = 30.0
@export var wave_duration: float = 20.0
@export var break_intensity: float = 0.5

var time: float = 0.0

func _process(delta: float) -> void:
	if GameManager.is_game_over: return
	
	time += delta
	
	#Dificuldade linear
	var spawn_rate = initial_spawn_rate + mobs_increses_per_minutes * (time/60)
	var sin_wave = sin((time*TAU) / wave_duration)
	var wave_factor = remap(sin_wave, -1.0, 1.0, break_intensity, 1)
	spawn_rate *= wave_factor
	
	#Aplicar dificuldade
	mob_spawner.mobs_per_minute = spawn_rate
