describe Level do
  let(:instance) { described_class.new }

  describe '#things' do
    subject { instance.things }

    it { should eq [] }
  end

  describe '#things=' do
    subject { instance.method(:things=) }

    it_behaves_like :writer, [Thing.new(Random.rand(10))]

    it "assigns each item's #level as self" do
      things = [Thing.new, Thing.new]
      instance.things = things

      things.each { |e| e.level.should eq instance }
    end

    it "accepts a representative hash" do
      class SubThingA < Thing; end
      class SubThingB < Thing; end

      things_hash = {
        SubThingA: [50, 50],
        SubThingB: [
          [25, 25],
          [75, 75]
        ]
      }

      instance.things = things_hash

      expect(instance.things[0]).to be_instance_of SubThingA
      expect(instance.things[1]).to be_instance_of SubThingB
      expect(instance.things[2]).to be_instance_of SubThingB

      expect(instance.things[0].position).to eq V[50, 50]
      expect(instance.things[1].position).to eq V[25, 25]
      expect(instance.things[2].position).to eq V[75, 75]
    end
  end
end
