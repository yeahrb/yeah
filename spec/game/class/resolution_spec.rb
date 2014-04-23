describe Game do
  subject { Class.new(described_class) }

  describe '::resolution' do
    include_examples :reader, :resolution

    its(:resolution) { should eq V[640, 360] }
  end

  describe '::resolution=' do
    include_examples :writer, :resolution=
  end
end
