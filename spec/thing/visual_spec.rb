describe Thing do
  include_examples :has_accessor, :visual do
    let(:default_type) { Visual }
    let(:assignables) { [Box.new] }
  end

  describe '#visual' do
    it "defaults to <class name>Visual if it exists" do
      class Stuff < described_class; end
      class StuffVisual < Visual; end

      Stuff.new.visual.should be_instance_of StuffVisual
    end
  end

  describe '#visual=' do
    it "sets #visual's thing as self" do
      subject.visual = Visual.new
      subject.visual.thing.should eq subject
    end

    it "sets default #visual's thing as self" do
      subject.visual.thing.should eq subject
    end
  end
end
