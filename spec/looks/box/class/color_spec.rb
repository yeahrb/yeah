describe Box do
  subject { Class.new(described_class) }

  describe '::color' do
    its(:color) { should eq Color[] }
  end

  describe '::color=' do
    include_examples :writer, :color=
  end
end
