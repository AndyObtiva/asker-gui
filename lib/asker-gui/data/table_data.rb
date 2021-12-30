
class TableData
  attr_reader :fields
  attr_reader :secuence
  attr_reader :rows
  attr_reader :templates

  def initialize
    @fields = []
    @sequence = nil
    @rows = []
    @templates = []
  end
end
