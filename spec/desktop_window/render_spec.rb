describe DesktopWindow, '#render' do
  let(:instance) { described_class.new }

  it { expect { instance.render }.to raise_error ArgumentError }

  it "renders a Surface" do
    surface = Surface.new(instance.resolution)
    surface.fill(Color[255, 255, 0, 255], V[0, 0], V[1, 1])

    screen_update_count = 0
    allow(instance.screen).to receive(:update) { screen_update_count += 1 }

    instance.render(surface)
    instance.screen.get_at([0, 0]).should eq [255, 255, 0, 255]
    screen_update_count.should eq 1
  end
end
