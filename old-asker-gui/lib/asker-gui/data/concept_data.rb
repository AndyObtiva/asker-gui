
class ConceptData
  attr_accessor :parent
  attr_accessor :names
  attr_accessor :tags
  attr_accessor :defs
  attr_accessor :tables

  def initialize(args)
    @parent = args[:parent]
    @names = args[:names] || []
    @tags = args[:tags] || []
    @defs = args[:defs] || []
    @tables = args[:tables] || []
  end
end
