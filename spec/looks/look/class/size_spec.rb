describe Look do
  subject { Class.new(described_class) }

  describe '::size' do
    include_examples :reader, :size

    its(:size) { should eq V[] }
  end

  describe '::size=' do
    include_examples :writer, :size=
  end
end
