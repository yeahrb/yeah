module Yeah
  VERSION = '0.2.0'
end

requires = %i(vector color surface rectangle entity map desktop game)
requires.each do |req|
  require "yeah/#{req}"
end
