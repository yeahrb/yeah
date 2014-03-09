require 'rack'

module Yeah
module Web

class Runner
  def initialize
    Rack::Server.start(app: Web::Server, Port: 1234)
  end
end

end
end
