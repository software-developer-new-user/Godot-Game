class_name Stats
extends Node

signal health_changed
signal energy_changed

@export var max_health: int = 4
@export var max_energy: float = 10
@export var energy_regen: float = 0.8

@onready var health: int = max_health:
	set(v):
		v = clampi(v, 0, max_health)
		if health == v:
			return
		health = v
		print(health)
		health_changed.emit()

@onready var energy: float = 0:
	set(v):
		v = clampf(v, 0, max_energy)
		if energy == v:
			return
		energy = v
		energy_changed.emit()


func _process(delta: float) -> void:
	#energy += energy_regen * delta
	pass


func to_dict() -> Dictionary:
	return {
		max_energy=max_energy,
		max_health=max_health,
		health=health,
		energy = 0,
	}


func from_dict(dict: Dictionary) -> void:
	max_energy = dict.max_energy
	max_health = dict.max_health
	health = dict.health
