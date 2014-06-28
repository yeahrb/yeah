module Yeah
module Web
class Keyboard
  KEYMAP = {
    13 => :enter,
    37 => :left,
    38 => :up,
    39 => :right,
    40 => :down,
    88 => :x,
    90 => :z
  }

  def initialize
    @keys = {}

    %x{
      window.addEventListener('keydown', function(event) {
        #{@keys[KEYMAP[`event.keyCode`]] = true}
      });

      window.addEventListener('keyup', function(event) {
        #{@keys[KEYMAP[`event.keyCode`]] = false}
      });
    }
  end

  def pressing?(key)
    @keys[key] || false
  end
end
end
end
