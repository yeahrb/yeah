module Yeah
  VERSION = '0.2.1'
end

require 'monkey/numeric'

yeah_requires = %i(vector color surface rectangle entity map desktop game)
yeah_requires.each do |req|
  require "yeah/#{req}"
end
