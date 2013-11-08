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

  describe '#game' do
    subject { instance.game }

    it { should eq nil }
  end

  describe '#game=' do
    subject { instance.method(:game=) }
    it_behaves_like 'writer', Game.new

    it "pushes self to value's #entities" do
      instance.game = Game.new
      instance.game.entities.last.should eq instance
    end

    it "doesn't push self to value's #entities if already there" do
      game = Game.new
      game.entities << instance
      instance.game = game
      game.entities.count.should eq 1
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
    it { should eql nil }

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

  describe '#state' do
    subject { instance.state }
    it { should eql nil }
  end

  describe 'state=' do
    subject { instance.method(:state=) }
    it_behaves_like 'writer', :run
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

  describe '#draw' do
    subject { instance.method(:draw) }

    its(:call) { should eq nil }

    it "calls #draw method of #visual if it exists" do
      instance.visual = Rectangle.new
      instance.visual.should receive(:draw)
      instance.draw
    end
  end

  describe '#pressing?' do
    subject { instance.method(:pressing?) }

    it { expect {instance.pressing?}.to raise_error ArgumentError }

    it "defers to #game#pressing?" do
      instance.game = Game.new
      instance.game.should receive(:pressing?).with(:e)
      instance.pressing? :e
    end
  end

  describe '#control' do
    before { instance.game = Game.new }

    describe "one pressable" do
      it "adds to attribute if pressed" do
        instance.game.platform.press :q
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
        instance.game.platform.press :q
        instance.control 'position.y', [:q, :e], 2
        instance.position.y.should eq 2
      end

      it "subtracts from attribute if second is pressed" do
        instance.game.platform.press :e
        instance.control 'position.y', [:q, :e], 2
        instance.position.y.should eq -2
      end
    end
  end

  describe 'edges and center' do
    describe '#right' do
      it { instance.right.should eq nil }

      it "is x of right edge within game" do
        instance.game = Game.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.right.should eq 14
      end
    end

    describe '#left' do
      it { instance.left.should eq nil }

      it "is x of left edge within game" do
        instance.game = Game.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.left.should eq 10
      end
    end

    describe '#top' do
      it { instance.top.should eq nil }

      it "is y of top edge within game" do
        instance.game = Game.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.top.should eq 12
      end
    end

    describe '#bottom' do
      it { instance.bottom.should eq nil }

      it "is y of bottom edge within game" do
        instance.game = Game.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.bottom.should eq 10
      end
    end

    describe '#center' do
      it { instance.center.should eq nil }

      it "is position of center within game" do
        instance.game = Game.new
        instance.position = V[10, 10]
        instance.size = V[4, 2]
        instance.center.should eq V[12, 11]
      end
    end
  end
end
