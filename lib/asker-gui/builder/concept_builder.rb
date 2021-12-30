# frozen_string_literal: true

require 'rexml/document'
require_relative 'def_data'
require_relative 'table_data'

module ConceptBuilder

  def build(xml_data)
    xml_data.elements.each do |i|
      case i.name
      when 'names'
        names = process_names(i)
      when 'tags'
        tags += process_tags(i)
      when 'def'
        datadef += process_def(i)
      when 'table'
        tables += [TableBuilder.buildData.new(i)]
      else
        raise "[ERROR] Concept #{name} with unkown attribute: #{i.name}"
      end
    end
  end

  def process_names(value)
    names = []
    values = value.text.split(',')
    values.each { |item| names << item.strip }
    names
  end

  def process_tags(value)
    if value.text.nil? || value.text.size.zero?
      raise("[ERROR] Concept #{name} has tags empty!")
    end

    tags = value.text.split(',')
    tags.collect!(&:strip)
  end

  def process_def(value)
    type = value.attributes['type']
    if type == 'image_url' or type == 'file' or type.nil?
      value = value.text.strip
      return [DefData.new(:type => type, :value => value)]
    else
      raise "[ERROR] Unknown type: #{value.attributes['type']}"
    end
  end
end
