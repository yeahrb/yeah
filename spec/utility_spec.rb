require 'spec_helper'

describe Utility do
  let(:modjul) { described_class }

  it { modjul.should be_instance_of Module }

  describe '::make_file_structure' do
    before do
      Dir.stub(:mkdir)
      File.stub(:open)
    end

    it "creates a directory for each key with an empty hash value" do
      structure = {
        all: {},
        this: {},
        stuff: {}
      }

      structure.keys.each { |k| Dir.should receive(:mkdir).with("#{k}/") }

      modjul.make_file_structure(structure)
    end

    it "creates a file for each key with a content of the value" do
      structure = {
        'game_cheats.txt' => "since when?",
        'hello.rb' => "System.plant_virus(disruption: :maximum)"
      }

      structure.each do |key, value|
        File.should receive(:open).with(key, 'w')
        # TODO: test that it writes
      end

      modjul.make_file_structure(structure)
    end

    it "accepts symbols as file keys" do
      structure = {
        hello: 'sup man'
      }

      expect { modjul.make_file_structure(structure) }.to_not raise_error
    end

    it "recursively creates directories" do
      structure = {}
      structure[:one] = {}
      structure[:one][:two] = {}
      structure[:one][:two][:three] = {}

      %w[one/ one/two/ one/two/three/].each do |dir|
        Dir.should receive(:mkdir).with(dir)
      end

      modjul.make_file_structure(structure)
    end

    it "creates files inside directories" do
      structure = {
        i_am_a_directory: {
          and_i_am_a_file: "See? File."
        }
      }

      File.should receive(:open).with('i_am_a_directory/and_i_am_a_file', 'w')

      modjul.make_file_structure(structure)
    end
  end
end
