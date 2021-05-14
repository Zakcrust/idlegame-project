extends Area2D


var directions = {
	"left" : Vector2.LEFT,
	"right" : Vector2.RIGHT
}

var init_direction : Vector2 = Vector2.ZERO
var speed : float = 300
var role = ""


var init_positions = {
	"left" : Vector2(-100,1200),
	"right" : Vector2(700,1200)
}

var rand_num : float = 0.0
var random = RandomNumberGenerator.new()


func _ready():
	random.randomize()
	rand_num = random.randf_range(0, 1)
	print(rand_num)
	if rand_num > 0.5:
		init_direction = directions.right
		global_position = init_positions.left
		$AnimatedSprite.scale.x *= init_direction.x
#		$Raycast.cast_to.x *= init_direction.x
	else:
		init_direction = directions.left
		global_position = init_positions.right
		$AnimatedSprite.scale.x *= init_direction.x
#		$Raycast.cast_to.x *= init_direction.x

	if rand_num > 0.6:
		role = "Customer"
		$Role.change_to(role)
	else:
		role = "Passby"
		$Role.change_to(role)


func _process(delta):
	on_destroy()


func on_destroy() -> void:
	if global_position.x < -300 or global_position.x > 1600:
		queue_free()
