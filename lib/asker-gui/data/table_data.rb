
class TableData
  attr_accessor :fields
  attr_accessor :sequence
  attr_accessor :rows
  attr_accessor :templates

  def initialize(args)
    @parent = args[:parent]
    @fields = []
    @sequence = nil
    @rows = []
    @templates = []
  end
end
