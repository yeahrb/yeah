describe DesktopWindow do
  let(:instance) { described_class.new }

  describe '#tickrate' do
    subject { instance.tickrate }
    its(:round) { should eq 30 }
  end

  describe '#tickrate=' do
    subject { instance.method(:tickrate=) }

    it_behaves_like 'writer', 60

    it "sets @clock#target_framerate" do
      tickrate = Random.rand(30) + 30
      clock = instance.instance_variable_get(:@clock)
      instance.tickrate = tickrate

      clock.target_framerate.round.should eq tickrate
    end
  end
end
