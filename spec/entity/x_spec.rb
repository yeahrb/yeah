require_relative 'shared/coordinate'

describe Entity, '#x' do
  it_behaves_like :entity_coordinate, :x
end

describe Entity, '#x=' do
  it_behaves_like :entity_coordinate=, :x
end
