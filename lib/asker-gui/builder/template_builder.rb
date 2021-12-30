# frozen_string_literal: false

require 'rexml/document'
require_relative '../data/row_data'

module TemplateBuilder

  def self.build(xml)
    var_name = xml.attributes.keys.first
    var_values = xml.attributes[0].split(',')

    rows = []

    xml.root.elements.each do |i|
      rows += RowBuild.build(i)
    end

    template_data = TemplateData.new(var_name: var_name, var_values: var_values)
    template_data.rows = rows
    template_data
  end
end
