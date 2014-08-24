require 'pathname'
require 'fileutils'
require 'erb'
require 'opal'

module Yeah
module Web

# `Web::Builder` builds standalone game packages playable through a web
# browser. To build a game, enter `yeah build` in a command-line within a game
# project.
# @todo Clean up internals.
class Builder
  # @return [nil]
  # Build game in working directory.
  def build
    # Make build directories.
    FileUtils.mkpath 'build/web/assets/yeah/web'


    # Set up code compiler.
    @compiler = Opal::Environment.new

    # Append standard library code paths.
    $LOAD_PATH.each { |p| @compiler.append_path(p) }

    # Append gem code paths.
    @compiler.append_path gem_path.join('lib')
    @compiler.append_path gem_path.join('opal')

    # Append game code and asset paths.
    @compiler.append_path 'assets'
    @compiler.append_path 'code'


    # Build runner.
    runner_path = Pathname.new(__FILE__).join('..', 'runner.html.erb')
    html = ERB.new(File.read(runner_path)).result(binding)
    File.write('build/web/runner.html', html)


    puts "Built game package to `build/web/`."
  end

  private

  def asset_include_tags
    paths = Dir['assets/**/*'].select { |p| File.file? p }

    paths.map do |path|
      destination = Pathname.new("build/web").join(path)
      FileUtils.mkpath(destination.join('..'))
      FileUtils.cp(path, destination)

      case path
      when /\.(ogg|wav|mp3)$/
        "<audio src=\"./#{path}\"></audio>"
      else
        "<img src=\"./#{path}\" />"
      end
    end.join("\n")
  end

  def script_include_tag(path)
    File.write("build/web/assets/#{path}.js", @compiler[path].to_s)

    "<script src=\"./assets/#{path}.js\"></script>"
  end

  def gem_path
    @gem_path ||= Pathname.new(__FILE__).join('..', '..', '..', '..')
  end
end

end
end
