require 'spec_helper'

describe Map do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '#background' do
    subject(:background) { instance.background }

    it { should eq Color[] }
  end

  describe '#background=' do
    subject(:method) { instance.method(:background=) }

    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end
end
