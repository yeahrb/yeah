describe Game do
  subject { Class.new(described_class) }

  include_examples :has_accessor, :space do
    let(:default) { nil }
    let(:assignables) { [Space] }
  end
end
