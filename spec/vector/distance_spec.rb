require_relative 'shared/magnitude'

describe Vector, '#distance' do
  it_behaves_like :vector_magnitude, :distance
end
