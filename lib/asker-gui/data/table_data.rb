
class TableData
  attr_accessor :parent
  attr_accessor :fields
  attr_accessor :sequence
  attr_accessor :rows
  attr_accessor :templates

  def initialize(args)
    @parent = args[:parent]
    @fields = args[:fields] || []
    @sequence = args[:sequence] || ''
    @rows = args[:rows] || []
    @templates = args[:templates] || []
  end
end
