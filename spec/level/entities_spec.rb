describe Level do
  let(:instance) { described_class.new }

  describe '#things' do
    subject { instance.things }

    it { should eq [] }
  end

  describe '#things=' do
    subject { instance.method(:things=) }

    it_behaves_like 'writer', [Thing.new(Random.rand(10))]

    it "assigns each item's #level as self" do
      things = [Thing.new, Thing.new]
      instance.things = things

      things.each { |e| e.level.should eq instance }
    end
  end
end
