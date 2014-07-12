module Yeah
module Web
class Ticker
  attr_reader :rate

  def initialize(args = {})
    @rate = args.fetch(:rate, DEFAULT_TICKER_RATE)
  end

  def on_tick(&block)
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
