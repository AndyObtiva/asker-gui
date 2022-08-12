# frozen_string_literal: true

require 'haml'

# HAML file loader
module HamlLoader
  def self.load(filepath)
    template = File.read(filepath)
    haml_engine = Haml::Engine.new(template)
    haml_engine.render
  end
end
