# TODO: cleanup all this

require 'pathname'
require 'fileutils'
require 'yeah/utility'
require 'opal'
require 'opal/sprockets'

module Yeah
module Web

class Builder
  class << self
    def build(path = './build/web/')
      @build_path = Pathname.new(path)

      make_build_path
      build_dependencies
      build_project
      make_player
    end

    private

    def make_build_path
      FileUtils.mkpath(@build_path)
    end

    def build_dependencies
      env = Opal::Environment.new
      env.use_gem 'yeah'

      opal = env['opal'].to_s
      opal_native = env['native'].to_s
      yeah = env['yeah'].to_s
      yeah_web_context = env['yeah/web/context'].to_s

      File.write(@build_path.join('opal.js'), opal)
      File.write(@build_path.join('opal_native.js'), opal_native)
      File.write(@build_path.join('yeah.js'), yeah)
      File.write(@build_path.join('yeah_web_context.js'), yeah_web_context)
    end

    def build_project
      project_code = ""

      Dir['things/*.rb'].each { |f| project_code << File.read(f) }
      Dir['levels/*.rb'].each { |f| project_code << File.read(f) }
      project_code << File.read('game.rb')

      wrapper_path = PATH.join('lib', 'yeah', 'web', 'wrapper.rb')
      wrapper = File.read(wrapper_path)
      wrapper_params = {
        project_code: project_code,
        project_game: game_class_name
      }
      project_code = wrapper % wrapper_params

      compiled_code = Opal.compile(project_code)
      compiled_code_path = @build_path.join('project.js')

      File.write(compiled_code_path, compiled_code)
    end

    def make_player
      player_path = PATH.join('lib', 'yeah', 'web', 'player.html')
      player = File.read(player_path)

      File.write(@build_path.join('player.html'), player)
    end

    def game_class_name
      Yeah::Project.new.game_class_name
    end
  end
end

end
end
