require_relative 'shared/klass'

describe Boundary do
  include_context :boundary_klass
  let(:instance) { klass.new }
  before { instance.size = random_vector }

  describe '#width' do
    subject { instance.width }

    it { should eq instance.size[0] }
  end

  describe '#width=' do
    subject { instance.method(:width=) }

    it_behaves_like 'writer', Random.rand(10)
  end
end
