require_relative 'shared/component'

describe Vector, '#z' do
  it_behaves_like :vector_component, :z, 2
end
