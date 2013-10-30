require 'spec_helper'

describe Desktop do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.resolution.should eq V[320, 180] }

    it "accepts V as resolution argument" do
      vector = V.random(250, 250)
      desktop = method.call(vector)
      desktop.resolution.should eq vector
      desktop.screen.size.should eq vector[0..1]
    end

    it { method.call.instance_variables.should include :@clock }
    it do
      clock = method.call.instance_variable_get(:@clock)
      clock.should be_instance_of Rubygame::Clock
    end
  end

  describe '#screen' do
    subject { instance.screen }

    it { should be_instance_of Rubygame::Screen }
    its(:size) { should eq [320, 180] }
  end

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq V[320, 180] }
  end

  describe '#resolution=' do
    subject(:method) { instance.method(:resolution=) }

    it_behaves_like 'writer', V.random(250, 250)

    it "changes screen size" do
      resolution = V.random(250, 250) + V[1, 1]
      method.call(resolution)
      instance.screen.size.should eq resolution.components[0..1]
    end
  end

  describe '#render' do
    subject(:method) { instance.method(:render) }

    it { expect { method.call }.to raise_error ArgumentError }

    it "renders a Surface" do
      surface = Surface.new(instance.resolution)
      surface.fill(Color[255, 255, 0, 255], V[0, 0], V[1, 1])

      screen_update_count = 0
      allow(instance.screen).to receive(:update) { screen_update_count += 1 }

      method.call(surface)
      instance.screen.get_at([0, 0]).should eq [255, 255, 0, 255]
      screen_update_count.should eq 1
    end
  end

  describe '#each_tick' do
    subject(:method) { instance.method(:each_tick) }

    it { expect { method.call }.to raise_error LocalJumpError }

    it "repeatedly calls passed block" do
      call_count = 0

      method.call do
        call_count += 1
        break if call_count == 5
      end

      call_count.should eq 5
    end

    it "calls Rubygame::Clock#tick per call" do
      call_count = 0
      tick_call_count = 0
      allow(instance.instance_variable_get(:@clock)).to receive(:tick) do
        tick_call_count += 1
      end

      method.call do
        break if tick_call_count == 5
        call_count += 1
      end

      call_count.should eq 5
      tick_call_count.should eq 5
    end
  end

  describe '#tickrate' do
    subject { instance.tickrate }

    its(:round) { should eq 30 }
  end

  describe '#tickrate=' do
    subject(:method) { instance.method(:tickrate=) }

    it_behaves_like 'writer', 60

    it "sets @clock#target_framerate" do
      tickrate = Random.rand(30) + 30
      clock = instance.instance_variable_get(:@clock)
      method.call(tickrate)

      clock.target_framerate.round.should eq tickrate
    end
  end

  describe "input handling" do
    let(:pressables_keys) { [(:a..:z).to_a, (:A..:Z).to_a, (0..9).to_a,
                            :up, :down, :left, :right].flatten }

    describe '#press' do
      subject(:method) { instance.method(:press) }

      it { expect {method.call}.to raise_error ArgumentError }

      it "causes #pressing?(pressable) to equal true" do
        pressable = pressables_keys.sample
        method.call(pressable)
        instance.pressing?(pressable).should eq true
      end
    end

    describe '#release' do
      subject(:method) { instance.method(:release) }

      it { expect {method.call}.to raise_error ArgumentError }

      it "causes #pressing?(pressable) to equal false" do
        pressable = pressables_keys.sample
        instance.press pressable
        instance.release pressable
        instance.pressing?(pressable).should eq false
      end
    end

    describe '#pressing?' do
      subject(:method) { instance.method(:pressing?) }

      it { expect {method.call}.to raise_error ArgumentError }
      it { pressables_keys.each { |pk| method.call(pk).should eq false } }
    end
  end
end
