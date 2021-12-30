
require_relative '../data/row_data'

module RowBuilder

  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]
    cols = []

    xmldata.elements.each do |i|
      case i.name
      when 'col'
        cols += [i.text.to_s]
      else
        raise "ERROR columnas"
      end
    end

    if xmldata.elements.count.zero?
      cols = [xmldata.text.strip.to_s]
    end

    row_data = RowData.new(parent: parent,
                           cols: cols)
    row_data
  end
end
