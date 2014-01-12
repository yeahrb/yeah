require_relative 'shared/magnitude'

describe Vector, '#magnitude' do
  it_behaves_like :vector_magnitude, :magnitude
end
