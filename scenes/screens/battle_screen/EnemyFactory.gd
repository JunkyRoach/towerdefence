extends Node

@export var path:Path2D


func _ready() -> void:
	GameController.batlle_started.connect(spawn_mobs)
	
	pass



func spawn_mobs():
	for enemy:EnemyData in GameController.mission_data.waves[GameController.current_wave].enemies_in_wave:
		path.add_child(Enemy.instantiate(enemy))
		await get_tree().create_timer(0.5).timeout
		print(enemy)
	
	pass
