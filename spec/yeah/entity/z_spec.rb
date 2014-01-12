require_relative 'shared/coordinate'

describe Entity, '#z' do
  it_behaves_like :entity_coordinate, :z
end

describe Entity, '#z=' do
  it_behaves_like :entity_coordinate=, :z
end
