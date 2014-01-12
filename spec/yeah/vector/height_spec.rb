require_relative 'shared/component'

describe Vector, '#height' do
  it_behaves_like :vector_component, :height, 1
end
