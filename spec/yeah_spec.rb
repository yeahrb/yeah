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
    it "recursively requires project folders" do
      %i(visuals entities maps).each do |dir|
        modjul.should receive(:require_recursively).with(dir)
      end

      modjul.load_project
    end
  end

  describe '#require_recursively' do
    it "requires given dir recursively" do
      # TODO: specs
    end
  end
end
