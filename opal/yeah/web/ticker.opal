module Yeah
module Web
class Ticker
  attr_reader :rate, :tick_count, :actual_rate

  def initialize(args = {})
    @rate = args.fetch(:rate, DEFAULT_TICKER_RATE)
    @tick_count = 0
    @actual_rate = 0
    @next_actual_rate = 0
  end

  def on_tick(&block)
    # TODO: add to ticks before yielding
    %x{
      var lastTime = (new Date()).getTime(),
          lastMeasureTime = lastTime,
          elapsed = 0,
          interval = 1000.0 / #{rate},
          currentTime;

      var loop = function() {
        currentTime = new Date().getTime();
        elapsed = currentTime - lastTime;

        if (elapsed > interval) {
          #{yield `elapsed`}

          #@tick_count += 1;
          #@next_actual_rate += 1;

          lastTime = currentTime - (elapsed % interval);
        }

        if (currentTime - lastMeasureTime > 1000) {
          #@actual_rate = #@next_actual_rate;
          #@next_actual_rate = 0;

          lastMeasureTime = currentTime - (currentTime - lastMeasureTime) % 1000;
        }

        window.requestAnimationFrame(loop);
      };

      window.requestAnimationFrame(loop);
    }
  end
end
end
end
