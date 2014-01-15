require_relative 'shared/klass'

describe Size do
  include_context :size_klass
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
