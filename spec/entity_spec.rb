require 'spec_helper'

describe Entity do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    it { klass.new.should be_instance_of klass }
    it { klass.new.position.should eq V[0, 0, 0] }
    it { klass.new(V[2, 4, 8]).position.should eq V[2, 4, 8] }
  end

  describe '#stage' do
    subject { instance.stage }

    it { should eq nil }
  end

  describe '#stage=' do
    subject { instance.method(:stage=) }
    it_behaves_like 'writer', Stage.new

    it "pushes self to value's #entities" do
      instance.stage = Stage.new
      instance.stage.entities.last.should eq instance
    end

    it "doesn't push self to value's #entities if already there" do
      stage = Stage.new
      stage.entities << instance
      instance.stage = stage
      stage.entities.count.should eq 1
    end
  end

  describe '#game' do
    subject(:game) { instance.game }

    it { should eq nil }

    it "is #stage's game" do
      instance.stage = Stage.new
      instance.game.should eq instance.stage.game
    end
  end

  describe '#position' do
    subject { instance.position }

    it { should be_instance_of Vector }
    its(:components) { should eq [0, 0, 0] }
  end

  describe '#position=' do
    subject { instance.method(:position=) }
    it_behaves_like 'writer', V.random(100)
  end

  [:x, :y, :z].each do |method_name|
    describe "##{method_name}" do
      it "is #position.#{method_name}" do
        instance.position.send("#{method_name}=", Random.rand(100))
        instance.send(method_name).should eq instance.position.send(method_name)
      end
    end

    describe "##{method_name}=" do
      it "assigns #position.#{method_name}" do
        value = Random.rand(100)
        instance.send("#{method_name}=", value)
        instance.position.send(method_name).should eq value
      end
    end
  end

  describe '#size' do
    subject { instance.size }
    it { should eq V[] }

    it "is implied by visual size" do
      size = V[10, 10]
      instance.visual = Rectangle.new(size)
      instance.size.should eq size
    end

    it "is not implied by visual size after size is explicitly set" do
      size = V[10, 10]
      instance.size = size
      instance.visual = Rectangle.new(size*2)
      instance.size.should eq size
    end
  end

  describe 'size=' do
    subject { instance.method(:size=) }
    it_behaves_like 'writer', V.random(10)
  end

  describe '#visual' do
    subject { instance.visual }
    it { should eq nil }
  end

  describe '#visual=' do
    subject { instance.method(:visual=) }
    it_behaves_like 'writer', Rectangle.new(V[50, 50])
  end

  describe '#update' do
    subject { instance.method(:update) }
    its(:call) { should eq nil }
  end

  describe '#render' do
    subject { instance.method(:render) }

    its(:call) { should eq nil }

    it "gets #render of #visual if it exists" do
      instance.visual = Rectangle.new
      instance.visual.should receive(:render)
      instance.render
    end
  end

  describe '#pressing?' do
    subject { instance.method(:pressing?) }

    it { instance.protected_methods.should include :pressing? }

    it { expect {instance.send(:pressing?)}.to raise_error ArgumentError }

    it "defers to #game#pressing?" do
      instance.stage = Stage.new
      instance.stage.game = Game.new
      instance.game.should receive(:pressing?).with(:e)
      instance.send(:pressing?, :e)
    end
  end

  describe '#control' do
    # TODO: make this unnecessary
    before do
      instance.stage = Stage.new
      instance.stage.game = Game.new
      DesktopWindow.class_eval "def each_tick; yield; end"
      instance.game.start
    end

    describe "one pressable" do
      it "adds to attribute if pressed" do
        instance.game.context.press :q
        instance.control 'position.y', :q, 2
        instance.position.y.should eq 2
      end

      it "subtracts from attribute if not pressed" do
        instance.control 'position.y', :q, 2
        instance.position.y.should eq -2
      end
    end

    describe "two pressables" do
      it "does nothing by default" do
        instance.control 'position.y', [:q, :e], 2
        instance.position.y.should eq 0
      end

      it "adds to attribute if first is pressed" do
        instance.game.context.press :q
        instance.control 'position.y', [:q, :e], 2
        instance.position.y.should eq 2
      end

      it "subtracts from attribute if second is pressed" do
        instance.game.context.press :e
        instance.control 'position.y', [:q, :e], 2
        instance.position.y.should eq -2
      end
    end
  end

  describe 'subpositions' do
    describe '#right' do
      it { instance.right.should eq 0 }

      it "is x of right edge within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.right.should eq 14
      end
    end

    describe '#left' do
      it { instance.left.should eq 0 }

      it "is x of left edge within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.left.should eq 10
      end
    end

    describe '#top' do
      it { instance.top.should eq 0 }

      it "is y of top edge within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.top.should eq 12
      end
    end

    describe '#bottom' do
      it { instance.bottom.should eq 0 }

      it "is y of bottom edge within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.bottom.should eq 10
      end
    end

    describe '#front' do
      it { instance.front.should eq 0 }

      it "is y of front edge within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10, 10]
        instance.size = V[4, 2, 8]
        instance.front.should eq 18
      end
    end

    describe '#back' do
      it { instance.back.should eq 0 }

      it "is y of back edge within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10, 10]
        instance.size = V[4, 2, 8]
        instance.back.should eq 10
      end
    end

    describe '#center' do
      it { instance.center.should eq V[] }

      it "is position of center within stage" do
        instance.stage = Stage.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.center.should eq V[12, 11]
      end
    end
  end

  describe '#touching?' do
    describe "with Entity instance" do
      let(:instance2) { Entity.new }

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
  end

  describe "with Entity subclass" do
    it "is true when edges touch any instance of given class" do
      instance2 = Entity.new
      instance2.stage = instance.stage = Stage.new
      instance2.size = instance.size = V[5, 5]
      instance.touching?(Entity).should eq true
    end

    it "is false without a stage" do
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
      instance2.stage = instance.stage = Stage.new
      instance2.size = instance.size = V[5, 5]
      instance2.touching?(subentity_class).should eq false
    end
  end
end
