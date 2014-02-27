require 'rack'

module Yeah
class Web::Runner
  def initialize
    Rack::Server.start(app: Web::Server, Port: 1234)
  end
end
end
