module Yeah
module Web
class Ticker
  def on_tick(&block)
    %x{
      var lastTime = (new Date()).getTime(),
          elapsed = 0,
          currentTime;

      var loop = function() {
        currentTime = new Date().getTime();
        elapsed = (currentTime - lastTime) / 1000;

        #{yield `elapsed`}

        lastTime = currentTime;

        window.requestAnimationFrame(loop);
      };

      window.requestAnimationFrame(loop);
    }
  end
end
end
end
