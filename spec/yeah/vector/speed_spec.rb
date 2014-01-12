require_relative 'shared/magnitude'

describe Vector, '#speed' do
  it_behaves_like :vector_magnitude, :speed
end
