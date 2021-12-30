# frozen_string_literal: true

require 'rexml/document'
require_relative '../data/def_data'
require_relative '../data/concept_data'
require_relative 'table_builder'

module ConceptBuilder

  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]
    names = []
    tags = []
    datadefs = []
    tables = []
    xmldata.elements.each do |i|
      case i.name
      when 'names'
        names = process_names(i)
      when 'tags'
        tags += process_tags(i)
      when 'def'
        datadefs += process_def(xmldata: i, parent: parent)
      when 'table'
        tables += [TableBuilder.build(xmldata: i, parent: parent)]
      else
        raise "[ERROR] Concept #{name} with unkown attribute: #{i.name}"
      end
    end
    concept_data = ConceptData.new(names: names,
                                   tags: tags,
                                   defs: datadefs,
                                   tables: tables,
                                   parent: parent)
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
    parent = args[:parent]
    type = xmldata.attributes['type']
    if type == 'image_url' or type == 'file' or type.nil?
      value = xmldata.text.strip
      return [DefData.new(type: type, value: value, parent: parent)]
    else
      raise "[ERROR] Unknown type: #{value.attributes['type']}"
    end
  end
end
