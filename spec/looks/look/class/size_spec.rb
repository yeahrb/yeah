describe Look do
  subject { Class.new(described_class) }

  describe '::size' do
    its(:size) { should be_nil }
  end

  describe '::size=' do
    include_examples :writer, :size=
  end
end
