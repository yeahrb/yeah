require_relative 'shared/klass'

describe Position do
  include_context :position_klass
  let(:instance) { klass.new }
  before { instance.position = random_vector }

  describe '#y' do
    subject { instance.y }

    it { should eq instance.position[1] }
  end

  describe '#y=' do
    subject { instance.method(:y=) }

    it_behaves_like 'writer', Random.rand(10)
  end
end
