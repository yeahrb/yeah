describe Area do
  let(:instance) { described_class.new }

  describe '#things' do
    subject { instance.things }

    it { should eq [] }
  end

  describe '#things=' do
    subject { instance.method(:things=) }

    it_behaves_like 'writer', [Thing.new(Random.rand(10))]

    it "assigns each item's #area as self" do
      things = [Thing.new, Thing.new]
      instance.things = things

      things.each { |e| e.area.should eq instance }
    end
  end
end
