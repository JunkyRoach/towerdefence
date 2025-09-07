extends PathFollow2D
class_name Enemy
var enemy_data:EnemyData


static func instantiate(p_enemy_data:EnemyData)->Enemy:
	var enemy:Enemy = preload("res://scenes/units/Enemy.tscn").instantiate()
	enemy.update_data(p_enemy_data)
	return enemy


var speed:float

func update_data(p_enemy_data:EnemyData):
	GameController.mission_lose.connect(destroy)
	enemy_data = p_enemy_data
	speed = enemy_data.speed


func _process(delta: float) -> void:
	self.progress += self.speed * delta
	if self.progress_ratio >=1.0:
		_reach_path_end()


func _reach_path_end():
	GameController.enemy_reach_end(enemy_data)
	destroy()


func destroy():
	self.queue_free()
	
	pass
