describe Color do
  let(:instance) { described_class.new }

  describe '#rgba' do
    it "matches corresponding color methods" do
      methods = %i[red green blue alpha]

      methods.each do |method|
        writer = "#{method}="
        instance.send(writer, Random.rand(10))
      end

      rgba = methods.map { |m| instance.send(m) }

      expect(instance.rgba).to eq rgba
    end
  end

  describe '#rgba=' do
    subject { instance.method(:rgba=) }

    it_behaves_like 'writer', [0.25, 0.5, 1.0, 0.99]
  end
end
