
class RowData
  attr_accessor :cols
  attr_accessor :value

  def initialize(args)
    @parent = args[:parent]
    @cols = args[:cols] || []
    @value = args[:value] || ''
  end
end
