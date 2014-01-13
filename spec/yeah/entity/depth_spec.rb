require_relative 'shared/coordinate'

describe Entity do
  let(:instance) { described_class.new }
  before { instance.size = random_vector }

  describe '#depth' do
    subject { instance.depth }

    it { should eq instance.size[2] }
  end

  describe '#depth=' do
    subject { instance.method(:depth=) }

    it_behaves_like 'writer', Random.rand(10)
  end
end
