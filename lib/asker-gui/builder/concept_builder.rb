# frozen_string_literal: true

require 'rexml/document'
require_relative '../data/def_data'
require_relative 'table_builder'

module ConceptBuilder

  def self.build(xml_data)
    tags = []
    datadefs = []
    tables = []
    xml_data.elements.each do |i|
      case i.name
      when 'names'
        names = process_names(i)
      when 'tags'
        tags += process_tags(i)
      when 'def'
        datadefs += process_def(i)
      when 'table'
        tables += [TableBuilder.build(i)]
      else
        raise "[ERROR] Concept #{name} with unkown attribute: #{i.name}"
      end
    end
  end

  def self.process_names(value)
    names = []
    values = value.text.split(',')
    values.each { |item| names << item.strip }
    names
  end

  def self.process_tags(value)
    if value.text.nil? || value.text.size.zero?
      raise("[ERROR] Concept #{name} has tags empty!")
    end

    tags = value.text.split(',')
    tags.collect!(&:strip)
  end

  def self.process_def(value)
    type = value.attributes['type']
    if type == 'image_url' or type == 'file' or type.nil?
      value = value.text.strip
      return [DefData.new(type: type, value: value)]
    else
      raise "[ERROR] Unknown type: #{value.attributes['type']}"
    end
  end
end
