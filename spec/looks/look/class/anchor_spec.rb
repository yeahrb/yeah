describe Look do
  subject { Class.new(described_class) }

  describe '::anchor' do
    include_examples :reader, :anchor

    its(:anchor) { should be_nil }
  end

  describe '::anchor=' do
    include_examples :writer, :anchor=
  end
end
