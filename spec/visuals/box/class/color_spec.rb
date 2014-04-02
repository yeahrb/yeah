describe Box do
  subject { Class.new(described_class) }

  include_examples :has_accessor, :color do
    let(:default) { nil }
    let(:assignables) { [Color[0.1, 0.2, 0.3]] }
  end
end
