
class ConceptData
  attr_reader :names
  attr_reader :tags
  attr_reader :defs
  attr_reader :tables

  def initialize
    @names = []
    @tags = []
    @defs = []
    @tables = []
  end
end
