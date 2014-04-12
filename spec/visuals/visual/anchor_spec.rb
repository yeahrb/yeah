describe Visual do
  include_examples :has_accessor, :anchor do
    let(:default) { V[] }
    let(:assignables) { [V[3, 5, 9]] }
  end
end
