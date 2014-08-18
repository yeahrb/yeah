module Yeah
module Web
class Keyboard
  KEY_MAP = {
    0   => :fn,
    8   => :backspace,
    9   => :tab,
    13  => :enter,
    16  => :shift,
    17  => :ctrl,
    18  => :alt,
    19  => :pause,
    20  => :caps_lock,
    27  => :escape,
    33  => :page_up,
    34  => :page_down,
    35  => :end,
    36  => :home,
    37  => :left,
    38  => :up,
    39  => :right,
    40  => :down,
    45  => :insert,
    46  => :delete,
    48  => 0,
    49  => 1,
    50  => 2,
    51  => 3,
    52  => 4,
    53  => 5,
    54  => 6,
    55  => 7,
    56  => 8,
    57  => 9,
    65  => :a,
    66  => :b,
    67  => :c,
    68  => :d,
    69  => :e,
    70  => :f,
    71  => :g,
    72  => :h,
    73  => :i,
    74  => :j,
    75  => :k,
    76  => :l,
    77  => :m,
    78  => :n,
    79  => :o,
    80  => :p,
    81  => :q,
    82  => :r,
    83  => :s,
    84  => :t,
    85  => :u,
    86  => :v,
    87  => :w,
    88  => :x,
    89  => :y,
    90  => :z,
    91  => :super,
    92  => :super,
    96  => :num0,
    97  => :num1,
    98  => :num2,
    99  => :num3,
    100 => :num4,
    101 => :num5,
    102 => :num6,
    103 => :num7,
    104 => :num8,
    105 => :num9,
    106 => :num_asterisk,
    107 => :num_plus,
    109 => :num_minus,
    110 => :num_dot,
    111 => :num_slash,
    112 => :f1,
    113 => :f2,
    114 => :f3,
    115 => :f4,
    116 => :f5,
    117 => :f6,
    118 => :f7,
    119 => :f8,
    120 => :f9,
    121 => :f10,
    122 => :f11,
    123 => :f12,
    144 => :num_lock,
    145 => :scroll_lock,
    186 => :semicolon,
    187 => :equals,
    188 => :comma,
    189 => :minus,
    190 => :dot,
    191 => :slash,
    192 => :backquote,
    219 => :left_bracket,
    220 => :backslash,
    221 => :right_bracket,
    222 => :quote
  }

  def initialize(options = {})
    @ticker = options.fetch(:ticker)
    @pressed_keys = {}
    @released_keys = {}

    %x{
      window.addEventListener('keydown', function(event) {
        #{key = KEY_MAP[`event.keyCode`]}
        if (#{!@pressed_keys[key]}) {
          #{@pressed_keys[key] = @ticker.tick_count}
        }
      });

      window.addEventListener('keyup', function(event) {
        #{key = KEY_MAP[`event.keyCode`]}
        #{@released_keys[key] = @ticker.tick_count}
        #{@pressed_keys[key] = nil}
      });
    }
  end

  def pressing?(key)
    !!@pressed_keys[key] || false
  end

  def pressed?(key)
    @pressed_keys[key] == @ticker.tick_count
  end

  def released?(key)
    @released_keys[key] == @ticker.tick_count
  end
end
end
end
