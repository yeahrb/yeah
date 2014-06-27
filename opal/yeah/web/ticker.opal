module Yeah
module Web
class Ticker
  def on_tick(&block)
    %x{
      var loop = function() {
        #{yield}

        window.requestAnimationFrame(loop);
      };

      window.requestAnimationFrame(loop);
    }
  end
end
end
end
