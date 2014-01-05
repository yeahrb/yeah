describe Vector, '::random' do
  let(:max) { 10 }

  it "is a Vector with components between 0 and a given max" do
    random_vector = described_class.random(max, max, max)

    random_vector.components.each do |component|
      expect(component).to_not be > max
      expect(component).to_not be < 0
    end
  end
end
