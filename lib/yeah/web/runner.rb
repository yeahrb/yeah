require 'rack'

class Yeah::Web::Runner
  include Yeah

  def initialize
    Rack::Server.start(app: Web::Server, Port: 1234)
  end
end
