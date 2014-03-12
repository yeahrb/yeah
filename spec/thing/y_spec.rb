require_relative 'shared/coordinate'

describe Thing do
  let(:instance) { described_class.new }
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
