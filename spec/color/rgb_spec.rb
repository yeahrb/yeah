require_relative 'shared/rgb'

describe Color do
  include_examples :has_accessor, :rgb do
    let(:default) { [0, 0, 0] }
    let(:assignables) { [[0.25, 0.5, 1.0]] }
  end

  describe '#rgb' do
    it_behaves_like :color_rgb, :rgb
  end
end
