
class RowData
  attr_accessor :cols
  attr_accessor :value

  def initialize(args)
    @cols = args[:cols] || []
    @value = args[:value] || ''
  end
end
