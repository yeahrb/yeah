describe Utility, '::generate_files_from_structure' do
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

    described_class.generate_files_from_structure(structure)
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

    described_class.generate_files_from_structure(structure)
  end

  it "accepts symbols as file keys" do
    structure = {
      hello: 'sup man'
    }

    expect { described_class.generate_files_from_structure(structure) }.to_not raise_error
  end

  it "recursively creates directories" do
    structure = {}
    structure[:one] = {}
    structure[:one][:two] = {}
    structure[:one][:two][:three] = {}

    %w[one/ one/two/ one/two/three/].each do |dir|
      Dir.should receive(:mkdir).with(dir)
    end

    described_class.generate_files_from_structure(structure)
  end

  it "creates files inside directories" do
    structure = {
      i_am_a_directory: {
        and_i_am_a_file: "See? File."
      }
    }

    File.should receive(:open).with('i_am_a_directory/and_i_am_a_file', 'w')

    described_class.generate_files_from_structure(structure)
  end
end
