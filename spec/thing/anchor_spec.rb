describe Thing do
  include_examples :has_accessor, :anchor do
    let(:default) { V[] }
    let(:assignables) { [V[5, 4, 9], [5, 4, 9]] }
    let(:coerce_type) { Vector }
  end
end
