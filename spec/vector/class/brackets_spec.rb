require_relative 'shared/new'

describe Vector, '::[]' do
  it_behaves_like :vector_class_new, :[]
end
