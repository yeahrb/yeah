module Yeah
module Web
class Ticker
  attr_reader :rate, :tick_count

  def initialize(args = {})
    @rate = args.fetch(:rate, DEFAULT_TICKER_RATE)
    @tick_count = 0
  end

  def on_tick(&block)
    # TODO: add to ticks before yielding
    %x{
      var lastTime = (new Date()).getTime(),
          elapsed = 0,
          interval = 1/#{rate},
          currentTime;

      var loop = function() {
        currentTime = new Date().getTime();
        elapsed = (currentTime - lastTime) / 1000;

        if (elapsed > interval) {
          #{yield `elapsed`}

          #{@tick_count += 1}

          lastTime = currentTime - (elapsed % interval);
        }

        window.requestAnimationFrame(loop);
      };

      window.requestAnimationFrame(loop);
    }
  end
end
end
end
