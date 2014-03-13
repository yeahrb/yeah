require_relative 'shared/rgb'

describe Color, '#to_a' do
  it_behaves_like :color_rgb, :to_a
end
