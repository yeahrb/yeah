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
end
