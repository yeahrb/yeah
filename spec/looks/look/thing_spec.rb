describe Look do
  include_examples :has_accessor, :thing do
    let(:default_type) { Thing }
    let(:assignables) { [Thing.new] }
  end

  describe '#thing=' do
    it "sets #thing's look as self" do
      subject.thing = Thing.new
      subject.thing.look.should eq subject
    end
  end
end
