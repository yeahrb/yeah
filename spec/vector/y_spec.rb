require_relative 'shared/component'

describe Vector, '#y' do
  it_behaves_like :vector_component, :y, 1
end
