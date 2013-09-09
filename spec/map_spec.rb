require 'spec_helper'

describe Yeah::Map do
  let(:klass) { Yeah::Map }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '#background' do
    subject(:background) { instance.background }

    it { should eq Yeah::Color[] }
  end

  describe '#background=' do
    subject(:method) { instance.method(:background=) }

    it "assigns #background" do
      color = Yeah::Color[(1..4).map { Random.rand(255) }]
      method.call(color)
      instance.background.should eq color
    end
  end
end
