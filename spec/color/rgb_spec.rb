describe Color do
  let(:instance) { described_class.new }

  describe '#rgb' do
    it "matches corresponding color methods" do
      methods = %i[red green blue]

      methods.each do |method|
        writer = "#{method}="
        instance.send(writer, Random.rand(10))
      end

      rgb = methods.map { |m| instance.send(m) }

      expect(instance.rgb).to eq rgb
    end
  end

  describe '#rgb=' do
    subject { instance.method(:rgb=) }

    it_behaves_like :writer, [0.25, 0.5, 1.0]
  end
end
