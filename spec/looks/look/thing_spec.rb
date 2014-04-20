describe Look do
  describe '#thing' do
    its(:thing) { should be_instance_of Thing }
  end

  describe '#thing=' do
    include_examples :writer, :thing=, Thing.new

    it "sets #thing's look as self" do
      subject.thing = Thing.new
      subject.thing.look.should eq subject
    end
  end
end
