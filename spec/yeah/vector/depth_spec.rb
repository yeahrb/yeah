require_relative 'shared/component'

describe Vector, '#depth' do
  it_behaves_like :vector_component, :depth, 2
end
