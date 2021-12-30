
require_relative '../data/row_data'

module RowBuilder

  def self.build(xml_data)
    if xml_data.elements.count.zero?
      value = xml_data.text.strip.to_s
      row_data = RowData.new(value: value)
      return row_data
    end

    cols = []
    xml_data.elements.each do |i|
      case i.name
      when 'col'
        cols += [i.text.to_s]
      else
        raise "ERROR columnas"
      end
    end

    row_data = RowData.new(cols: cols)
  end
end
