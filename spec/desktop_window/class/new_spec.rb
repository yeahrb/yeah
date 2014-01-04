describe DesktopWindow, '::new' do
  subject(:method) { described_class.method(:new) }

  it { described_class.new.resolution.should eq V[320, 180] }

  it "accepts V as resolution argument" do
    vector = V.random(250, 250) + V[1, 1]
    desktop = described_class.new(vector)
    desktop.resolution.should eq vector
    desktop.screen.size.should eq vector[0..1]
  end

  it { described_class.new.instance_variables.should include :@clock }

  it do
    clock = described_class.new.instance_variable_get(:@clock)
    clock.should be_instance_of Rubygame::Clock
  end
end
