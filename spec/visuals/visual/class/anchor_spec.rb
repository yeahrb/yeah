describe Visual do
  subject { Class.new(described_class) }

  include_examples :has_accessor, :anchor do
    let(:default) { nil }
    let(:assignables) { [V[1, 2, 3]] }
  end
end
