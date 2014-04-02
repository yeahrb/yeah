describe Game do
  subject { Class.new(described_class) }

  include_examples :has_accessor, :resolution do
    let(:default) { nil }
    let(:assignables) { [V[200, 300]] }
  end
end
