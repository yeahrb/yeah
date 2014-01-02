require_relative 'shared/components'

describe Vector, '#to_a' do
  it_behaves_like :vector_components, :to_a
end
