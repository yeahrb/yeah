require_relative 'shared/operator'

describe Vector, '#/' do
  it_behaves_like :vector_operator, :/
end
