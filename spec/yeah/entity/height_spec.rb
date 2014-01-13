require_relative 'shared/coordinate'

describe Entity do
  let(:instance) { described_class.new }
  before { instance.size = random_vector }

  describe '#height' do
    subject { instance.height }

    it { should eq instance.size[1] }
  end

  describe '#height=' do
    subject { instance.method(:height=) }

    it_behaves_like 'writer', Random.rand(10)
  end
end
