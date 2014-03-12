require_relative 'shared/coordinate'

describe Thing do
  let(:instance) { described_class.new }
  before { instance.position = random_vector }

  describe '#z' do
    subject { instance.z }

    it { should eq instance.position[2] }
  end

  describe '#z=' do
    subject { instance.method(:z=) }

    it_behaves_like 'writer', Random.rand(10)
  end
end
