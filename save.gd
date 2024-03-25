extends Node

var savePath = "res://saveFile.cfg"
var config = ConfigFile.new()
var loadResponse = config.load(savePath)

#saves thing to cfg file
func saveValue(section, key, value):
	config.set_value(section, key, value)
	config.save(savePath)
#get value for use	
func loadValue(section, key, default):
	return config.get_value(section, key, default)
