extends CanvasLayer

@onready var bullet_label: Label = $bullet_counter/VBoxContainer/Label
@onready var grenade_label: Label = $grenade_counter/VBoxContainer/Label

func _ready():
	update_bullet_counter()
	update_grenade_counter()

func update_bullet_counter():
	bullet_label.text = str(Globals.bullets)

func update_grenade_counter():
	grenade_label.text = str(Globals.grenade)
