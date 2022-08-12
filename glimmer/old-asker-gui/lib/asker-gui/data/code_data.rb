
class CodeData
  attr_accessor :parent
  attr_accessor :path
  attr_accessor :type
  attr_accessor :features

  def initialize(args)
    @parent = args[:parent]
    @path = args[:path]
    @type = args[:type]
    @features = args[:features]
  end
end
