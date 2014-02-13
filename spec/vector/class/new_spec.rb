require_relative 'shared/new'

describe Vector, '::new' do
  it_behaves_like :vector_class_new, :new
end
