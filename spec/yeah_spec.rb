require 'spec_helper'

describe Yeah do
  let(:modjul) { described_class }

  it { modjul.should be_instance_of Module }

  describe '::VERSION' do
    subject { modjul::VERSION }

    it { should be_instance_of String }
    it { should match /[0-9]+\.[0-9]+\.[0-9]+/ }
  end

  describe '#load_project' do
    it "recursively requires every Ruby file in current dir" do
      modjul.should receive(:require_recursively).with('.')
      modjul.load_project
    end
  end

  describe '#require_recursively' do
    it "recursively requires Ruby files in given dir" do
      # TODO
    end
  end
end
