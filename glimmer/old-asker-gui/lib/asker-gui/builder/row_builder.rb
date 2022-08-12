
require_relative '../data/row_data'

module RowBuilder
require'pry-byebug'
  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]
    row_data = RowData.new(parent: parent)

    xmldata.elements.each do |i|
      case i.name
      when 'col'
        row_data.cols += [i.text.to_s]
      else
        raise "ERROR columnas"
      end
    end

    if xmldata.elements.count.zero?
      row_data.cols = [xmldata.text.strip.to_s]
    end

    row_data
  end
end
