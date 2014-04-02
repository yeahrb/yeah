describe Vector do
  include_examples :has_accessor, :z do
    let(:default) { subject.components[2] }
    let(:assignables) { [99] }
  end
end
