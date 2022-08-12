
class MapData
  attr_accessor :lang, :context, :version
  attr_accessor :concepts, :codes

  def initialize(args)
    @lang = args[:lang]
    @context = args[:context]
    @version = args[:version]

    @concepts = []
    @codes = []
  end

end
