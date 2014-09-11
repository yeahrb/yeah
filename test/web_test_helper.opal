%x{
  window.AudioContext = window.AudioContext || Object;
  document.body.appendChild(document.createElement('canvas'));
}

require 'yeah/web/dependencies'

require 'minitest'
include Minitest

require 'yeah/web'
require 'yeah/web/setup'
