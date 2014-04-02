describe Box do
  include_examples :has_accessor, :color do
    let(:default) { Color[0, 0, 0] }
    let(:assignables) { [Color[0.9, 0.5, 0.3]] }
  end
end
