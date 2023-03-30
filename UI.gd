extends CanvasLayer
var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$WinMessage.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_coin_body_entered(body):
	score += 1
	$CoinsCollected.text = "Coins collected: " + str(score)


func _on_WinPlane_body_entered(body):
	$WinMessage.show()
