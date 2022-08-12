extends Control

func _ready():
	init_item_list()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func init_item_list():
	var basedir = get_node("panel/path").text
	var command = " " #+ basedir
	var output = []
	# execute ( String path, PoolStringArray arguments, 
	#           bool blocking=true, Array output=[ ], 
	#           bool read_stderr=false, bool open_console=false )
	var exitcode = OS.execute("ls", [basedir], true, output)
	var items = output[0].split("\n")

	for filename in items:
		$panel/item_list.add_item(filename, null, true)

func _on_refresh_pressed():
	init_item_list()
