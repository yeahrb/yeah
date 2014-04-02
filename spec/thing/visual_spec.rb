describe Thing do
  include_examples :has_accessor, :visual do
    let(:default_type) { Invisible }
    let(:assignables) { [Box.new] }
  end

  describe '#visual' do
    it "defaults to <class name>Visual if it exists" do
      class Stuff < described_class; end
      class StuffVisual; end

      Stuff.new.visual.should be_instance_of StuffVisual
    end

    it "does not default to Visual without a class name" do
      class Visual; end
      thing_subclass = Class.new(described_class)

      thing_subclass.new.visual.should_not be_instance_of Visual
    end
  end
end
