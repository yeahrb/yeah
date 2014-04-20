# TODO: cleanup all this

require 'pathname'
require 'fileutils'
require 'json'
require 'yeah/utility'
require 'opal'
require 'opal/sprockets'

module Yeah
module Web

class Builder
  class << self
    def build(path = './builds/web/')
      @build_path = Pathname.new(path)

      make_build_path
      build_dependencies
      build_project
      copy_player
      copy_js_dependencies
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

      # Combine web context's files.
      yeah_web_context = ''
      %i[screen mouse].each do |file|
        yeah_web_context << env["yeah/platforms/web/context/#{file}"].to_s
      end
      yeah_web_context << env["yeah/platforms/web/context"].to_s

      File.write(@build_path.join('opal.js'), opal)
      File.write(@build_path.join('opal_native.js'), opal_native)
      File.write(@build_path.join('yeah.js'), yeah)
      File.write(@build_path.join('yeah_web_context.js'), yeah_web_context)
    end

    def build_project
      project_code = ""

      # Combine all project code.
      %i[looks things].each do |code_type|
        Dir["#{code_type}/*.rb"].each { |p| project_code << File.read(p) }
      end
      project_code << File.read('game.rb')

      # Parse project data.
      project_data = {}
      project_data[:spaces] = {}
      Dir['data/spaces/*.json'].each do |path|
        json = File.read(path)
        key = Pathname(path).basename('.*').to_s.to_sym
        data = JSON.parse(json, symbolize_names: true)

        project_data[:spaces][key] = data
      end

      # Put it all in a wrapper that makes it web-playable.
      wrapper_path = PATH.join('lib', 'yeah', 'platforms', 'web', 'wrapper.rb')
      wrapper = File.read(wrapper_path)
      wrapper_params = {
        project_code: project_code,
        project_data: project_data.to_s,
        project_game: game_class_name
      }

      project_code = wrapper % wrapper_params

      # Compile it into JavaScript.
      compiled_code = Opal.compile(project_code)

      # Save the result.
      File.write(@build_path.join('project.js'), compiled_code)
    end

    def copy_player
      player_path = PATH.join('lib', 'yeah', 'platforms', 'web', 'player.html')
      player = File.read(player_path)

      File.write(@build_path.join('player.html'), player)
    end

    def copy_js_dependencies
      # Only GLMatrix for now.
      web_path = PATH.join('lib', 'yeah', 'platforms', 'web')
      gl_matrix_path = web_path.join('gl-matrix.js')
      gl_matrix = File.read(gl_matrix_path)

      File.write(@build_path.join('gl-matrix.js'), gl_matrix)
    end

    def game_class_name
      Yeah::Project.new.game_class_name
    end
  end
end

end
end
