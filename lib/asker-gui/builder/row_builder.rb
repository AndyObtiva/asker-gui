
require_relative '../data/row_data'

module RowBuilder

  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]

    if xmldata.elements.count.zero?
      value = xmldata.text.strip.to_s
      row_data = RowData.new(value: value, parent: parent)
      return row_data
    end

    cols = []
    xmldata.elements.each do |i|
      case i.name
      when 'col'
        cols += [i.text.to_s]
      else
        raise "ERROR columnas"
      end
    end

    row_data = RowData.new(cols: cols, parent: parent)
  end
end
