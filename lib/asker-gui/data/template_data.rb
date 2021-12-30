
class TemplatesData
  attr_accessor :parent
  attr_accessor :var_name
  attr_accessor :var_values
  attr_accessor :rows

  def initialize(args)
    @parent = args[:parent]
    @var_name = args[:var_name]
    @var_values = args[:var_values]
    @rows = []
  end
end
