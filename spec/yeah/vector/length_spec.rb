require_relative 'shared/magnitude'

describe Vector, '#length' do
  it_behaves_like :vector_magnitude, :length
end
