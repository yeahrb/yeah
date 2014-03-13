require_relative 'shared/rgb'

describe Color do
  let(:instance) { described_class.new }

  describe '#rgb' do
    it_behaves_like :color_rgb, :rgb
  end

  describe '#rgb=' do
    subject { instance.method(:rgb=) }

    it_behaves_like :writer, [0.25, 0.5, 1.0]
  end
end
