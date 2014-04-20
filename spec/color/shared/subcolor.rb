shared_examples :color_subcolor do |method_name|
  include_examples :has_accessor, :blue do
    let(:default) { 0 }
    let(:assignables) { [0.5] }
  end
end
