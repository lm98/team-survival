class_name Enemy extends CharacterBody2D

@export var speed: int = 20
@onready var player_team: PlayerTeam = get_node("/root/Game/PlayerTeam")
@onready var health_component = $HealthComponent

func _physics_process(_delta):
	var targets = player_team.get_members()
	var current_target = Vector2.ZERO
	var shortest_distance = INF
	for t in targets.values():
		var distance = global_position.distance_to(t.global_position)
		if distance < shortest_distance:
			shortest_distance = distance
			current_target = t.global_position
	
	var direction = global_position.direction_to(current_target)
	velocity = direction * speed
	move_and_slide()

func _on_health_component_health_depleted():
	queue_free()

func _on_hitbox_body_entered(body):
	health_component.take_damage(10)
