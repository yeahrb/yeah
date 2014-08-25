require 'pathname'
require 'fileutils'
require 'erb'
require 'opal'

module Yeah
module Web

# `Web::Builder` builds a game into a standalone package that is playable
# through a web browser. To build a game, enter `yeah build` in a command-line
# within a game project.
# @todo DRY internals with `Web::Server`.
class Builder
  # @return [nil]
  # Build game in working directory.
  def build
    make_build_dirs
    setup_compiler
    compile

    puts "Built game package to `builds/web`."
  end

  private

  def make_build_dirs
    # Make build directories.
    FileUtils.mkpath 'builds/web/assets/yeah/web'
  end

  def setup_compiler
    @compiler = Opal::Environment.new

    # Append standard library code paths.
    $LOAD_PATH.each { |p| @compiler.append_path(p) }

    # Append gem code paths.
    @compiler.append_path gem_path.join('lib')
    @compiler.append_path gem_path.join('opal')

    # Append game code and asset paths.
    @compiler.append_path 'assets'
    @compiler.append_path 'code'
  end

  def compile
    runner_path = Pathname.new(__FILE__).join('..', 'runner.html.erb')
    html = ERB.new(File.read(runner_path)).result(binding)
    File.write('build/web/runner.html', html)
  end

  def asset_include_tags
    paths = Dir['assets/**/*'].select { |p| File.file? p }

    paths.map do |path|
      copy_asset(path)

      case path
      when /\.(ogg|wav|mp3)$/
        "<audio src=\"./#{path}\"></audio>"
      when /\.(otf|ttf|woff)$/
        "<style>" +
        "@font-face { font-family: \"#{path[7..-1]}\"; src: url(#{path}) }" +
        "</style>"
      else
        "<img src=\"./#{path}\" />"
      end
    end.join("\n")
  end

  def script_include_tag(path)
    build_script(path)

    "<script src=\"./assets/#{path}.js\"></script>"
  end

  def copy_asset(path)
    destination_path = build_path.join(path)
    FileUtils.mkpath(destination_path.join('..'))
    FileUtils.cp(path, destination_path)
  end

  def build_script(path)
    File.write(build_path.join("assets/#{path}.js"), @compiler[path].to_s)
  end

  def build_path
    @build_path ||= Pathname.new("build/web")
  end

  def gem_path
    @gem_path ||= Pathname.new(__FILE__).join('..', '..', '..', '..')
  end
end

end
end
