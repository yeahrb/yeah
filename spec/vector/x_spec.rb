describe Vector do
  include_examples :has_accessor, :x do
    let(:default) { subject.components[0] }
    let(:assignables) { [99] }
  end
end
