require_relative 'shared/component'

describe Vector, '#x' do
  it_behaves_like :vector_component, :x, 0
end
