# frozen_string_literal: false

require 'rexml/document'
require_relative '../data/template_data'
require_relative '../builder/row_builder'

module TemplateBuilder
  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]

    var_name = xmldata.attributes.keys.first
    var_values = xmldata.attributes[var_name].split(',')
    template_data = TemplateData.new(parent: parent,
                                     var_name: var_name,
                                     var_values: var_values)

    xmldata.root.elements.each do |i|
      template_data.rows += [RowBuilder.build(xmldata: i, parent: template_data)]
    end

    template_data
  end
end
