# frozen_string_literal: true

require 'rexml/document'
require_relative '../data/def_data'
require_relative '../data/concept_data'
require_relative 'table_builder'

module ConceptBuilder

  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]
    concept_data = ConceptData.new(parent: parent)

    xmldata.elements.each do |i|
      case i.name
      when 'names'
        concept_data.names = process_names(i)
      when 'tags'
        concept_data.tags += process_tags(i)
      when 'def'
        concept_data.defs += process_def(xmldata: i, concept_data: concept_data)
      when 'table'
        concept_data.tables += [TableBuilder.build(xmldata: i, concept_data: concept_data)]
      else
        raise "[ERROR] Concept #{name} with unkown attribute: #{i.name}"
      end
    end

    concept_data
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

  def self.process_def(args)
    xmldata = args[:xmldata]
    concept_data = args[:concept_data]
    type = xmldata.attributes['type']
    if type == 'image_url' or type == 'file' or type.nil?
      value = xmldata.text.strip
      return [DefData.new(type: type, value: value, parent: concept_data)]
    else
      raise "[ERROR] Unknown type: #{value.attributes['type']}"
    end
  end
end
