# frozen_string_literal: false

require 'rexml/document'
require_relative '../data/row_data'

module TemplateBuilder

  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]

    var_name = xmldata.attributes.keys.first
    var_values = xmldata.attributes[0].split(',')
    rows = []

    xmldata.root.elements.each do |i|
      rows += RowBuild.build(xmldata: i, parent: parent)
    end

    template_data = TemplateData.new(var_name: var_name,
                                     var_values: var_values,
                                     parent: parent)
    template_data.rows = rows
    template_data
  end
end
