require_relative 'shared/klass'

describe Position do
  include_context :position_klass
  let(:instance) { klass.new }
  before { instance.coordinates = random_vector }

  describe '#z' do
    subject { instance.z }

    it { should eq instance.coordinates[2] }
  end

  describe '#z=' do
    subject { instance.method(:z=) }

    it_behaves_like 'writer', Random.rand(10)
  end
end
