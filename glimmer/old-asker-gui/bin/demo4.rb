#!/usr/bin/env ruby

puts "Ejecutando demo4"

require_relative '../lib/asker-gui/loader/file_loader'
require_relative '../lib/asker-gui/builder/map_builder'
require_relative '../lib/asker-gui/displayer/map_displayer'

content = FileLoader.load(ARGV[0])
map_data = MapBuilder.build(content)
MapDisplayer.show(map_data)
