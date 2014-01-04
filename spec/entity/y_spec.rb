require_relative 'shared/coordinate'

describe Entity, '#y' do
  it_behaves_like :entity_coordinate, :y
end

describe Entity, '#y=' do
  it_behaves_like :entity_coordinate=, :y
end
