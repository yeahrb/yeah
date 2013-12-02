require 'spec_helper'

describe Command do
  let(:modjul) { described_class }

  it { modjul.should be_instance_of Module }

  describe '::new' do
    let(:project_name) { 'dang' }

    it "defers to Utility::make_project" do
      Utility.should receive(:make_project).with(project_name)

      modjul.new(project_name)
    end
  end

  describe '::run' do
    it "loads project" do
      Utility.stub(:run_project)
      Utility.should receive(:load_project)

      modjul.run
    end

    it "runs project" do
      Utility.stub(:load_project)
      Utility.should receive(:run_project)

      modjul.run
    end
  end
end
