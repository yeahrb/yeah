describe Box do
  subject { Class.new(described_class) }

  describe '::color' do
    its(:color) { should be_nil }
  end

  describe '::color=' do
    include_examples :writer, :color=
  end
end
