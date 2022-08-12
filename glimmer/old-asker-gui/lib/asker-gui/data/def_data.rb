
class DefData
  attr_accessor :parent
  attr_accessor :type
  attr_accessor :value

  def initialize(args)
    @parent = args[:parent]
    @type = args[:type] || ''
    @value = args[:value]
  end
end
