describe Space do
  include_examples :has_accessor, :background do
    let(:default) { Color[] }
    let(:assignables) { [Color[0.1, 0.2, 0.4], [0.1, 0.2, 0.4]] }
    let(:coerce_type) { Color }
  end
end
