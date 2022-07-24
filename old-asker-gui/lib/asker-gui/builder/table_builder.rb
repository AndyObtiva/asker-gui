# frozen_string_literal: true

require 'rexml/document'
require_relative '../data/table_data'
require_relative 'row_builder'
require_relative 'template_builder'

module TableBuilder
  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]
    fields = xmldata.attributes['fields'].to_s.strip.split(',')
    fields.each(&:strip!)
    fields = fields || []

    sequence = ''
    if xmldata.attributes['sequence']
      sequence = xmldata.attributes['sequence'].to_s.strip
    end

    table_data = TableData.new(parent: parent,
                               fields: fields,
                               sequence: sequence)
    rows, templates = read_data_from_xml(xmldata: xmldata, parent: table_data)
    table_data.rows = rows
    table_data.templates = templates
    table_data
  end

  def self.read_data_from_xml(args)
    xmldata = args[:xmldata]
    parent = args[:parent]
    rows = []
    templates = []
    xmldata.elements.each do |i|
      case i.name
      when 'row'
        rows += [RowBuilder.build(xmldata: i, parent: parent)]
      when 'template'
        templates += [TemplateBuilder.build(xmldata: i, parent: parent)]
      else
        raise "[ERROR] concept/table#xml_data with #{i.name}"
      end
    end
    [ rows, templates ]
  end

end
