
class RowData
  attr_accessor :parent
  attr_accessor :cols

  def initialize(args)
    @parent = args[:parent]
    @cols = args[:cols] || []
  end
end
