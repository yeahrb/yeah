describe Vector do
  include_examples :has_accessor, :y do
    let(:default) { subject.components[1] }
    let(:assignables) { [99] }
  end
end
