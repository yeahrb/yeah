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

    it_behaves_like 'writer', Yeah::Color[*[Random.rand(255)]*4]
  end
end
