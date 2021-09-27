extends Node2D

var positions = [
	Vector2(200,200)
	,Vector2(912,200)
	,Vector2(912,400)
	,Vector2(200,400)
]

var Enemy = preload("res://Enemy/Enemy.tscn")
var num_enemies = 1
var respawning = false

var Enemy2 = preload("res://Enemy/Enemy2.tscn")
var num_enemies2 = 1
var respawning2 = false

func _ready():
	randomize()

func _physics_process(_delta):
	if (get_child_count()-1 < num_enemies) and (!respawning) and (!respawning2):
		$Respawn.start()
		respawning = true
		respawning2 = true

func add_enemy():
	var enemy = Enemy.instance()
	var enemy2 = Enemy2.instance()
	enemy.position = positions[randi() % positions.size()] + Vector2(randf()*100, randf()*100).rotated(randf()*2*PI)
	enemy2.position = positions[randi() % positions.size()] + Vector2(randf()*100, randf()*100).rotated(randf()*2*PI)
	add_child(enemy)
	add_child(enemy2)
	num_enemies = 1 + floor(Global.score / 100)


func _on_Respawn_timeout():
	add_enemy()
	respawning = false
	respawning2 = false

