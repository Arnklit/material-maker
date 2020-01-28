tool
extends Node

var type_names : Array = []
var types : Dictionary = {}

func _ready():
	var file = File.new()
	if file.open("res://addons/material_maker/nodes/io_types.mmt", File.READ) != OK:
		print("Cannot read types")
		return false
	var type_list = parse_json(file.get_as_text())
	file.close()
	for t in type_list:
		if t.has("label"):
			type_names.push_back(t.name)
		var c = t.color
		t.color = Color(c.r, c.g, c.b, c.a)
		if file.open("res://addons/material_maker/nodes/preview_"+t.name+".shader", File.READ) == OK:
			t.preview = file.get_as_text()
			file.close()
		types[t.name] = t
