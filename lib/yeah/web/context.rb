module Yeah::Web; class Context
  def initialize
    @canvas = $document['game']
    p @canvas
  end
end; end
