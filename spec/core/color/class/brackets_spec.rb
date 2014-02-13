require_relative 'shared/new'

describe Color, '::[]' do
  it_behaves_like :color_class_new, :[]
end
