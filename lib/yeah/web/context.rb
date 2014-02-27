module Yeah
class Web::Context
  def initialize
    @canvas = $document['game']
    p @canvas
  end
end
end
