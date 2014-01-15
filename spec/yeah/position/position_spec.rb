require_relative 'shared/klass'

describe Position do
  include_context :position_klass
  let(:instance) { klass.new }

  describe '#position' do
    subject { instance.position }

    it { should be_instance_of Vector }
    its(:components) { should eq [0, 0, 0] }
  end

  describe '#position=' do
    subject { instance.method(:position=) }

    it_behaves_like 'writer', random_vector
  end
end
