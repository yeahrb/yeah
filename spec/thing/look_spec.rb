describe Thing do
  include_examples :has_accessor, :look do
    let(:default_type) { Look }
    let(:assignables) { [Box.new] }
  end

  describe '#look' do
    it "defaults to <class name>Look if it exists" do
      class Stuff < described_class; end
      class StuffLook < Look; end

      Stuff.new.look.should be_instance_of StuffLook
    end
  end

  describe '#look=' do
    it "sets #look's thing as self" do
      subject.look = Look.new
      subject.look.thing.should eq subject
    end

    it "sets default #look's thing as self" do
      subject.look.thing.should eq subject
    end
  end
end
