require_relative 'shared/component'

describe Vector, '#width' do
  it_behaves_like :vector_component, :width, 0
end
