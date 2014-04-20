describe Space do
  describe '#things' do
    its(:things) { should be_empty }
  end

  describe '#things=' do
    include_examples :writer, :things=, []

    it "assigns each item's #space as self" do
      things = [Thing.new, Thing.new]
      subject.things = things

      things.each { |e| e.space.should eq subject }
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

      subject.things = things_hash

      expect(subject.things[0]).to be_instance_of SubThingA
      expect(subject.things[1]).to be_instance_of SubThingB
      expect(subject.things[2]).to be_instance_of SubThingB

      expect(subject.things[0].position).to eq V[50, 50]
      expect(subject.things[1].position).to eq V[25, 25]
      expect(subject.things[2].position).to eq V[75, 75]
    end
  end
end
