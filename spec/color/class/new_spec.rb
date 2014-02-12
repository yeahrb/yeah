require_relative 'shared/new'

describe Color, '::new' do
  it_behaves_like :color_class_new, :new
end
