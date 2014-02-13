describe Entity, '#touching?' do
  let(:instance) { described_class.new }

  describe "with Entity instance" do
    let(:instance2) { described_class.new }

    it { instance.touching?(instance2).should eq false }

    it "is true when edges touch" do
      should_touch = lambda { instance.touching?(instance2).should eq true }

      instance.size = instance2.size = V[5, 5, 5]
      should_touch.call

      instance.position = V[5, 10, 10]
      should_touch.call

      instance.position = V[10, 5, 10]
      should_touch.call

      instance.position = V[10, 10, 5]
      should_touch.call

      instance.position = V[-5, 10, 10]
      should_touch.call

      instance.position = V[10, -5, 10]
      should_touch.call

      instance.position = V[10, 10, -5]
      should_touch.call
    end

    it "is false when edges don't touch" do
      shouldnt_touch = lambda { instance.touching?(instance2).should eq false }

      shouldnt_touch.call

      instance.size = instance2.size = V[5, 5]

      instance.position = V[6, 6, 6]
      shouldnt_touch.call

      instance.position = V[-6, -6, -6]
      shouldnt_touch.call
    end

    it "is false when it is itself" do
      instance.size = V[5, 5]
      instance.touching?(instance).should eq false
    end
  end

  describe "with Entity subclass" do
    it "is true when edges touch any instance of given class" do
      instance2 = Entity.new
      instance2.area = instance.area = Area.new
      instance2.size = instance.size = V[5, 5]
      instance.touching?(Entity).should eq true
    end

    it "is false without a area" do
      instance2 = Entity.new
      instance2.size = instance.size = V[5, 5]
      instance.touching?(Entity).should eq false
    end

    it "is false when edges don't touch an instance of given class" do
      instance2 = Entity.new
      instance.touching?(Entity).should eq false

      instance2.size = instance.size = V[5, 5]
      instance2.position = V[6, 6]
      instance.touching?(Entity).should eq false
    end

    it "is false for instances of any class other than the given one" do
      subentity_class = Class.new(Entity)
      instance2 = subentity_class.new
      instance2.area = instance.area = Area.new
      instance2.size = instance.size = V[5, 5]
      instance2.touching?(subentity_class).should eq false
    end
  end
end
