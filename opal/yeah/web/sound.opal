module Yeah
module Web
class Sound < Asset
  `window.AudioContext = window.AudioContext || window.webkitAudioContext`
  CONTEXT = `new AudioContext()`

  def initialize(path)
    super

    %x{
      var request = new XMLHttpRequest();
      request.open('GET', #{full_path}, true);
      request.responseType = 'arraybuffer';

      request.onload = function() {
        #{CONTEXT}.decodeAudioData(request.response, function(buffer) {
          #@buffer = buffer;
        });
      }

      request.send();
    }
  end

  def play
    return unless @buffer

    %x{
      var source = #{CONTEXT}.createBufferSource();
      source.buffer = #@buffer;
      source.connect(#{CONTEXT}.destination);
      source.start(0);
    }
  end
end
end
end
