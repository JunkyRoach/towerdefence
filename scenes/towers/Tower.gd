extends Node2D


@export var attack_range:float = 300.0
@export var reload_time:float = 1.0

@onready var timer: Timer = $Timer

var current_target:Enemy

func _ready() -> void:
	timer.wait_time = reload_time
	timer.start()
	pass


func _draw() -> void:
	draw_circle(Vector2.ZERO, attack_range,Color.GREEN, false, 2, true)
	if current_target != null:
		draw_line(Vector2.ZERO, to_local(current_target.global_position), Color.RED, 2)


func _process(delta: float) -> void:
	current_target = EnemyManager.get_dangerous_enemy_in_range(self.global_position, attack_range)
	queue_redraw()

func attack():
	
	
	
	print('Tower Attack')
	pass


func _on_timer_timeout() -> void:
	attack()
	pass # Replace with function body.
