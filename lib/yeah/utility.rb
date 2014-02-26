require 'pathname'

module Yeah
  PATH = Pathname.new(File.expand_path('../../../', __FILE__))
end

require 'yeah/utility/project'
require 'yeah/utility/command'
