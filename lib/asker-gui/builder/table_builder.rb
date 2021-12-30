# frozen_string_literal: true

require 'rexml/document'
require_relative '../data/table_data'
require_relative 'row_builder'
require_relative 'template_builder'

module TableBuilder
  def self.build(xml_data)

    fields = xml_data.attributes['fields'].to_s.strip.split(',')
    fields.each(&:strip!)
    fields = fields || []

    sequence = []
    if xml_data.attributes['sequence']
      sequence = xml_data.attributes['sequence'].to_s.split(',')
    end

    table_data = TableData.new(:fields => fields, :sequence => sequence)
    rows, templates = read_data_from_xml(xml_data)
    table_data.rows = rows
    table_data.templates = templates
    table_data
  end

  def self.read_data_from_xml(xml_data)
    rows = []
    templates = []
    xml_data.elements.each do |i|
      case i.name
      when 'row'
        rows += [RowBuilder.build(i)]
      when 'template'
        templates += [TemplateBuilder.build(i)]
      else
        raise "[ERROR] concept/table#xml_data with #{i.name}"
      end
    end
    [ rows, templates ]
  end

end
