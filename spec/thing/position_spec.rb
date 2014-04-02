describe Thing do
  include_examples :has_accessor, :position do
    let(:default_type) { Vector }
    let(:assignables) { [V[1, 2, 3]] }
    let(:coerce_type) { Vector }
  end
end
