require 'spec_helper'

describe Command do
  let(:modjul) { described_class }

  it { modjul.should be_instance_of Module }

  describe '::new' do
    let(:project_name) { 'dang' }

    it "creates project file structure" do
      Dir.should receive(:mkdir).with("#{project_name}/")

      %i[entities visuals maps assets config].each do |subdir|
        Dir.should receive(:mkdir).with("#{project_name}/#{subdir}/")
      end

      File.should receive(:open).with("#{project_name}/game.rb", 'w')
      # TODO: Test contents of game.rb.

      modjul.new(project_name)
    end
  end
end
