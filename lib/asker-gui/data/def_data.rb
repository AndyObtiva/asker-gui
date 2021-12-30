
class DefData
  attr_accessor :type, :value

  def initialize(args)
    @parent = args[:parent]
    @type = args[:type] || ''
    @value = args[:value]
  end
end
