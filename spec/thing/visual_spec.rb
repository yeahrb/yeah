describe Thing do
  include_examples :has_accessor, :visual do
    let(:default_type) { Invisible }
    let(:assignables) { [Box.new] }
  end

  describe '#visual' do
    it "defaults to <class name>Visual if it exists" do
      class Stuff < described_class; end
      class StuffVisual < Invisible; end

      Stuff.new.visual.should be_instance_of StuffVisual
    end

    it "does not default to Visual when lacking a class name" do
      class Visual; end
      thing_subclass = Class.new(described_class)

      thing_subclass.new.visual.should_not be_instance_of Visual
    end
  end

  describe '#visual=' do
    it "sets #visual's thing as self" do
      subject.visual = Invisible.new
      subject.visual.thing.should eq subject
    end

    it "sets default #visual's thing as self" do
      subject.visual.thing.should eq subject
    end
  end
end
